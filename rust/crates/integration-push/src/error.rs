//! Push notification errors.

use thiserror::Error;

/// Errors from push notification operations.
#[derive(Debug, Error)]
pub enum PushError {
    /// Invalid device token.
    #[error("Invalid device token: {0}")]
    InvalidToken(String),

    /// Invalid platform.
    #[error("Invalid platform: {0}")]
    InvalidPlatform(String),

    /// Push service unavailable.
    #[error("Push service unavailable: {0}")]
    ServiceUnavailable(String),

    /// Send failed.
    #[error("Send failed: {0}")]
    SendFailed(String),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// HTTP/network error.
    #[error("Network error: {0}")]
    Network(#[from] reqwest::Error),
}
