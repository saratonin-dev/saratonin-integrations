//! Favorites data models.

use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

use crate::Machine;

/// A machine favorite record.
#[derive(Debug, Clone, Serialize, Deserialize, sqlx::FromRow)]
pub struct MachineFavorite {
    pub user_id: Uuid,
    pub user_name: Option<String>,
    pub machine_id: String,
    pub tenant_id: String,
    pub created_at: DateTime<Utc>,
}

/// Favorite info for display purposes.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FavoriteInfo {
    pub user_id: Uuid,
    pub user_name: Option<String>,
}

impl From<MachineFavorite> for FavoriteInfo {
    fn from(fav: MachineFavorite) -> Self {
        Self {
            user_id: fav.user_id,
            user_name: fav.user_name,
        }
    }
}

/// A machine with its favorites information.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MachineWithFavorites {
    #[serde(flatten)]
    pub machine: Machine,
    pub favorited_by: Vec<FavoriteInfo>,
}

impl MachineWithFavorites {
    /// Create a new machine with favorites from a machine and favorites list.
    pub fn new(machine: Machine, favorites: Vec<FavoriteInfo>) -> Self {
        Self {
            machine,
            favorited_by: favorites,
        }
    }

    /// Check if a specific user has favorited this machine.
    pub fn is_favorited_by(&self, user_id: Uuid) -> bool {
        self.favorited_by.iter().any(|f| f.user_id == user_id)
    }
}
