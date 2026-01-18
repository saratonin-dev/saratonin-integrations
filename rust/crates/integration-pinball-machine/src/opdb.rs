//! OPDB (Open Pinball Database) data loader.
//!
//! Fetches machine metadata from the OPDB CDN and provides lookup by ID.

use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::Duration;

use chrono::{DateTime, Utc};
use integration_core::{Cache, HttpClientBuilder};
use parking_lot::RwLock;
use reqwest::Client;
use serde::{Deserialize, Serialize};
use tracing::{info, warn};

use crate::{MachineEnrichment, MachineError, MachineImage};

const OPDB_CDN_URL: &str = "https://mp-data.sfo3.cdn.digitaloceanspaces.com/latest-opdb.json";

/// Machine data from OPDB export.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OpdbMachine {
    pub opdb_id: String,
    pub name: String,
    #[serde(default)]
    pub ipdb_id: Option<i64>,
    #[serde(default)]
    pub manufacturer: Option<String>,
    #[serde(default)]
    pub year: Option<i32>,
    #[serde(default)]
    pub machine_type: Option<String>,
    #[serde(default)]
    pub display_type: Option<String>,
    #[serde(default)]
    pub player_count: Option<i32>,
    #[serde(default)]
    pub features: Vec<String>,
    #[serde(default)]
    pub description: Option<String>,
    #[serde(default)]
    pub images: Vec<OpdbImage>,
}

impl OpdbMachine {
    /// Convert to enrichment data.
    pub fn to_enrichment(&self) -> MachineEnrichment {
        MachineEnrichment {
            machine_type: self.machine_type.clone(),
            display_type: self.display_type.clone(),
            player_count: self.player_count,
            features: self.features.clone(),
            description: self.description.clone(),
            images: self
                .images
                .iter()
                .map(|img| MachineImage {
                    url: img.url.clone(),
                    image_type: img.image_type.clone(),
                    width: img.width,
                    height: img.height,
                })
                .collect(),
        }
    }
}

/// Image from OPDB.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OpdbImage {
    pub url: String,
    #[serde(default)]
    pub image_type: Option<String>,
    #[serde(default)]
    pub width: Option<i32>,
    #[serde(default)]
    pub height: Option<i32>,
}

/// OPDB export format.
#[derive(Debug, Clone, Deserialize)]
pub struct OpdbExport {
    pub machines: Vec<OpdbMachine>,
}

/// In-memory OPDB cache with lookup maps.
struct OpdbCache {
    by_opdb_id: HashMap<String, OpdbMachine>,
    by_ipdb_id: HashMap<i64, String>,
    fetched_at: DateTime<Utc>,
}

impl OpdbCache {
    fn from_export(export: OpdbExport, fetched_at: DateTime<Utc>) -> Self {
        let mut by_opdb_id = HashMap::new();
        let mut by_ipdb_id = HashMap::new();

        for machine in export.machines {
            if let Some(ipdb_id) = machine.ipdb_id {
                by_ipdb_id.insert(ipdb_id, machine.opdb_id.clone());
            }
            by_opdb_id.insert(machine.opdb_id.clone(), machine);
        }

        Self {
            by_opdb_id,
            by_ipdb_id,
            fetched_at,
        }
    }
}

/// Loader for OPDB data.
pub struct OpdbLoader {
    client: Client,
    cache: Arc<RwLock<Option<OpdbCache>>>,
    cache_file: Option<PathBuf>,
    cache_ttl: Duration,
}

impl OpdbLoader {
    /// Create a new OPDB loader.
    pub fn new() -> Result<Self, MachineError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-pinball/0.1.0")
            .build()
            .map_err(MachineError::Network)?;

        Ok(Self {
            client,
            cache: Arc::new(RwLock::new(None)),
            cache_file: None,
            cache_ttl: Duration::from_secs(24 * 60 * 60), // 24 hours
        })
    }

    /// Set a file path for persistent caching.
    pub fn with_cache_file(mut self, path: PathBuf) -> Self {
        self.cache_file = Some(path);
        self
    }

    /// Set the cache TTL.
    pub fn with_cache_ttl(mut self, ttl: Duration) -> Self {
        self.cache_ttl = ttl;
        self
    }

    /// Look up enrichment data by OPDB ID.
    pub async fn lookup_by_opdb_id(&self, opdb_id: &str) -> Result<Option<MachineEnrichment>, MachineError> {
        self.ensure_loaded().await?;

        let cache = self.cache.read();
        if let Some(ref cache) = *cache {
            // OPDB IDs can have suffixes (e.g., "G5oXq-MD82e"), try the base ID first
            let base_id = opdb_id.split('-').next().unwrap_or(opdb_id);

            if let Some(machine) = cache.by_opdb_id.get(opdb_id) {
                return Ok(Some(machine.to_enrichment()));
            }
            if base_id != opdb_id {
                if let Some(machine) = cache.by_opdb_id.get(base_id) {
                    return Ok(Some(machine.to_enrichment()));
                }
            }
        }
        Ok(None)
    }

    /// Look up enrichment data by IPDB ID.
    pub async fn lookup_by_ipdb_id(&self, ipdb_id: i64) -> Result<Option<MachineEnrichment>, MachineError> {
        self.ensure_loaded().await?;

        let cache = self.cache.read();
        if let Some(ref cache) = *cache {
            if let Some(opdb_id) = cache.by_ipdb_id.get(&ipdb_id) {
                if let Some(machine) = cache.by_opdb_id.get(opdb_id) {
                    return Ok(Some(machine.to_enrichment()));
                }
            }
        }
        Ok(None)
    }

    /// Force refresh from CDN.
    pub async fn refresh(&self) -> Result<usize, MachineError> {
        let export = self.fetch_from_cdn().await?;
        let count = export.machines.len();
        let cache = OpdbCache::from_export(export, Utc::now());

        // Save to file if configured
        if let Some(ref path) = self.cache_file {
            if let Err(e) = self.save_to_file(path, &cache).await {
                warn!("Failed to save OPDB cache to file: {}", e);
            }
        }

        *self.cache.write() = Some(cache);
        info!(count, "OPDB data loaded");
        Ok(count)
    }

    async fn ensure_loaded(&self) -> Result<(), MachineError> {
        // Check if cache is valid
        {
            let cache = self.cache.read();
            if let Some(ref c) = *cache {
                let age = Utc::now().signed_duration_since(c.fetched_at);
                if age.to_std().unwrap_or(Duration::MAX) < self.cache_ttl {
                    return Ok(());
                }
            }
        }

        // Try to load from file first
        if let Some(ref path) = self.cache_file {
            if let Ok(Some(cache)) = self.load_from_file(path).await {
                let age = Utc::now().signed_duration_since(cache.fetched_at);
                if age.to_std().unwrap_or(Duration::MAX) < self.cache_ttl {
                    *self.cache.write() = Some(cache);
                    return Ok(());
                }
            }
        }

        // Fetch fresh data
        self.refresh().await?;
        Ok(())
    }

    async fn fetch_from_cdn(&self) -> Result<OpdbExport, MachineError> {
        info!("Fetching OPDB data from CDN...");

        let response = self.client.get(OPDB_CDN_URL).send().await?;

        if !response.status().is_success() {
            return Err(MachineError::Opdb(format!(
                "CDN returned status: {}",
                response.status()
            )));
        }

        let export: OpdbExport = response.json().await?;
        info!(count = export.machines.len(), "Fetched OPDB data");
        Ok(export)
    }

    async fn load_from_file(&self, path: &PathBuf) -> Result<Option<OpdbCache>, MachineError> {
        if !path.exists() {
            return Ok(None);
        }

        let content = tokio::fs::read_to_string(path).await?;
        let export: OpdbExport = serde_json::from_str(&content)?;

        // Use file modification time as fetched_at
        let metadata = tokio::fs::metadata(path).await?;
        let fetched_at = metadata
            .modified()
            .ok()
            .and_then(|t| {
                t.duration_since(std::time::UNIX_EPOCH)
                    .ok()
                    .map(|d| DateTime::from_timestamp(d.as_secs() as i64, 0).unwrap_or_else(Utc::now))
            })
            .unwrap_or_else(Utc::now);

        Ok(Some(OpdbCache::from_export(export, fetched_at)))
    }

    async fn save_to_file(&self, path: &PathBuf, _cache: &OpdbCache) -> Result<(), MachineError> {
        // Fetch fresh and save (we don't store the raw export in cache)
        let response = self.client.get(OPDB_CDN_URL).send().await?;
        let content = response.text().await?;
        tokio::fs::write(path, content).await?;
        Ok(())
    }
}

impl Default for OpdbLoader {
    fn default() -> Self {
        Self::new().expect("Failed to create OPDB loader")
    }
}
