//! Pintips (strategy guides) loader.
//!
//! Loads pre-processed strategy guides from JSON files.
//! The JSON files should be pre-generated from the pinballprimer repo
//! using a CLI tool (avoids runtime HTML parsing).

use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;

use parking_lot::RwLock;
use serde::{Deserialize, Serialize};
use tracing::info;

use crate::MachineError;

/// Strategy tips for a pinball machine.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Pintips {
    /// OPDB ID (game portion only, e.g., "G5oXq").
    pub opdb_id: String,
    /// Machine name.
    pub name: String,
    /// Sections of tips (e.g., "Skill Shots", "Modes").
    pub sections: Vec<TipsSection>,
}

/// A section of tips.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TipsSection {
    /// Section title.
    pub title: String,
    /// Content paragraphs or list items.
    pub content: Vec<String>,
    /// Subsections.
    #[serde(skip_serializing_if = "Vec::is_empty", default)]
    pub subsections: Vec<TipsSection>,
}

/// Loader for Pintips data.
pub struct PintipsLoader {
    data_dir: PathBuf,
    cache: Arc<RwLock<HashMap<String, Pintips>>>,
}

impl PintipsLoader {
    /// Create a new Pintips loader.
    ///
    /// # Arguments
    /// * `data_dir` - Directory containing pre-processed pintips JSON files.
    pub fn new(data_dir: PathBuf) -> Self {
        Self {
            data_dir,
            cache: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    /// Load all pintips from the data directory.
    #[allow(clippy::await_holding_lock)]
    pub async fn load_all(&self) -> Result<usize, MachineError> {
        let mut cache = self.cache.write();
        cache.clear();

        if !self.data_dir.exists() {
            info!(path = ?self.data_dir, "Pintips directory not found");
            return Ok(0);
        }

        let mut count = 0;
        let mut entries = tokio::fs::read_dir(&self.data_dir).await?;

        while let Some(entry) = entries.next_entry().await? {
            let path = entry.path();
            if path.extension().map(|e| e == "json").unwrap_or(false) {
                match self.load_file(&path).await {
                    Ok(tips) => {
                        cache.insert(tips.opdb_id.clone(), tips);
                        count += 1;
                    }
                    Err(e) => {
                        tracing::warn!(path = ?path, error = %e, "Failed to load pintips file");
                    }
                }
            }
        }

        info!(count, "Loaded pintips");
        Ok(count)
    }

    /// Get tips for a machine by OPDB ID.
    ///
    /// Lazily loads all pintips on first access if cache is empty.
    pub fn get(&self, opdb_id: &str) -> Option<Pintips> {
        // Lazy load on first access if cache is empty
        if self.cache.read().is_empty() && self.data_dir.exists() {
            self.load_all_sync();
        }

        let cache = self.cache.read();

        // Try exact match first
        if let Some(tips) = cache.get(opdb_id) {
            return Some(tips.clone());
        }

        // Try base ID (without suffix)
        let base_id = opdb_id.split('-').next().unwrap_or(opdb_id);
        cache.get(base_id).cloned()
    }

    /// Synchronously load all pintips (for lazy initialization).
    fn load_all_sync(&self) {
        if let Ok(entries) = std::fs::read_dir(&self.data_dir) {
            let mut cache = self.cache.write();
            for entry in entries.flatten() {
                let path = entry.path();
                if path.extension().map(|e| e == "json").unwrap_or(false) {
                    if let Ok(content) = std::fs::read_to_string(&path) {
                        match serde_json::from_str::<Pintips>(&content) {
                            Ok(tips) => {
                                cache.insert(tips.opdb_id.clone(), tips);
                            }
                            Err(e) => {
                                tracing::warn!(path = ?path, error = %e, "Failed to parse pintips file");
                            }
                        }
                    }
                }
            }
            info!(count = cache.len(), "Lazy-loaded pintips");
        }
    }

    /// Get all loaded tips.
    pub fn get_all(&self) -> HashMap<String, Pintips> {
        self.cache.read().clone()
    }

    async fn load_file(&self, path: &PathBuf) -> Result<Pintips, MachineError> {
        let content = tokio::fs::read_to_string(path).await?;
        let tips: Pintips = serde_json::from_str(&content)?;
        Ok(tips)
    }
}

/// Pre-processor for converting pinballprimer HTML to JSON.
///
/// This is meant to be run as a build step, not at runtime.
/// Usage:
/// ```ignore
/// let processor = PintipsPreprocessor::new("data/pinballprimer");
/// processor.process_all("data/pintips")?;
/// ```
#[cfg(feature = "preprocessor")]
#[allow(dead_code)]
pub struct PintipsPreprocessor {
    repo_dir: PathBuf,
}

#[cfg(feature = "preprocessor")]
#[allow(dead_code)]
impl PintipsPreprocessor {
    /// Create a new preprocessor.
    pub fn new(repo_dir: impl Into<PathBuf>) -> Self {
        Self {
            repo_dir: repo_dir.into(),
        }
    }

    /// Process all HTML files and write JSON output.
    pub fn process_all(&self, _output_dir: impl Into<PathBuf>) -> Result<usize, MachineError> {
        // This would use the `scraper` crate to parse HTML
        // For now, we expect pre-processed JSON files
        todo!("HTML preprocessing should be done via CLI tool")
    }
}
