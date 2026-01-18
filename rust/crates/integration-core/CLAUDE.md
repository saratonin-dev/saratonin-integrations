# integration-core

Shared utilities for all saratonin integrations.

## Modules

- `cache.rs` - Thread-safe in-memory cache with TTL
- `error.rs` - Common integration error types
- `http.rs` - Pre-configured HTTP client builder
- `retry.rs` - Retry policy with exponential backoff

## Usage

```rust
use integration_core::{Cache, HttpClientBuilder, RetryPolicy, IntegrationError};

// Create a cache with 5-minute TTL
let cache: Cache<String> = Cache::new(Duration::from_secs(300));
cache.insert("key".to_string(), "value".to_string());

// Create an HTTP client
let client = HttpClientBuilder::new()
    .timeout(Duration::from_secs(30))
    .build()?;

// Execute with retries
let policy = RetryPolicy::new(3);
let result = policy.execute(|| async {
    client.get("https://api.example.com/data").send().await
}).await?;
```
