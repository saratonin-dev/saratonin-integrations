//! Unified machine data service.

use std::sync::Arc;
use std::time::Duration;

use chrono::Utc;
use integration_core::Cache;
use tracing::info;

use crate::{
    Machine, MachineError, MachinesResponse, OpdbLoader, PinballMapClient, PinballMapConfig,
    PintipsLoader,
};

/// Unified service for machine data from multiple sources.
pub struct MachineDataService {
    pinball_map: PinballMapClient,
    opdb: Option<Arc<OpdbLoader>>,
    pintips: Option<Arc<PintipsLoader>>,
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
                    ipdb_link
                        .split("id=")
                        .last()
                        .and_then(|s| s.parse::<i64>().ok())
                        .and_then(|id| {
                            // This is sync access, need async
                            None // TODO: Make this async-friendly
                        })
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
}
