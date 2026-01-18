//! Core utilities for saratonin integrations.
//!
//! This crate provides shared functionality for all integration crates:
//! - Retry policies with exponential backoff
//! - In-memory caching with TTL
//! - HTTP client builder with common configuration

pub mod cache;
pub mod error;
pub mod http;
pub mod retry;

pub use cache::Cache;
pub use error::IntegrationError;
pub use http::HttpClientBuilder;
pub use retry::RetryPolicy;

#[cfg(test)]
mod tests {
    use super::*;
    use std::time::Duration;

    #[test]
    fn test_cache_basic_operations() {
        let cache: Cache<String> = Cache::new(Duration::from_secs(60));

        cache.insert("key1".to_string(), "value1".to_string());
        assert_eq!(cache.get(&"key1".to_string()), Some("value1".to_string()));
        assert_eq!(cache.get(&"key2".to_string()), None);
    }

    #[test]
    fn test_retry_policy_delays() {
        let policy = RetryPolicy::default();
        assert_eq!(policy.max_retries, 3);

        let delay1 = policy.delay_for_attempt(1);
        let delay2 = policy.delay_for_attempt(2);
        assert!(delay2 > delay1);
    }

    #[test]
    fn test_http_client_builder() {
        let client = HttpClientBuilder::new()
            .timeout(Duration::from_secs(30))
            .user_agent("test-agent")
            .build()
            .unwrap();

        // Client should be usable
        assert!(client.get("https://example.com").build().is_ok());
    }
}
