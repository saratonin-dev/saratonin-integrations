//! OPDB (Open Pinball Database) data loader.
//!
//! Fetches machine metadata from the OPDB CDN and provides lookup by ID.

use std::collections::HashMap;
use std::path::PathBuf;
use std::time::Duration;

use chrono::{DateTime, Utc};
use integration_core::HttpClientBuilder;
use reqwest::Client;
use serde::{Deserialize, Serialize};
use tokio::sync::{OnceCell, RwLock};
use tracing::{debug, error, info, warn};

use crate::{MachineEnrichment, MachineError, MachineImage};

const OPDB_CDN_URL: &str = "https://mp-data.sfo3.cdn.digitaloceanspaces.com/latest-opdb.json";

/// Machine data from OPDB export.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OpdbMachine {
    pub opdb_id: String,
    pub name: String,
    #[serde(default)]
    pub ipdb_id: Option<i64>,
    #[serde(default)]
    pub manufacturer: Option<OpdbManufacturer>,
    #[serde(default)]
    pub manufacture_date: Option<String>,
    #[serde(default, rename = "type")]
    pub machine_type: Option<String>,
    #[serde(default, rename = "display")]
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
            description: if self.description.as_ref().map(|s| s.is_empty()).unwrap_or(true) {
                None
            } else {
                self.description.clone()
            },
            images: self
                .images
                .iter()
                .filter_map(|img| {
                    // Get the large URL, or medium, or small
                    let url = img.urls.as_ref().and_then(|urls| {
                        urls.large.clone().or(urls.medium.clone()).or(urls.small.clone())
                    })?;
                    let size = img.sizes.as_ref().and_then(|s| s.large.as_ref().or(s.medium.as_ref()));
                    Some(MachineImage {
                        url,
                        image_type: img.image_type.clone(),
                        width: size.map(|s| s.width),
                        height: size.map(|s| s.height),
                    })
                })
                .collect(),
        }
    }
}

/// Manufacturer info from OPDB.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OpdbManufacturer {
    pub name: String,
    #[serde(default)]
    pub full_name: Option<String>,
}

/// Image from OPDB.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OpdbImage {
    #[serde(default, rename = "type")]
    pub image_type: Option<String>,
    #[serde(default)]
    pub urls: Option<OpdbImageUrls>,
    #[serde(default)]
    pub sizes: Option<OpdbImageSizes>,
}

/// Image URLs from OPDB.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OpdbImageUrls {
    #[serde(default)]
    pub small: Option<String>,
    #[serde(default)]
    pub medium: Option<String>,
    #[serde(default)]
    pub large: Option<String>,
}

/// Image sizes from OPDB.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OpdbImageSizes {
    #[serde(default)]
    pub small: Option<OpdbImageSize>,
    #[serde(default)]
    pub medium: Option<OpdbImageSize>,
    #[serde(default)]
    pub large: Option<OpdbImageSize>,
}

/// Single image size.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OpdbImageSize {
    pub width: i32,
    pub height: i32,
}

/// OPDB export format.
#[derive(Debug, Clone, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct OpdbExport {
    #[serde(default)]
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
    /// OnceCell ensures exactly one initialization attempt.
    /// RwLock inside allows for TTL-based refresh after initial load.
    cache: OnceCell<RwLock<OpdbCache>>,
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
            cache: OnceCell::new(),
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
        let cache = self.get_cache().await?;
        let cache = cache.read().await;

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
        Ok(None)
    }

    /// Look up enrichment data by IPDB ID.
    pub async fn lookup_by_ipdb_id(&self, ipdb_id: i64) -> Result<Option<MachineEnrichment>, MachineError> {
        let cache = self.get_cache().await?;
        let cache = cache.read().await;

        if let Some(opdb_id) = cache.by_ipdb_id.get(&ipdb_id) {
            if let Some(machine) = cache.by_opdb_id.get(opdb_id) {
                return Ok(Some(machine.to_enrichment()));
            }
        }
        Ok(None)
    }

    /// Force refresh from CDN.
    pub async fn refresh(&self) -> Result<usize, MachineError> {
        let export = self.fetch_from_cdn().await?;
        let count = export.machines.len();
        let new_cache = OpdbCache::from_export(export, Utc::now());

        // Save to file if configured
        if let Some(ref path) = self.cache_file {
            if let Err(e) = self.save_to_file(path, &new_cache).await {
                warn!("Failed to save OPDB cache to file: {}", e);
            }
        }

        // Update cache if already initialized
        if let Some(cache) = self.cache.get() {
            *cache.write().await = new_cache;
        }

        info!(count, "OPDB data refreshed");
        Ok(count)
    }

    /// Get the cache, initializing it exactly once if needed.
    /// OnceCell guarantees only one caller will perform initialization.
    async fn get_cache(&self) -> Result<&RwLock<OpdbCache>, MachineError> {
        self.cache
            .get_or_try_init(|| async {
                debug!("Initializing OPDB cache (first access)");
                let cache = self.load_initial_cache().await?;
                Ok(RwLock::new(cache))
            })
            .await
    }

    /// Load the initial cache from file or CDN.
    async fn load_initial_cache(&self) -> Result<OpdbCache, MachineError> {
        // Try file cache first
        if let Some(ref path) = self.cache_file {
            match self.load_from_file(path).await {
                Ok(Some(file_cache)) => {
                    let age = Utc::now().signed_duration_since(file_cache.fetched_at);
                    if age.to_std().unwrap_or(Duration::MAX) < self.cache_ttl {
                        debug!("Loaded OPDB data from file cache");
                        return Ok(file_cache);
                    }
                    debug!("File cache expired, fetching from CDN");
                }
                Ok(None) => debug!("No file cache found"),
                Err(e) => warn!("Failed to load file cache: {}", e),
            }
        }

        // Fetch from CDN
        let export = self.fetch_from_cdn().await?;
        let cache = OpdbCache::from_export(export, Utc::now());

        // Save to file if configured
        if let Some(ref path) = self.cache_file {
            if let Err(e) = self.save_to_file(path, &cache).await {
                warn!("Failed to save OPDB cache to file: {}", e);
            }
        }

        Ok(cache)
    }

    async fn fetch_from_cdn(&self) -> Result<OpdbExport, MachineError> {
        info!("Fetching OPDB data from CDN...");

        let response = self.client.get(OPDB_CDN_URL).send().await.map_err(|e| {
            error!("CDN request failed: {}", e);
            MachineError::Network(e)
        })?;

        if !response.status().is_success() {
            let status = response.status();
            error!("CDN returned error status: {}", status);
            return Err(MachineError::Opdb(format!(
                "CDN returned status: {}",
                status
            )));
        }

        let export: OpdbExport = response.json().await.map_err(|e| {
            error!("Failed to parse CDN response: {}", e);
            MachineError::Network(e)
        })?;

        info!(count = export.machines.len(), "Fetched OPDB data from CDN");
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
