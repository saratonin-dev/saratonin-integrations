/// Dart models for saratonin integrations.
///
/// Provides type-safe models matching the Rust backend:
/// - [Machine], [MachinesResponse] for pinball machines
/// - [Tournament], [Standing], [LeagueOverview] for leagues
/// - [AuthTokens], [User] for authentication
/// - [LocalScore] for local high scores
library;

// Machine models
export 'src/models/machine.dart';

// League models
export 'src/models/league.dart';

// Auth models
export 'src/models/auth.dart';

// Score models
export 'src/models/score.dart';
