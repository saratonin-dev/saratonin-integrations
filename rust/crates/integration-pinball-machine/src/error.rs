//! Machine data integration errors.

use thiserror::Error;

/// Errors from machine data operations.
#[derive(Debug, Error)]
pub enum MachineError {
    /// Pinball Map API error.
    #[error("Pinball Map API error: {0}")]
    PinballMap(String),

    /// OPDB error.
    #[error("OPDB error: {0}")]
    Opdb(String),

    /// Pintips error.
    #[error("Pintips error: {0}")]
    Pintips(String),

    /// Machine not found.
    #[error("Machine not found: {0}")]
    NotFound(String),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// HTTP/network error.
    #[error("Network error: {0}")]
    Network(#[from] reqwest::Error),

    /// JSON parse error.
    #[error("JSON error: {0}")]
    Json(#[from] serde_json::Error),

    /// IO error.
    #[error("IO error: {0}")]
    Io(#[from] std::io::Error),
}
