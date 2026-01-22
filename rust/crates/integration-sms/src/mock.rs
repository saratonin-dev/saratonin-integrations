//! Mock OTP service for development and testing.

use std::collections::HashMap;

use async_trait::async_trait;
use parking_lot::Mutex;
use tracing::info;

use crate::{OtpService, SmsError, VerificationStatus};

/// Mock OTP service that stores codes in memory.
///
/// Always uses "123456" as the verification code.
/// Useful for development and testing.
pub struct MockOtpService {
    pending_codes: Mutex<HashMap<String, String>>,
}

impl MockOtpService {
    /// Create a new mock OTP service.
    pub fn new() -> Self {
        Self {
            pending_codes: Mutex::new(HashMap::new()),
        }
    }
}

impl Default for MockOtpService {
    fn default() -> Self {
        Self::new()
    }
}

#[async_trait]
impl OtpService for MockOtpService {
    async fn start_verification(&self, phone: &str) -> Result<(), SmsError> {
        let code = "123456".to_string();

        {
            let mut codes = self.pending_codes.lock();
            codes.insert(phone.to_string(), code.clone());
        }

        info!(phone, "Mock OTP verification started");
        println!("\n╔════════════════════════════════════════╗");
        println!("║           MOCK OTP VERIFICATION        ║");
        println!("╠════════════════════════════════════════╣");
        println!("║ To: {:<33} ║", phone);
        println!("║ Code: {:<31} ║", code);
        println!("╚════════════════════════════════════════╝\n");

        Ok(())
    }

    async fn check_verification(
        &self,
        phone: &str,
        code: &str,
    ) -> Result<VerificationStatus, SmsError> {
        let stored_code = {
            let codes = self.pending_codes.lock();
            codes.get(phone).cloned()
        };

        match stored_code {
            Some(expected) if expected == code => {
                let mut codes = self.pending_codes.lock();
                codes.remove(phone);
                info!(phone, "Mock OTP verification approved");
                Ok(VerificationStatus::Approved)
            }
            Some(_) => {
                info!(phone, "Mock OTP invalid code");
                Ok(VerificationStatus::Pending)
            }
            None => {
                info!(phone, "Mock OTP no pending verification");
                Ok(VerificationStatus::Failed("No pending verification".into()))
            }
        }
    }
}
