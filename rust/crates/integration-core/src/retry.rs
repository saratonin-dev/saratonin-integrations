//! Retry policy with exponential backoff.

use std::time::Duration;
use tracing::warn;

/// Configuration for retry behavior.
#[derive(Debug, Clone)]
pub struct RetryPolicy {
    /// Maximum number of retry attempts.
    pub max_retries: u32,
    /// Initial delay between retries.
    pub initial_delay: Duration,
    /// Maximum delay between retries.
    pub max_delay: Duration,
    /// Multiplier for exponential backoff.
    pub multiplier: f64,
}

impl Default for RetryPolicy {
    fn default() -> Self {
        Self {
            max_retries: 3,
            initial_delay: Duration::from_millis(100),
            max_delay: Duration::from_secs(10),
            multiplier: 2.0,
        }
    }
}

impl RetryPolicy {
    /// Create a new retry policy.
    pub fn new(max_retries: u32) -> Self {
        Self {
            max_retries,
            ..Default::default()
        }
    }

    /// Set the initial delay.
    pub fn with_initial_delay(mut self, delay: Duration) -> Self {
        self.initial_delay = delay;
        self
    }

    /// Set the maximum delay.
    pub fn with_max_delay(mut self, delay: Duration) -> Self {
        self.max_delay = delay;
        self
    }

    /// Calculate delay for a given attempt number (1-indexed).
    pub fn delay_for_attempt(&self, attempt: u32) -> Duration {
        let multiplier = self.multiplier.powi(attempt as i32 - 1);
        let delay_ms = self.initial_delay.as_millis() as f64 * multiplier;
        let delay = Duration::from_millis(delay_ms as u64);
        delay.min(self.max_delay)
    }

    /// Execute an async function with retries.
    pub async fn execute<F, Fut, T, E>(&self, mut f: F) -> Result<T, E>
    where
        F: FnMut() -> Fut,
        Fut: std::future::Future<Output = Result<T, E>>,
        E: std::fmt::Display,
    {
        let mut attempt = 0;
        loop {
            attempt += 1;
            match f().await {
                Ok(result) => return Ok(result),
                Err(e) if attempt <= self.max_retries => {
                    let delay = self.delay_for_attempt(attempt);
                    warn!(
                        attempt,
                        max_retries = self.max_retries,
                        delay_ms = delay.as_millis(),
                        error = %e,
                        "Request failed, retrying"
                    );
                    tokio::time::sleep(delay).await;
                }
                Err(e) => return Err(e),
            }
        }
    }
}
