//! Push notification integration via FCM and APNS.
//!
//! This crate provides:
//! - `PushService` trait for sending push notifications
//! - `FcmPushService` - Firebase Cloud Messaging integration
//! - `ApnsPushService` - Apple Push Notification Service integration
//! - `MockPushService` - Development mock with console logging

mod apns;
mod error;
mod fcm;
mod mock;

pub use apns::{ApnsConfig, ApnsPushService};
pub use error::PushError;
pub use fcm::{FcmConfig, FcmPushService};
pub use mock::MockPushService;

use async_trait::async_trait;
use serde::{Deserialize, Serialize};

/// Platform type for push notifications.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum Platform {
    /// iOS (APNS)
    Ios,
    /// Android (FCM)
    Android,
}

impl std::str::FromStr for Platform {
    type Err = PushError;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s.to_lowercase().as_str() {
            "ios" | "apple" | "apns" => Ok(Platform::Ios),
            "android" | "fcm" | "google" => Ok(Platform::Android),
            _ => Err(PushError::InvalidPlatform(s.to_string())),
        }
    }
}

/// A push notification to send.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Notification {
    /// Notification title.
    pub title: String,
    /// Notification body.
    pub body: String,
    /// Custom data payload.
    #[serde(default)]
    pub data: serde_json::Value,
    /// Badge count (iOS only).
    pub badge: Option<u32>,
    /// Sound to play.
    pub sound: Option<String>,
}

impl Notification {
    /// Create a simple notification with title and body.
    pub fn new(title: impl Into<String>, body: impl Into<String>) -> Self {
        Self {
            title: title.into(),
            body: body.into(),
            data: serde_json::json!({}),
            badge: None,
            sound: None,
        }
    }

    /// Add custom data to the notification.
    pub fn with_data(mut self, data: serde_json::Value) -> Self {
        self.data = data;
        self
    }

    /// Set the badge count.
    pub fn with_badge(mut self, badge: u32) -> Self {
        self.badge = Some(badge);
        self
    }

    /// Set the sound to play.
    pub fn with_sound(mut self, sound: impl Into<String>) -> Self {
        self.sound = Some(sound.into());
        self
    }
}

/// Trait for push notification services.
#[async_trait]
pub trait PushService: Send + Sync {
    /// Send a notification to a device.
    async fn send(
        &self,
        device_token: &str,
        notification: &Notification,
    ) -> Result<(), PushError>;

    /// Send a notification to multiple devices.
    async fn send_batch(
        &self,
        device_tokens: &[String],
        notification: &Notification,
    ) -> Result<Vec<Result<(), PushError>>, PushError> {
        let mut results = Vec::with_capacity(device_tokens.len());
        for token in device_tokens {
            results.push(self.send(token, notification).await);
        }
        Ok(results)
    }
}

/// Helper functions for common notifications.
pub mod notifications {
    use super::Notification;

    /// Create an "order ready" notification.
    pub fn order_ready(order_id: &str) -> Notification {
        Notification::new(
            "Your Order is Ready!",
            format!("Order #{} is ready for pickup", &order_id[..8.min(order_id.len())]),
        )
        .with_data(serde_json::json!({
            "type": "order_ready",
            "order_id": order_id
        }))
        .with_sound("default".to_string())
    }

    /// Create a "new message" notification.
    pub fn new_message(from: &str, preview: &str) -> Notification {
        Notification::new(
            format!("Message from {}", from),
            preview.chars().take(100).collect::<String>(),
        )
        .with_data(serde_json::json!({
            "type": "message",
            "from": from
        }))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_mock_push_send() {
        let service = MockPushService::new();
        let notification = Notification::new("Test", "Test body");

        let result = service.send("test-token", &notification).await;
        assert!(result.is_ok());
    }

    #[tokio::test]
    async fn test_mock_push_batch() {
        let service = MockPushService::new();
        let notification = Notification::new("Test", "Test body");
        let tokens = vec!["token1".to_string(), "token2".to_string()];

        let results = service.send_batch(&tokens, &notification).await.unwrap();
        assert_eq!(results.len(), 2);
        assert!(results.iter().all(|r| r.is_ok()));
    }

    #[test]
    fn test_notification_builder() {
        let notification = Notification::new("Title", "Body")
            .with_badge(5)
            .with_sound("ping")
            .with_data(serde_json::json!({"key": "value"}));

        assert_eq!(notification.title, "Title");
        assert_eq!(notification.badge, Some(5));
        assert_eq!(notification.sound, Some("ping".to_string()));
    }

    #[test]
    fn test_platform_parsing() {
        assert_eq!("ios".parse::<Platform>().unwrap(), Platform::Ios);
        assert_eq!("android".parse::<Platform>().unwrap(), Platform::Android);
        assert_eq!("fcm".parse::<Platform>().unwrap(), Platform::Android);
        assert!("invalid".parse::<Platform>().is_err());
    }
}
