//! HTTP client builder with common configuration.

use reqwest::{Client, ClientBuilder};
use std::time::Duration;

/// Builder for creating pre-configured HTTP clients.
pub struct HttpClientBuilder {
    timeout: Duration,
    user_agent: String,
    accept_invalid_certs: bool,
}

impl Default for HttpClientBuilder {
    fn default() -> Self {
        Self {
            timeout: Duration::from_secs(30),
            user_agent: format!("saratonin-integrations/{}", env!("CARGO_PKG_VERSION")),
            accept_invalid_certs: false,
        }
    }
}

impl HttpClientBuilder {
    /// Create a new HTTP client builder.
    pub fn new() -> Self {
        Self::default()
    }

    /// Set the request timeout.
    pub fn timeout(mut self, timeout: Duration) -> Self {
        self.timeout = timeout;
        self
    }

    /// Set the User-Agent header.
    pub fn user_agent(mut self, user_agent: impl Into<String>) -> Self {
        self.user_agent = user_agent.into();
        self
    }

    /// Accept invalid TLS certificates (for development only).
    pub fn accept_invalid_certs(mut self, accept: bool) -> Self {
        self.accept_invalid_certs = accept;
        self
    }

    /// Build the HTTP client.
    pub fn build(self) -> Result<Client, reqwest::Error> {
        ClientBuilder::new()
            .timeout(self.timeout)
            .user_agent(&self.user_agent)
            .danger_accept_invalid_certs(self.accept_invalid_certs)
            .build()
    }
}
