//! Pinball machine data integration.
//!
//! This crate combines data from multiple sources:
//! - **Pinball Map**: Machine lists by location
//! - **OPDB**: Machine metadata (images, type, features)
//! - **Pintips**: Strategy guides (pre-processed JSON)
//!
//! # Architecture
//!
//! The `MachineDataService` provides a unified interface that coordinates
//! these data sources:
//!
//! ```ignore
//! let service = MachineDataService::new(location_id)
//!     .with_opdb(opdb_loader)
//!     .with_pintips(pintips_loader);
//!
//! let machines = service.get_machines().await?;
//! ```

mod error;
mod models;
mod opdb;
mod pinball_map;
mod pintips;
mod service;

pub use error::MachineError;
pub use models::*;
pub use opdb::{OpdbLoader, OpdbMachine};
pub use pinball_map::{PinballMapClient, PinballMapConfig};
pub use pintips::{PintipsLoader, Pintips, TipsSection};
pub use service::MachineDataService;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_machine_enrichment() {
        let mut machine = Machine {
            id: "pm_123".to_string(),
            name: "Test Machine".to_string(),
            manufacturer: Some("Williams".to_string()),
            year: Some(1992),
            ipdb_link: None,
            opdb_id: Some("abc123".to_string()),
            ..Default::default()
        };

        let enrichment = MachineEnrichment {
            machine_type: Some("Solid State".to_string()),
            display_type: Some("DMD".to_string()),
            player_count: Some(4),
            features: vec!["multiball".to_string()],
            description: Some("A great machine".to_string()),
            images: vec![],
        };

        machine.enrich(enrichment);

        assert_eq!(machine.machine_type, Some("Solid State".to_string()));
        assert_eq!(machine.player_count, Some(4));
    }
}
