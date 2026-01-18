//! Common error types for integrations.

use thiserror::Error;

/// Common integration errors.
#[derive(Debug, Error)]
pub enum IntegrationError {
    /// HTTP request failed.
    #[error("HTTP error: {0}")]
    Http(#[from] reqwest::Error),

    /// JSON serialization/deserialization failed.
    #[error("JSON error: {0}")]
    Json(#[from] serde_json::Error),

    /// Rate limit exceeded.
    #[error("Rate limited, retry after {retry_after_secs:?} seconds")]
    RateLimited {
        retry_after_secs: Option<u64>,
    },

    /// Authentication failed.
    #[error("Authentication failed: {0}")]
    AuthFailed(String),

    /// Resource not found.
    #[error("Not found: {0}")]
    NotFound(String),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// Service unavailable.
    #[error("Service unavailable: {0}")]
    ServiceUnavailable(String),

    /// Generic API error.
    #[error("API error ({status}): {message}")]
    Api {
        status: u16,
        message: String,
    },
}

impl IntegrationError {
    /// Check if this error is retryable.
    pub fn is_retryable(&self) -> bool {
        matches!(
            self,
            IntegrationError::Http(_)
                | IntegrationError::RateLimited { .. }
                | IntegrationError::ServiceUnavailable(_)
        )
    }

    /// Create from HTTP status code and message.
    pub fn from_status(status: u16, message: impl Into<String>) -> Self {
        match status {
            401 | 403 => IntegrationError::AuthFailed(message.into()),
            404 => IntegrationError::NotFound(message.into()),
            429 => IntegrationError::RateLimited { retry_after_secs: None },
            503 => IntegrationError::ServiceUnavailable(message.into()),
            _ => IntegrationError::Api {
                status,
                message: message.into(),
            },
        }
    }
}
