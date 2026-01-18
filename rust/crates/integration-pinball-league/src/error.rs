//! League integration errors.

use thiserror::Error;

/// Errors from league operations.
#[derive(Debug, Error)]
pub enum LeagueError {
    /// Matchplay API error.
    #[error("Matchplay API error: {0}")]
    Api(String),

    /// Series not found.
    #[error("Series not found: {0}")]
    SeriesNotFound(i64),

    /// Tournament not found.
    #[error("Tournament not found: {0}")]
    TournamentNotFound(i64),

    /// Player not found.
    #[error("Player not found: {0}")]
    PlayerNotFound(i64),

    /// Configuration error.
    #[error("Configuration error: {0}")]
    Config(String),

    /// HTTP/network error.
    #[error("Network error: {0}")]
    Network(#[from] reqwest::Error),

    /// JSON parse error.
    #[error("JSON error: {0}")]
    Json(#[from] serde_json::Error),
}
