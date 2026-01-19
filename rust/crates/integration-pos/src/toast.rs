//! Toast POS API integration.

use async_trait::async_trait;
use integration_core::HttpClientBuilder;
use reqwest::Client;
use tracing::info;

use crate::{Menu, MenuItem, OrderSubmission, PosError, PosService};

/// Configuration for Toast POS service.
#[derive(Debug, Clone)]
pub struct ToastConfig {
    /// Toast API base URL.
    pub api_base_url: String,
    /// Toast API key.
    pub api_key: String,
    /// Restaurant GUID.
    pub restaurant_guid: String,
}

impl ToastConfig {
    /// Create config from environment variables.
    ///
    /// Expects:
    /// - `TOAST_API_URL`
    /// - `TOAST_API_KEY`
    /// - `TOAST_RESTAURANT_GUID`
    pub fn from_env() -> Result<Self, PosError> {
        Ok(Self {
            api_base_url: std::env::var("TOAST_API_URL")
                .unwrap_or_else(|_| "https://ws-api.toasttab.com".to_string()),
            api_key: std::env::var("TOAST_API_KEY")
                .map_err(|_| PosError::Config("TOAST_API_KEY not set".into()))?,
            restaurant_guid: std::env::var("TOAST_RESTAURANT_GUID")
                .map_err(|_| PosError::Config("TOAST_RESTAURANT_GUID not set".into()))?,
        })
    }
}

/// Toast POS service for production.
pub struct ToastPosService {
    config: ToastConfig,
    client: Client,
}

impl ToastPosService {
    /// Create a new Toast POS service.
    pub fn new(config: ToastConfig) -> Result<Self, PosError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-pos/0.1.0")
            .build()
            .map_err(PosError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment variables.
    pub fn from_env() -> Result<Self, PosError> {
        Self::new(ToastConfig::from_env()?)
    }
}

#[async_trait]
impl PosService for ToastPosService {
    async fn get_menu(&self) -> Result<Menu, PosError> {
        let url = format!("{}/menus/v2/menus", self.config.api_base_url);

        let response = self
            .client
            .get(&url)
            .header("Toast-Restaurant-External-ID", &self.config.restaurant_guid)
            .header("Authorization", format!("Bearer {}", self.config.api_key))
            .send()
            .await?;

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            return Err(PosError::ApiError(format!(
                "Toast API error: {} - {}",
                status, text
            )));
        }

        let menu: Menu = response
            .json()
            .await
            .map_err(|e| PosError::ParseError(format!("Failed to parse menu: {}", e)))?;

        info!(
            "Toast: Retrieved menu with {} categories",
            menu.categories.len()
        );
        Ok(menu)
    }

    async fn get_menu_item(&self, item_id: &str) -> Result<Option<MenuItem>, PosError> {
        // Toast API doesn't have a single-item endpoint, so we get the full menu
        // In production, this would be cached
        let menu = self.get_menu().await?;

        for category in menu.categories {
            for item in category.items {
                if item.id == item_id {
                    return Ok(Some(item));
                }
            }
        }

        Ok(None)
    }

    async fn submit_order(&self, order: &OrderSubmission) -> Result<String, PosError> {
        let url = format!("{}/orders/v2/orders", self.config.api_base_url);

        let response = self
            .client
            .post(&url)
            .header("Toast-Restaurant-External-ID", &self.config.restaurant_guid)
            .header("Authorization", format!("Bearer {}", self.config.api_key))
            .json(order)
            .send()
            .await?;

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            return Err(PosError::ApiError(format!(
                "Toast API error: {} - {}",
                status, text
            )));
        }

        #[derive(serde::Deserialize)]
        struct OrderResponse {
            guid: String,
        }

        let result: OrderResponse = response
            .json()
            .await
            .map_err(|e| PosError::ParseError(format!("Failed to parse order response: {}", e)))?;

        info!(order_id = result.guid, "Toast: Order submitted");
        Ok(result.guid)
    }

    async fn get_order_status(&self, pos_order_id: &str) -> Result<String, PosError> {
        let url = format!(
            "{}/orders/v2/orders/{}",
            self.config.api_base_url, pos_order_id
        );

        let response = self
            .client
            .get(&url)
            .header("Toast-Restaurant-External-ID", &self.config.restaurant_guid)
            .header("Authorization", format!("Bearer {}", self.config.api_key))
            .send()
            .await?;

        if response.status() == reqwest::StatusCode::NOT_FOUND {
            return Err(PosError::OrderNotFound(pos_order_id.to_string()));
        }

        if !response.status().is_success() {
            let status = response.status();
            let text = response.text().await.unwrap_or_default();
            return Err(PosError::ApiError(format!(
                "Toast API error: {} - {}",
                status, text
            )));
        }

        #[derive(serde::Deserialize)]
        struct StatusResponse {
            #[serde(rename = "approvalStatus")]
            approval_status: String,
        }

        let result: StatusResponse = response
            .json()
            .await
            .map_err(|e| PosError::ParseError(format!("Failed to parse status response: {}", e)))?;

        Ok(result.approval_status)
    }
}
