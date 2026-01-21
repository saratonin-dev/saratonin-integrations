//! Machine favorites functionality.
//!
//! This module provides functionality for users to mark machines as favorites.
//! Each user can only have ONE favorite machine at a time per tenant.

mod models;
mod repository;

pub use models::{FavoriteInfo, MachineFavorite, MachineWithFavorites};
pub use repository::*;
