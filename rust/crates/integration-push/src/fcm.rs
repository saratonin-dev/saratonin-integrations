//! Firebase Cloud Messaging integration.

use async_trait::async_trait;
use integration_core::HttpClientBuilder;
use reqwest::Client;
use serde::Serialize;
use tracing::info;

use crate::{Notification, PushError, PushService};

/// Configuration for FCM.
#[derive(Debug, Clone)]
pub struct FcmConfig {
    /// FCM server key (legacy) or service account credentials path.
    pub server_key: String,
    /// FCM project ID (for v1 API).
    pub project_id: Option<String>,
}

impl FcmConfig {
    /// Create config from environment variables.
    ///
    /// Expects:
    /// - `FCM_SERVER_KEY`
    /// - `FCM_PROJECT_ID` (optional, for v1 API)
    pub fn from_env() -> Result<Self, PushError> {
        Ok(Self {
            server_key: std::env::var("FCM_SERVER_KEY")
                .map_err(|_| PushError::Config("FCM_SERVER_KEY not set".into()))?,
            project_id: std::env::var("FCM_PROJECT_ID").ok(),
        })
    }
}

/// Firebase Cloud Messaging service.
pub struct FcmPushService {
    config: FcmConfig,
    client: Client,
}

impl FcmPushService {
    /// Create a new FCM push service.
    pub fn new(config: FcmConfig) -> Result<Self, PushError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-push/0.1.0")
            .build()
            .map_err(PushError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment variables.
    pub fn from_env() -> Result<Self, PushError> {
        Self::new(FcmConfig::from_env()?)
    }
}

#[derive(Serialize)]
struct FcmMessage {
    to: String,
    notification: FcmNotification,
    #[serde(skip_serializing_if = "serde_json::Value::is_null")]
    data: serde_json::Value,
}

#[derive(Serialize)]
struct FcmNotification {
    title: String,
    body: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    sound: Option<String>,
}

#[async_trait]
impl PushService for FcmPushService {
    async fn send(&self, device_token: &str, notification: &Notification) -> Result<(), PushError> {
        let url = "https://fcm.googleapis.com/fcm/send";

        let message = FcmMessage {
            to: device_token.to_string(),
            notification: FcmNotification {
                title: notification.title.clone(),
                body: notification.body.clone(),
                sound: notification.sound.clone(),
            },
            data: notification.data.clone(),
        };

        let response = self
            .client
            .post(url)
            .header("Authorization", format!("key={}", self.config.server_key))
            .header("Content-Type", "application/json")
            .json(&message)
            .send()
            .await?;

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            return Err(PushError::SendFailed(format!(
                "FCM error: {} - {}",
                status, text
            )));
        }

        info!(device_token, "FCM notification sent");
        Ok(())
    }
}
