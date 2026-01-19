//! SMS integration errors.

use integration_core::IntegrationError;
use thiserror::Error;

/// Errors from SMS/OTP operations.
#[derive(Debug, Error)]
pub enum SmsError {
    /// Rate limit exceeded.
    #[error("Rate limited: {0}")]
    RateLimited(String),

    /// Invalid phone number format.
    #[error("Invalid phone number: {0}")]
    InvalidPhone(String),

    /// Verification not found.
    #[error("No pending verification for this phone number")]
    NotFound,

    /// Twilio API error.
    #[error("Twilio API error: {0}")]
    TwilioError(String),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// HTTP/network error.
    #[error("Network error: {0}")]
    Network(#[from] reqwest::Error),
}

impl From<IntegrationError> for SmsError {
    fn from(err: IntegrationError) -> Self {
        match err {
            IntegrationError::RateLimited { .. } => {
                SmsError::RateLimited("Too many requests".to_string())
            }
            IntegrationError::NotFound(_) => SmsError::NotFound,
            IntegrationError::Config(msg) => SmsError::Config(msg),
            IntegrationError::Http(e) => SmsError::Network(e),
            other => SmsError::TwilioError(other.to_string()),
        }
    }
}
