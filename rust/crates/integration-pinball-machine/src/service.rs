//! Unified machine data service.

use std::collections::HashMap;
use std::sync::Arc;
use std::time::Duration;

use chrono::Utc;
use integration_core::Cache;
use sqlx::PgPool;
use tracing::info;
use uuid::Uuid;

use crate::{
    FavoriteInfo, Machine, MachineError, MachineWithFavorites, MachinesResponse, OpdbLoader,
    PinballMapClient, PinballMapConfig, PintipsLoader, favorites,
};

/// Response with machines and favorites.
#[derive(Debug, Clone, serde::Serialize)]
pub struct MachinesWithFavoritesResponse {
    pub machines: Vec<MachineWithFavorites>,
    pub machine_count: usize,
    pub last_synced: Option<chrono::DateTime<Utc>>,
}

/// Unified service for machine data from multiple sources.
pub struct MachineDataService {
    pinball_map: PinballMapClient,
    opdb: Option<Arc<OpdbLoader>>,
    pintips: Option<Arc<PintipsLoader>>,
    db_pool: Option<PgPool>,
    cache: Cache<Vec<Machine>>,
    cache_key: String,
}

impl MachineDataService {
    /// Create a new machine data service.
    pub fn new(location_id: i64) -> Result<Self, MachineError> {
        let config = PinballMapConfig::new(location_id);
        let pinball_map = PinballMapClient::new(config)?;

        Ok(Self {
            pinball_map,
            opdb: None,
            pintips: None,
            db_pool: None,
            cache: Cache::new(Duration::from_secs(30 * 60)), // 30 minute cache
            cache_key: format!("machines_{}", location_id),
        })
    }

    /// Create from environment.
    pub fn from_env() -> Result<Self, MachineError> {
        let pinball_map = PinballMapClient::from_env()?;

        let location_id: i64 = std::env::var("PINBALL_MAP_LOCATION_ID")
            .map_err(|_| MachineError::Config("PINBALL_MAP_LOCATION_ID not set".into()))?
            .parse()
            .map_err(|_| MachineError::Config("Invalid PINBALL_MAP_LOCATION_ID".into()))?;

        Ok(Self {
            pinball_map,
            opdb: None,
            pintips: None,
            db_pool: None,
            cache: Cache::new(Duration::from_secs(30 * 60)),
            cache_key: format!("machines_{}", location_id),
        })
    }

    /// Add OPDB enrichment.
    pub fn with_opdb(mut self, loader: Arc<OpdbLoader>) -> Self {
        self.opdb = Some(loader);
        self
    }

    /// Add Pintips data.
    pub fn with_pintips(mut self, loader: Arc<PintipsLoader>) -> Self {
        self.pintips = Some(loader);
        self
    }

    /// Add database pool for favorites support.
    pub fn with_database(mut self, pool: PgPool) -> Self {
        self.db_pool = Some(pool);
        self
    }

    /// Set cache TTL.
    pub fn with_cache_ttl(mut self, ttl: Duration) -> Self {
        self.cache = Cache::new(ttl);
        self
    }

    /// Get all machines with enrichment.
    pub async fn get_machines(&self) -> Result<MachinesResponse, MachineError> {
        // Check cache
        if let Some(cached) = self.cache.get(&self.cache_key) {
            return Ok(MachinesResponse {
                machine_count: cached.len(),
                machines: cached,
                last_synced: Some(Utc::now()), // Approximate
            });
        }

        // Fetch from Pinball Map
        let mut machines = self.pinball_map.get_machines().await?;

        // Enrich with OPDB data
        if let Some(ref opdb) = self.opdb {
            let mut enriched_count = 0;
            for machine in &mut machines {
                let enrichment = if let Some(opdb_id) = &machine.opdb_id {
                    opdb.lookup_by_opdb_id(opdb_id).await.ok().flatten()
                } else if let Some(ipdb_link) = &machine.ipdb_link {
                    // Try to extract IPDB ID from link
                    // TODO: Make this async-friendly - currently just returns None
                    let _ipdb_id = ipdb_link
                        .split("id=")
                        .last()
                        .and_then(|s| s.parse::<i64>().ok());
                    None
                } else {
                    None
                };

                if let Some(data) = enrichment {
                    machine.enrich(data);
                    enriched_count += 1;
                }
            }
            info!(
                enriched_count,
                total = machines.len(),
                "Enriched machines with OPDB data"
            );
        }

        // Add Pintips
        if let Some(ref pintips) = self.pintips {
            let mut tips_count = 0;
            for machine in &mut machines {
                if let Some(opdb_id) = &machine.opdb_id {
                    if let Some(tips) = pintips.get(opdb_id) {
                        machine.tips = Some(tips);
                        tips_count += 1;
                    }
                }
            }
            info!(
                tips_count,
                total = machines.len(),
                "Added Pintips to machines"
            );
        }

        // Cache the result
        self.cache.insert(self.cache_key.clone(), machines.clone());

        Ok(MachinesResponse {
            machine_count: machines.len(),
            machines,
            last_synced: Some(Utc::now()),
        })
    }

    /// Get a single machine by ID.
    pub async fn get_machine(&self, id: &str) -> Result<Option<Machine>, MachineError> {
        let response = self.get_machines().await?;
        Ok(response.machines.into_iter().find(|m| m.id == id))
    }

    /// Force refresh from all sources.
    pub async fn refresh(&self) -> Result<MachinesResponse, MachineError> {
        // Clear cache
        self.cache.remove(&self.cache_key);

        // Refresh OPDB
        if let Some(ref opdb) = self.opdb {
            opdb.refresh().await?;
        }

        // Reload Pintips
        if let Some(ref pintips) = self.pintips {
            pintips.load_all().await?;
        }

        // Get fresh data
        self.get_machines().await
    }

    /// Get machines with favorites enrichment.
    pub async fn get_machines_with_favorites(
        &self,
        tenant_id: &str,
    ) -> Result<MachinesWithFavoritesResponse, MachineError> {
        let response = self.get_machines().await?;

        let favorites_by_machine = if let Some(ref pool) = self.db_pool {
            let all_favorites = favorites::get_all_favorites(pool, tenant_id).await?;
            let mut map: HashMap<String, Vec<FavoriteInfo>> = HashMap::new();
            for fav in all_favorites {
                map.entry(fav.machine_id.clone())
                    .or_default()
                    .push(FavoriteInfo::from(fav));
            }
            map
        } else {
            HashMap::new()
        };

        let machines_with_favorites: Vec<MachineWithFavorites> = response
            .machines
            .into_iter()
            .map(|machine| {
                let favorites = favorites_by_machine
                    .get(&machine.id)
                    .cloned()
                    .unwrap_or_default();
                MachineWithFavorites::new(machine, favorites)
            })
            .collect();

        Ok(MachinesWithFavoritesResponse {
            machine_count: machines_with_favorites.len(),
            machines: machines_with_favorites,
            last_synced: response.last_synced,
        })
    }

    /// Get a single machine with favorites.
    pub async fn get_machine_with_favorites(
        &self,
        id: &str,
        tenant_id: &str,
    ) -> Result<Option<MachineWithFavorites>, MachineError> {
        let machine = match self.get_machine(id).await? {
            Some(m) => m,
            None => return Ok(None),
        };

        let favorites = if let Some(ref pool) = self.db_pool {
            let fav_records = favorites::get_machine_favorites(pool, id, tenant_id).await?;
            fav_records.into_iter().map(FavoriteInfo::from).collect()
        } else {
            Vec::new()
        };

        Ok(Some(MachineWithFavorites::new(machine, favorites)))
    }

    /// Set a user's favorite machine (replaces any previous favorite).
    pub async fn set_favorite(
        &self,
        user_id: Uuid,
        user_name: Option<&str>,
        machine_id: &str,
        tenant_id: &str,
    ) -> Result<(), MachineError> {
        let pool = self.db_pool.as_ref().ok_or_else(|| {
            MachineError::Database("Database not configured for favorites".into())
        })?;

        favorites::set_favorite(pool, user_id, user_name, machine_id, tenant_id).await
    }

    /// Clear a user's favorite.
    pub async fn clear_favorite(&self, user_id: Uuid, tenant_id: &str) -> Result<(), MachineError> {
        let pool = self.db_pool.as_ref().ok_or_else(|| {
            MachineError::Database("Database not configured for favorites".into())
        })?;

        favorites::clear_favorite(pool, user_id, tenant_id).await
    }

    /// Get a user's current favorite machine ID.
    pub async fn get_user_favorite(
        &self,
        user_id: Uuid,
        tenant_id: &str,
    ) -> Result<Option<String>, MachineError> {
        let pool = self.db_pool.as_ref().ok_or_else(|| {
            MachineError::Database("Database not configured for favorites".into())
        })?;

        let fav = favorites::get_user_favorite(pool, user_id, tenant_id).await?;
        Ok(fav.map(|f| f.machine_id))
    }
}
