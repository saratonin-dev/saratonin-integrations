# integrations_client

Dart models for saratonin integrations, matching the Rust backend types.

## Structure

```
lib/
├── integrations_client.dart    # Main export file
└── src/
    └── models/
        ├── machine.dart        # Pinball machine models
        ├── league.dart         # League/tournament models
        ├── auth.dart           # Authentication models
        └── score.dart          # Local score models
```

## Development

```bash
# Get dependencies
dart pub get

# Generate freezed/json_serializable code
dart run build_runner build --delete-conflicting-outputs

# Run tests
dart test

# Format code
dart format lib test
```

## Models

### Machine Models
- `Machine` - Pinball machine with enrichment data
- `MachineImage` - Machine images
- `Pintips` - Strategy guides
- `TipsSection` - Strategy guide sections
- `MachinesResponse` - Response with machine list

### League Models
- `Series` - Seasonal league competition
- `Tournament` - Individual tournament event
- `Player` - League player
- `Standing` - Player ranking
- `LeagueOverview` - Main league screen data
- `SeriesDetail` - Detailed series view
- `TournamentDetail` - Detailed tournament view
- `PlayerProfile` - Player with aggregated stats

### Auth Models
- `User` - User profile
- `AuthTokens` - Access + refresh tokens
- `OtpResponse` - OTP request response
- `RefreshResponse` - Token refresh response
- `ApiError` - Error response

### Score Models
- `LocalScore` - Local high score entry
- `SubmitScoreResponse` - Score submission response

## Usage

```dart
import 'package:integrations_client/integrations_client.dart';

// Parse machine response from API
final response = MachinesResponse.fromJson(jsonData);
for (final machine in response.machines) {
  print('${machine.name} (${machine.manufacturer})');
}

// Parse auth tokens
final tokens = AuthTokens.fromJson(authResponse);
print('Access token: ${tokens.accessToken}');
```
