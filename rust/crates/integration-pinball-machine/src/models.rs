//! Machine data models.

use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};

/// A pinball machine with enriched data.
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct Machine {
    /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
    pub id: String,
    /// Machine name.
    pub name: String,
    /// Manufacturer (e.g., "Williams", "Stern").
    pub manufacturer: Option<String>,
    /// Year of manufacture.
    pub year: Option<i32>,
    /// IPDB link.
    pub ipdb_link: Option<String>,
    /// OPDB ID for enrichment lookup.
    pub opdb_id: Option<String>,

    // Enrichment fields (from OPDB)
    /// Machine type (e.g., "Solid State", "Electromechanical").
    #[serde(skip_serializing_if = "Option::is_none")]
    pub machine_type: Option<String>,
    /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
    #[serde(skip_serializing_if = "Option::is_none")]
    pub display_type: Option<String>,
    /// Number of players.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub player_count: Option<i32>,
    /// Features (e.g., "multiball", "video_mode").
    #[serde(skip_serializing_if = "Vec::is_empty", default)]
    pub features: Vec<String>,
    /// Description from OPDB.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
    /// Images from OPDB.
    #[serde(skip_serializing_if = "Vec::is_empty", default)]
    pub images: Vec<MachineImage>,

    // Pintips (strategy guides)
    /// Strategy tips from Pintips/Pinball Primer.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub tips: Option<super::Pintips>,
}

impl Machine {
    /// Enrich this machine with OPDB data.
    pub fn enrich(&mut self, enrichment: MachineEnrichment) {
        self.machine_type = enrichment.machine_type;
        self.display_type = enrichment.display_type;
        self.player_count = enrichment.player_count;
        self.features = enrichment.features;
        self.description = enrichment.description;
        self.images = enrichment.images;
    }
}

/// Enrichment data from OPDB.
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
pub struct MachineEnrichment {
    pub machine_type: Option<String>,
    pub display_type: Option<String>,
    pub player_count: Option<i32>,
    pub features: Vec<String>,
    pub description: Option<String>,
    pub images: Vec<MachineImage>,
}

/// Machine image.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MachineImage {
    pub url: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub image_type: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub width: Option<i32>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub height: Option<i32>,
}

/// Response from Pinball Map API.
#[derive(Debug, Clone, Deserialize)]
pub struct PinballMapResponse {
    pub machines: Vec<PinballMapMachine>,
}

/// Machine from Pinball Map API.
#[derive(Debug, Clone, Deserialize)]
pub struct PinballMapMachine {
    pub id: i64,
    pub name: String,
    pub year: Option<i32>,
    pub manufacturer: Option<String>,
    pub ipdb_link: Option<String>,
    pub ipdb_id: Option<i64>,
    pub opdb_id: Option<String>,
}

impl From<PinballMapMachine> for Machine {
    fn from(pm: PinballMapMachine) -> Self {
        Machine {
            id: format!("pm_{}", pm.id),
            name: pm.name,
            manufacturer: pm.manufacturer,
            year: pm.year,
            ipdb_link: pm.ipdb_link,
            opdb_id: pm.opdb_id,
            ..Default::default()
        }
    }
}

/// Machines response with metadata.
#[derive(Debug, Clone, Serialize)]
pub struct MachinesResponse {
    pub machines: Vec<Machine>,
    pub machine_count: usize,
    pub last_synced: Option<DateTime<Utc>>,
}
