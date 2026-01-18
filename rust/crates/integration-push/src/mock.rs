//! Mock push service for development and testing.

use async_trait::async_trait;
use tracing::info;

use crate::{Notification, PushError, PushService};

/// Mock push service that logs notifications to console.
pub struct MockPushService;

impl MockPushService {
    /// Create a new mock push service.
    pub fn new() -> Self {
        Self
    }
}

impl Default for MockPushService {
    fn default() -> Self {
        Self::new()
    }
}

#[async_trait]
impl PushService for MockPushService {
    async fn send(
        &self,
        device_token: &str,
        notification: &Notification,
    ) -> Result<(), PushError> {
        info!(
            device_token,
            title = notification.title,
            body = notification.body,
            "Mock push notification sent"
        );

        println!("\n╔════════════════════════════════════════╗");
        println!("║         MOCK PUSH NOTIFICATION         ║");
        println!("╠════════════════════════════════════════╣");
        println!("║ To: {:<33} ║", &device_token[..device_token.len().min(33)]);
        println!("║ Title: {:<30} ║", &notification.title[..notification.title.len().min(30)]);
        println!("║ Body: {:<31} ║", &notification.body[..notification.body.len().min(31)]);
        println!("╚════════════════════════════════════════╝\n");

        Ok(())
    }
}
