//! Point of Sale integration via Toast API.
//!
//! This crate provides:
//! - `PosService` trait for POS operations
//! - `ToastPosService` - Production Toast API integration
//! - `MockPosService` - Development mock with sample data

mod error;
mod mock;
mod models;
mod toast;

pub use error::PosError;
pub use mock::MockPosService;
pub use models::*;
pub use toast::{ToastConfig, ToastPosService};

use async_trait::async_trait;

/// Trait for Point of Sale operations.
#[async_trait]
pub trait PosService: Send + Sync {
    /// Get the full menu with categories.
    async fn get_menu(&self) -> Result<Menu, PosError>;

    /// Get a single menu item by ID.
    async fn get_menu_item(&self, item_id: &str) -> Result<Option<MenuItem>, PosError>;

    /// Submit an order to the POS.
    async fn submit_order(&self, order: &OrderSubmission) -> Result<String, PosError>;

    /// Get order status from the POS.
    async fn get_order_status(&self, pos_order_id: &str) -> Result<String, PosError>;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_mock_pos_get_menu() {
        let service = MockPosService::new();
        let menu = service.get_menu().await.unwrap();

        assert!(!menu.categories.is_empty());
        assert!(!menu.categories[0].items.is_empty());
    }

    #[tokio::test]
    async fn test_mock_pos_get_item() {
        let service = MockPosService::new();

        let item = service.get_menu_item("burger-01").await.unwrap();
        assert!(item.is_some());

        let item = service.get_menu_item("nonexistent").await.unwrap();
        assert!(item.is_none());
    }

    #[tokio::test]
    async fn test_mock_pos_submit_order() {
        let service = MockPosService::new();
        let order = OrderSubmission {
            items: vec![OrderItemSubmission {
                menu_item_id: "burger-01".to_string(),
                name: "Classic Burger".to_string(),
                quantity: 2,
                price_cents: 1299,
                modifiers: vec![],
                special_instructions: None,
            }],
            customer_name: Some("Test Customer".to_string()),
            customer_phone: Some("+15551234567".to_string()),
        };

        let order_id = service.submit_order(&order).await.unwrap();
        assert!(!order_id.is_empty());
    }
}
