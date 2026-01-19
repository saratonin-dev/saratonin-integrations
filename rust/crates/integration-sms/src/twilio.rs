//! Twilio Verify API integration.

use async_trait::async_trait;
use integration_core::HttpClientBuilder;
use reqwest::Client;
use serde::Deserialize;
use tracing::info;

use crate::{OtpService, SmsError, VerificationStatus};

/// Configuration for Twilio Verify service.
#[derive(Debug, Clone)]
pub struct TwilioConfig {
    /// Twilio Account SID.
    pub account_sid: String,
    /// Twilio Auth Token.
    pub auth_token: String,
    /// Verify Service SID.
    pub verify_service_sid: String,
}

impl TwilioConfig {
    /// Create config from environment variables.
    ///
    /// Expects:
    /// - `TWILIO_ACCOUNT_SID`
    /// - `TWILIO_AUTH_TOKEN`
    /// - `TWILIO_VERIFY_SERVICE_SID`
    pub fn from_env() -> Result<Self, SmsError> {
        Ok(Self {
            account_sid: std::env::var("TWILIO_ACCOUNT_SID")
                .map_err(|_| SmsError::Config("TWILIO_ACCOUNT_SID not set".into()))?,
            auth_token: std::env::var("TWILIO_AUTH_TOKEN")
                .map_err(|_| SmsError::Config("TWILIO_AUTH_TOKEN not set".into()))?,
            verify_service_sid: std::env::var("TWILIO_VERIFY_SERVICE_SID")
                .map_err(|_| SmsError::Config("TWILIO_VERIFY_SERVICE_SID not set".into()))?,
        })
    }
}

/// Twilio Verify service for production OTP.
pub struct TwilioOtpService {
    config: TwilioConfig,
    client: Client,
}

impl TwilioOtpService {
    /// Create a new Twilio OTP service.
    pub fn new(config: TwilioConfig) -> Result<Self, SmsError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-sms/0.1.0")
            .build()
            .map_err(SmsError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment variables.
    pub fn from_env() -> Result<Self, SmsError> {
        Self::new(TwilioConfig::from_env()?)
    }
}

#[derive(Debug, Deserialize)]
struct TwilioVerificationResponse {
    status: String,
}

#[async_trait]
impl OtpService for TwilioOtpService {
    async fn start_verification(&self, phone: &str) -> Result<(), SmsError> {
        let url = format!(
            "https://verify.twilio.com/v2/Services/{}/Verifications",
            self.config.verify_service_sid
        );

        let params = [("To", phone), ("Channel", "sms")];

        let response = self
            .client
            .post(&url)
            .basic_auth(&self.config.account_sid, Some(&self.config.auth_token))
            .form(&params)
            .send()
            .await?;

        let status = response.status();

        if status == reqwest::StatusCode::TOO_MANY_REQUESTS {
            return Err(SmsError::RateLimited(
                "Too many verification requests. Please try again later.".into(),
            ));
        }

        if !status.is_success() {
            let text = response.text().await.unwrap_or_default();
            return Err(SmsError::TwilioError(format!(
                "Twilio Verify API error: {} - {}",
                status, text
            )));
        }

        info!(phone, "Twilio verification started");
        Ok(())
    }

    async fn check_verification(
        &self,
        phone: &str,
        code: &str,
    ) -> Result<VerificationStatus, SmsError> {
        let url = format!(
            "https://verify.twilio.com/v2/Services/{}/VerificationCheck",
            self.config.verify_service_sid
        );

        let params = [("To", phone), ("Code", code)];

        let response = self
            .client
            .post(&url)
            .basic_auth(&self.config.account_sid, Some(&self.config.auth_token))
            .form(&params)
            .send()
            .await?;

        let status = response.status();

        if status == reqwest::StatusCode::NOT_FOUND {
            return Ok(VerificationStatus::Failed(
                "No pending verification found".into(),
            ));
        }

        if status == reqwest::StatusCode::TOO_MANY_REQUESTS {
            return Err(SmsError::RateLimited(
                "Too many verification attempts. Please try again later.".into(),
            ));
        }

        if !status.is_success() {
            let text = response.text().await.unwrap_or_default();
            return Err(SmsError::TwilioError(format!(
                "Twilio Verify API error: {} - {}",
                status, text
            )));
        }

        let body: TwilioVerificationResponse = response.json().await.map_err(|e| {
            SmsError::TwilioError(format!("Failed to parse Twilio response: {}", e))
        })?;

        match body.status.as_str() {
            "approved" => {
                info!(phone, "Twilio verification approved");
                Ok(VerificationStatus::Approved)
            }
            "pending" => Ok(VerificationStatus::Pending),
            "canceled" => Ok(VerificationStatus::Canceled),
            other => Ok(VerificationStatus::Failed(format!(
                "Unexpected status: {}",
                other
            ))),
        }
    }
}
