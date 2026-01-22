//! Pinball Map API client.

use integration_core::HttpClientBuilder;
use reqwest::Client;
use tracing::{debug, info};

use crate::{Machine, MachineError, PinballMapMachine, PinballMapResponse};

const PINBALL_MAP_BASE_URL: &str = "https://pinballmap.com/api/v1";

/// Configuration for Pinball Map client.
#[derive(Debug, Clone)]
pub struct PinballMapConfig {
    /// Location ID to fetch machines from.
    pub location_id: i64,
    /// Base URL (defaults to production).
    pub base_url: String,
}

impl PinballMapConfig {
    /// Create config for a specific location.
    pub fn new(location_id: i64) -> Self {
        Self {
            location_id,
            base_url: PINBALL_MAP_BASE_URL.to_string(),
        }
    }

    /// Create config from environment.
    ///
    /// Expects:
    /// - `PINBALL_MAP_LOCATION_ID`
    pub fn from_env() -> Result<Self, MachineError> {
        let location_id: i64 = std::env::var("PINBALL_MAP_LOCATION_ID")
            .map_err(|_| MachineError::Config("PINBALL_MAP_LOCATION_ID not set".into()))?
            .parse()
            .map_err(|_| MachineError::Config("Invalid PINBALL_MAP_LOCATION_ID".into()))?;

        info!(location_id, "PinballMapConfig created from environment");
        Ok(Self::new(location_id))
    }
}

/// Client for Pinball Map API.
pub struct PinballMapClient {
    config: PinballMapConfig,
    client: Client,
}

impl PinballMapClient {
    /// Create a new Pinball Map client.
    pub fn new(config: PinballMapConfig) -> Result<Self, MachineError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-pinball/0.1.0")
            .build()
            .map_err(MachineError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment.
    pub fn from_env() -> Result<Self, MachineError> {
        Self::new(PinballMapConfig::from_env()?)
    }

    /// Get machines at the configured location.
    pub async fn get_machines(&self) -> Result<Vec<Machine>, MachineError> {
        let url = format!(
            "{}/locations/{}/machine_details.json",
            self.config.base_url, self.config.location_id
        );

        info!(url = %url, location_id = self.config.location_id, "Fetching machines from Pinball Map");

        let response = self.client.get(&url).send().await?;

        if !response.status().is_success() {
            return Err(MachineError::PinballMap(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        // Get raw text first for debugging
        let text = response.text().await?;
        debug!(
            response_length = text.len(),
            "Received response from Pinball Map"
        );

        let data: PinballMapResponse = serde_json::from_str(&text).map_err(|e| {
            debug!(error = %e, body_preview = &text[..text.len().min(500)], "Failed to parse Pinball Map response");
            MachineError::PinballMap(format!("Failed to parse response: {}", e))
        })?;

        info!(
            location_id = self.config.location_id,
            count = data.machines.len(),
            "Fetched machines from Pinball Map"
        );

        Ok(data.machines.into_iter().map(Machine::from).collect())
    }

    /// Get a specific machine by Pinball Map ID.
    pub async fn get_machine(&self, pinball_map_id: i64) -> Result<Option<Machine>, MachineError> {
        let machines = self.get_machines().await?;
        Ok(machines
            .into_iter()
            .find(|m| m.id == format!("pm_{}", pinball_map_id)))
    }
}
