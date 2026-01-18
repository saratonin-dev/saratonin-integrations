//! POS data models.

use serde::{Deserialize, Serialize};

/// A menu with categories and items.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Menu {
    pub categories: Vec<Category>,
}

/// A menu category.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Category {
    pub id: String,
    pub name: String,
    pub description: Option<String>,
    pub items: Vec<MenuItem>,
}

/// A menu item.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MenuItem {
    pub id: String,
    pub name: String,
    pub description: String,
    #[serde(rename = "priceCents")]
    pub price_cents: i32,
    pub image_url: Option<String>,
    pub modifiers: Option<Vec<ModifierGroup>>,
    pub available: bool,
}

/// A group of modifiers for a menu item.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ModifierGroup {
    pub id: String,
    pub name: String,
    pub required: bool,
    pub min_selections: i32,
    pub max_selections: i32,
    pub options: Vec<ModifierOption>,
}

/// A modifier option.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ModifierOption {
    pub id: String,
    pub name: String,
    #[serde(rename = "priceCents")]
    pub price_cents: i32,
    pub available: bool,
}

/// Order submission to POS.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OrderSubmission {
    pub items: Vec<OrderItemSubmission>,
    pub customer_name: Option<String>,
    pub customer_phone: Option<String>,
}

/// Item in an order submission.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OrderItemSubmission {
    pub menu_item_id: String,
    pub name: String,
    pub quantity: i32,
    pub price_cents: i32,
    pub modifiers: Vec<OrderModifier>,
    pub special_instructions: Option<String>,
}

/// A modifier on an order item.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct OrderModifier {
    pub id: String,
    pub name: String,
    pub price_cents: i32,
}

/// Order status from POS.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum OrderStatus {
    Pending,
    Submitted,
    Preparing,
    Ready,
    PickedUp,
    Cancelled,
}

impl std::fmt::Display for OrderStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let s = match self {
            OrderStatus::Pending => "pending",
            OrderStatus::Submitted => "submitted",
            OrderStatus::Preparing => "preparing",
            OrderStatus::Ready => "ready",
            OrderStatus::PickedUp => "picked_up",
            OrderStatus::Cancelled => "cancelled",
        };
        write!(f, "{}", s)
    }
}
