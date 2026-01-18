//! Mock POS service for development and testing.

use async_trait::async_trait;
use tracing::info;
use uuid::Uuid;

use crate::{
    Category, Menu, MenuItem, ModifierGroup, ModifierOption, OrderSubmission, PosError, PosService,
};

/// Mock POS service with sample data.
pub struct MockPosService {
    menu: Menu,
}

impl MockPosService {
    /// Create a new mock POS service with sample data.
    pub fn new() -> Self {
        Self {
            menu: create_sample_menu(),
        }
    }
}

impl Default for MockPosService {
    fn default() -> Self {
        Self::new()
    }
}

#[async_trait]
impl PosService for MockPosService {
    async fn get_menu(&self) -> Result<Menu, PosError> {
        info!("Mock POS: Getting menu");
        Ok(self.menu.clone())
    }

    async fn get_menu_item(&self, item_id: &str) -> Result<Option<MenuItem>, PosError> {
        info!(item_id, "Mock POS: Getting menu item");
        for category in &self.menu.categories {
            for item in &category.items {
                if item.id == item_id {
                    return Ok(Some(item.clone()));
                }
            }
        }
        Ok(None)
    }

    async fn submit_order(&self, order: &OrderSubmission) -> Result<String, PosError> {
        let order_id = Uuid::new_v4().to_string();
        info!(
            order_id,
            items = order.items.len(),
            "Mock POS: Order submitted"
        );
        Ok(order_id)
    }

    async fn get_order_status(&self, pos_order_id: &str) -> Result<String, PosError> {
        info!(pos_order_id, "Mock POS: Getting order status");
        // Mock always returns "preparing"
        Ok("preparing".to_string())
    }
}

fn create_sample_menu() -> Menu {
    Menu {
        categories: vec![
            Category {
                id: "burgers".to_string(),
                name: "Burgers".to_string(),
                description: Some("Handcrafted burgers".to_string()),
                items: vec![
                    MenuItem {
                        id: "burger-01".to_string(),
                        name: "Classic Burger".to_string(),
                        description: "Angus beef patty with lettuce, tomato, and special sauce"
                            .to_string(),
                        price_cents: 1299,
                        image_url: Some("https://example.com/burger.jpg".to_string()),
                        modifiers: Some(vec![ModifierGroup {
                            id: "cheese".to_string(),
                            name: "Add Cheese".to_string(),
                            required: false,
                            min_selections: 0,
                            max_selections: 1,
                            options: vec![
                                ModifierOption {
                                    id: "cheddar".to_string(),
                                    name: "Cheddar".to_string(),
                                    price_cents: 150,
                                    available: true,
                                },
                                ModifierOption {
                                    id: "swiss".to_string(),
                                    name: "Swiss".to_string(),
                                    price_cents: 150,
                                    available: true,
                                },
                            ],
                        }]),
                        available: true,
                    },
                    MenuItem {
                        id: "burger-02".to_string(),
                        name: "BBQ Bacon Burger".to_string(),
                        description: "Topped with crispy bacon and tangy BBQ sauce".to_string(),
                        price_cents: 1499,
                        image_url: None,
                        modifiers: None,
                        available: true,
                    },
                ],
            },
            Category {
                id: "drinks".to_string(),
                name: "Drinks".to_string(),
                description: Some("Beverages".to_string()),
                items: vec![
                    MenuItem {
                        id: "drink-01".to_string(),
                        name: "Soft Drink".to_string(),
                        description: "Fountain drink".to_string(),
                        price_cents: 299,
                        image_url: None,
                        modifiers: Some(vec![ModifierGroup {
                            id: "size".to_string(),
                            name: "Size".to_string(),
                            required: true,
                            min_selections: 1,
                            max_selections: 1,
                            options: vec![
                                ModifierOption {
                                    id: "small".to_string(),
                                    name: "Small".to_string(),
                                    price_cents: 0,
                                    available: true,
                                },
                                ModifierOption {
                                    id: "medium".to_string(),
                                    name: "Medium".to_string(),
                                    price_cents: 50,
                                    available: true,
                                },
                                ModifierOption {
                                    id: "large".to_string(),
                                    name: "Large".to_string(),
                                    price_cents: 100,
                                    available: true,
                                },
                            ],
                        }]),
                        available: true,
                    },
                    MenuItem {
                        id: "drink-02".to_string(),
                        name: "Beer".to_string(),
                        description: "Local craft beer".to_string(),
                        price_cents: 699,
                        image_url: None,
                        modifiers: None,
                        available: true,
                    },
                ],
            },
        ],
    }
}
