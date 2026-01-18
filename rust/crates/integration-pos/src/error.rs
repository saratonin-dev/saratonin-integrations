//! POS integration errors.

use thiserror::Error;

/// Errors from POS operations.
#[derive(Debug, Error)]
pub enum PosError {
    /// Menu not found.
    #[error("Menu not found")]
    MenuNotFound,

    /// Item not found.
    #[error("Item not found: {0}")]
    ItemNotFound(String),

    /// Order not found.
    #[error("Order not found: {0}")]
    OrderNotFound(String),

    /// POS API error.
    #[error("POS API error: {0}")]
    ApiError(String),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// Parse error.
    #[error("Parse error: {0}")]
    ParseError(String),

    /// HTTP/network error.
    #[error("Network error: {0}")]
    Network(#[from] reqwest::Error),
}
