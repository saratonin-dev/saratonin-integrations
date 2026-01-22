//! Apple Push Notification Service integration.

use async_trait::async_trait;
use integration_core::HttpClientBuilder;
use reqwest::Client;
use serde::Serialize;
use tracing::info;

use crate::{Notification, PushError, PushService};

/// Configuration for APNS.
#[derive(Debug, Clone)]
pub struct ApnsConfig {
    /// Team ID from Apple Developer account.
    pub team_id: String,
    /// Key ID for the APNS auth key.
    pub key_id: String,
    /// Path to the .p8 auth key file.
    pub key_path: String,
    /// Bundle ID of the app.
    pub bundle_id: String,
    /// Use sandbox (development) or production environment.
    pub sandbox: bool,
}

impl ApnsConfig {
    /// Create config from environment variables.
    ///
    /// Expects:
    /// - `APNS_TEAM_ID`
    /// - `APNS_KEY_ID`
    /// - `APNS_KEY_PATH`
    /// - `APNS_BUNDLE_ID`
    /// - `APNS_SANDBOX` (optional, defaults to false)
    pub fn from_env() -> Result<Self, PushError> {
        Ok(Self {
            team_id: std::env::var("APNS_TEAM_ID")
                .map_err(|_| PushError::Config("APNS_TEAM_ID not set".into()))?,
            key_id: std::env::var("APNS_KEY_ID")
                .map_err(|_| PushError::Config("APNS_KEY_ID not set".into()))?,
            key_path: std::env::var("APNS_KEY_PATH")
                .map_err(|_| PushError::Config("APNS_KEY_PATH not set".into()))?,
            bundle_id: std::env::var("APNS_BUNDLE_ID")
                .map_err(|_| PushError::Config("APNS_BUNDLE_ID not set".into()))?,
            sandbox: std::env::var("APNS_SANDBOX")
                .map(|v| v == "true" || v == "1")
                .unwrap_or(false),
        })
    }

    /// Get the APNS host URL.
    fn host(&self) -> &str {
        if self.sandbox {
            "https://api.sandbox.push.apple.com"
        } else {
            "https://api.push.apple.com"
        }
    }
}

/// Apple Push Notification Service.
pub struct ApnsPushService {
    config: ApnsConfig,
    client: Client,
}

impl ApnsPushService {
    /// Create a new APNS push service.
    pub fn new(config: ApnsConfig) -> Result<Self, PushError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-push/0.1.0")
            .build()
            .map_err(PushError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment variables.
    pub fn from_env() -> Result<Self, PushError> {
        Self::new(ApnsConfig::from_env()?)
    }
}

#[derive(Serialize)]
struct ApnsPayload {
    aps: ApnsAps,
    #[serde(flatten)]
    data: serde_json::Value,
}

#[derive(Serialize)]
struct ApnsAps {
    alert: ApnsAlert,
    #[serde(skip_serializing_if = "Option::is_none")]
    badge: Option<u32>,
    #[serde(skip_serializing_if = "Option::is_none")]
    sound: Option<String>,
}

#[derive(Serialize)]
struct ApnsAlert {
    title: String,
    body: String,
}

#[async_trait]
impl PushService for ApnsPushService {
    async fn send(&self, device_token: &str, notification: &Notification) -> Result<(), PushError> {
        let url = format!("{}/3/device/{}", self.config.host(), device_token);

        let payload = ApnsPayload {
            aps: ApnsAps {
                alert: ApnsAlert {
                    title: notification.title.clone(),
                    body: notification.body.clone(),
                },
                badge: notification.badge,
                sound: notification.sound.clone(),
            },
            data: notification.data.clone(),
        };

        // Note: In production, you'd need to generate a JWT token using the .p8 key
        // This is a simplified version that assumes Bearer token auth is pre-configured
        let response = self
            .client
            .post(&url)
            .header("apns-topic", &self.config.bundle_id)
            .header("apns-push-type", "alert")
            .json(&payload)
            .send()
            .await?;

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            return Err(PushError::SendFailed(format!(
                "APNS error: {} - {}",
                status, text
            )));
        }

        info!(device_token, "APNS notification sent");
        Ok(())
    }
}
