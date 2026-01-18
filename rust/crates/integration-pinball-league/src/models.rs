//! League data models.

use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};

/// A league series (seasonal competition).
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Series {
    pub id: i64,
    pub name: String,
    pub status: String,
    pub tournament_count: Option<i32>,
    pub start_date: Option<String>,
    pub end_date: Option<String>,
}

/// API response for series.
#[derive(Debug, Clone, Deserialize)]
pub struct ApiSeries {
    #[serde(rename = "seriesId")]
    pub id: i64,
    pub name: String,
    pub status: String,
    #[serde(rename = "tournamentCount")]
    pub tournament_count: Option<i32>,
    #[serde(rename = "startDate")]
    pub start_date: Option<String>,
    #[serde(rename = "endDate")]
    pub end_date: Option<String>,
}

impl From<ApiSeries> for Series {
    fn from(api: ApiSeries) -> Self {
        Self {
            id: api.id,
            name: api.name,
            status: api.status,
            tournament_count: api.tournament_count,
            start_date: api.start_date,
            end_date: api.end_date,
        }
    }
}

/// A tournament event.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Tournament {
    pub id: i64,
    pub series_id: Option<i64>,
    pub name: String,
    pub status: String,
    pub tournament_type: Option<String>,
    pub player_count: Option<i32>,
    pub started_at: Option<String>,
    pub completed_at: Option<String>,
}

/// API response for tournament.
#[derive(Debug, Clone, Deserialize)]
pub struct ApiTournament {
    #[serde(rename = "tournamentId")]
    pub id: i64,
    #[serde(rename = "seriesId")]
    pub series_id: Option<i64>,
    pub name: String,
    pub status: String,
    #[serde(rename = "type")]
    pub tournament_type: Option<String>,
    #[serde(rename = "playerCount")]
    pub player_count: Option<i32>,
    #[serde(rename = "startedAt")]
    pub started_at: Option<String>,
    #[serde(rename = "completedAt")]
    pub completed_at: Option<String>,
}

impl From<ApiTournament> for Tournament {
    fn from(api: ApiTournament) -> Self {
        Self {
            id: api.id,
            series_id: api.series_id,
            name: api.name,
            status: api.status,
            tournament_type: api.tournament_type,
            player_count: api.player_count,
            started_at: api.started_at,
            completed_at: api.completed_at,
        }
    }
}

/// A player in the league.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Player {
    pub id: i64,
    pub name: String,
    pub ifpa_id: Option<i64>,
}

/// API response for player.
#[derive(Debug, Clone, Deserialize)]
pub struct ApiPlayer {
    #[serde(rename = "playerId")]
    pub id: i64,
    pub name: String,
    #[serde(rename = "ifpaId")]
    pub ifpa_id: Option<i64>,
}

impl From<ApiPlayer> for Player {
    fn from(api: ApiPlayer) -> Self {
        Self {
            id: api.id,
            name: api.name,
            ifpa_id: api.ifpa_id,
        }
    }
}

/// A standing in a series or tournament.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Standing {
    pub rank: i32,
    pub player_id: i64,
    pub player_name: String,
    pub points: Option<f64>,
    pub wins: Option<i32>,
    pub losses: Option<i32>,
}

/// API response for standing.
#[derive(Debug, Clone, Deserialize)]
pub struct ApiStanding {
    pub position: i32,
    #[serde(rename = "playerId")]
    pub player_id: i64,
    pub points: Option<f64>,
    pub wins: Option<i32>,
    pub losses: Option<i32>,
}

impl Standing {
    pub fn from_api(api: ApiStanding, player_name: String) -> Self {
        Self {
            rank: api.position,
            player_id: api.player_id,
            player_name,
            points: api.points,
            wins: api.wins,
            losses: api.losses,
        }
    }
}

/// Overview of a league location.
#[derive(Debug, Clone, Serialize)]
pub struct LeagueOverview {
    pub active_series: Option<Series>,
    pub standings: Vec<Standing>,
    pub recent_tournaments: Vec<Tournament>,
    pub upcoming_tournaments: Vec<Tournament>,
    pub last_updated: Option<DateTime<Utc>>,
}

/// Detailed view of a series.
#[derive(Debug, Clone, Serialize)]
pub struct SeriesDetail {
    pub series: Series,
    pub standings: Vec<Standing>,
    pub tournaments: Vec<Tournament>,
}

/// Detailed view of a tournament.
#[derive(Debug, Clone, Serialize)]
pub struct TournamentDetail {
    pub tournament: Tournament,
    pub standings: Vec<Standing>,
}

/// Player profile with aggregated stats.
#[derive(Debug, Clone, Serialize)]
pub struct PlayerProfile {
    pub player: Player,
    pub current_series_rank: Option<i32>,
    pub current_series_points: Option<f64>,
    pub total_tournaments: i32,
    pub total_wins: i32,
    pub total_losses: i32,
    pub win_rate: Option<f64>,
    pub best_finish: Option<i32>,
    pub tournament_history: Vec<PlayerTournamentStats>,
}

/// Player stats for a single tournament.
#[derive(Debug, Clone, Serialize)]
pub struct PlayerTournamentStats {
    pub tournament_id: i64,
    pub tournament_name: Option<String>,
    pub rank: Option<i32>,
    pub points: Option<f64>,
    pub wins: Option<i32>,
    pub losses: Option<i32>,
    pub date: Option<String>,
}
