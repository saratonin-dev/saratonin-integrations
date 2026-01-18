//! SMS/OTP integration via Twilio Verify API.
//!
//! This crate provides:
//! - `OtpService` trait for OTP verification
//! - `TwilioOtpService` - Production Twilio Verify integration
//! - `MockOtpService` - Development mock with console logging

mod error;
mod mock;
mod twilio;

pub use error::SmsError;
pub use mock::MockOtpService;
pub use twilio::{TwilioConfig, TwilioOtpService};

use async_trait::async_trait;

/// Status of an OTP verification attempt.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum VerificationStatus {
    /// Verification code has been sent, waiting for user input.
    Pending,
    /// Code was correct, verification approved.
    Approved,
    /// Verification was canceled.
    Canceled,
    /// Verification failed with reason.
    Failed(String),
}

/// Trait for OTP verification services.
#[async_trait]
pub trait OtpService: Send + Sync {
    /// Start a verification by sending an OTP code to the phone number.
    async fn start_verification(&self, phone: &str) -> Result<(), SmsError>;

    /// Check if the provided code matches the pending verification.
    async fn check_verification(&self, phone: &str, code: &str) -> Result<VerificationStatus, SmsError>;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_mock_otp_flow() {
        let service = MockOtpService::new();

        // Start verification
        service.start_verification("+15551234567").await.unwrap();

        // Wrong code should fail
        let status = service.check_verification("+15551234567", "000000").await.unwrap();
        assert_eq!(status, VerificationStatus::Pending);

        // Correct code should succeed
        let status = service.check_verification("+15551234567", "123456").await.unwrap();
        assert_eq!(status, VerificationStatus::Approved);

        // Subsequent check should fail (code consumed)
        let status = service.check_verification("+15551234567", "123456").await.unwrap();
        assert!(matches!(status, VerificationStatus::Failed(_)));
    }

    #[tokio::test]
    async fn test_mock_otp_no_pending() {
        let service = MockOtpService::new();

        // Check without starting should fail
        let status = service.check_verification("+15551234567", "123456").await.unwrap();
        assert!(matches!(status, VerificationStatus::Failed(_)));
    }
}
