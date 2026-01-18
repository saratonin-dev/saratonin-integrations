# saratonin-integrations

Reusable third-party API integrations for the saratonin platform.

## Structure

```
rust/crates/
├── integration-core/           # Shared traits, retry, cache utilities
├── integration-sms/            # Twilio SMS/OTP (+ mock)
├── integration-pos/            # Toast POS (+ mock)
├── integration-push/           # FCM + APNS push notifications
├── integration-pinball-machine/ # Machine data: Pinball Map + OPDB + Pintips
└── integration-pinball-league/  # Competition: Matchplay Events API

flutter/packages/
└── integrations_client/        # Dart models for mobile apps
```

## Design Principles

1. **Trait-based abstractions** - Each integration defines a trait with mock implementations for testing
2. **Retry with exponential backoff** - All HTTP clients use configurable retry policies
3. **Caching** - Response caching with configurable TTL via integration-core
4. **Error granularity** - Service-specific error types for precise error handling
5. **Configuration** - Environment-based config with sensible defaults

## Development

```bash
cd rust
cargo build --workspace
cargo test --workspace
cargo clippy --workspace
```

## Integration Pattern

Each integration follows this pattern:

```rust
// Service trait
#[async_trait]
pub trait SmsService: Send + Sync {
    async fn send_verification(&self, phone: &str) -> Result<(), SmsError>;
    async fn check_verification(&self, phone: &str, code: &str) -> Result<bool, SmsError>;
}

// Production implementation
pub struct TwilioSmsService { /* ... */ }

// Mock implementation
pub struct MockSmsService { /* ... */ }
```

## Crates

### integration-core
Shared utilities for all integrations:
- `RetryPolicy` - Configurable retry with exponential backoff
- `Cache<T>` - In-memory cache with TTL
- `HttpClientBuilder` - Pre-configured reqwest client builder

### integration-sms
SMS/OTP via Twilio Verify API:
- `TwilioSmsService` - Production Twilio integration
- `MockSmsService` - Console logging mock with hardcoded codes

### integration-pos
Point of Sale via Toast API:
- `ToastPosService` - Production Toast integration
- `MockPosService` - In-memory mock with sample data

### integration-push
Push notifications via FCM and APNS:
- `FcmPushService` - Firebase Cloud Messaging
- `ApnsPushService` - Apple Push Notification Service
- `MockPushService` - Console logging mock

### integration-pinball-machine
Pinball machine data from multiple sources:
- `PinballMapClient` - Machine list by location
- `OpdbLoader` - Machine metadata from OPDB CDN
- `PintipsLoader` - Strategy guides (pre-processed JSON)
- `MachineDataService` - Unified interface combining all sources

### integration-pinball-league
Tournament data from Matchplay Events:
- `MatchplayClient` - API client for series, tournaments, standings
- `LeagueDataService` - Caching layer with differential TTLs
