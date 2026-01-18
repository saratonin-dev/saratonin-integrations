//! Matchplay Events API client.

use integration_core::HttpClientBuilder;
use reqwest::Client;
use tracing::info;

use crate::{
    ApiPlayer, ApiSeries, ApiStanding, ApiTournament, LeagueError, Player, Series, Standing,
    Tournament,
};

const MATCHPLAY_BASE_URL: &str = "https://app.matchplay.events/api";

/// Configuration for Matchplay client.
#[derive(Debug, Clone)]
pub struct MatchplayConfig {
    /// API token for authentication.
    pub api_token: String,
    /// Organizer ID to filter results.
    pub organizer_id: i64,
    /// Base URL (defaults to production).
    pub base_url: String,
}

impl MatchplayConfig {
    /// Create config with token and organizer ID.
    pub fn new(api_token: impl Into<String>, organizer_id: i64) -> Self {
        Self {
            api_token: api_token.into(),
            organizer_id,
            base_url: MATCHPLAY_BASE_URL.to_string(),
        }
    }

    /// Create config from environment.
    ///
    /// Expects:
    /// - `MATCHPLAY_API_TOKEN`
    /// - `MATCHPLAY_ORGANIZER_ID`
    pub fn from_env() -> Result<Self, LeagueError> {
        let api_token = std::env::var("MATCHPLAY_API_TOKEN")
            .map_err(|_| LeagueError::Config("MATCHPLAY_API_TOKEN not set".into()))?;
        let organizer_id: i64 = std::env::var("MATCHPLAY_ORGANIZER_ID")
            .map_err(|_| LeagueError::Config("MATCHPLAY_ORGANIZER_ID not set".into()))?
            .parse()
            .map_err(|_| LeagueError::Config("Invalid MATCHPLAY_ORGANIZER_ID".into()))?;

        Ok(Self::new(api_token, organizer_id))
    }
}

/// Client for Matchplay Events API.
pub struct MatchplayClient {
    config: MatchplayConfig,
    client: Client,
}

impl MatchplayClient {
    /// Create a new Matchplay client.
    pub fn new(config: MatchplayConfig) -> Result<Self, LeagueError> {
        let client = HttpClientBuilder::new()
            .user_agent("saratonin-league/0.1.0")
            .build()
            .map_err(LeagueError::Network)?;

        Ok(Self { config, client })
    }

    /// Create from environment.
    pub fn from_env() -> Result<Self, LeagueError> {
        Self::new(MatchplayConfig::from_env()?)
    }

    /// Get series for the configured organizer.
    pub async fn get_series(&self) -> Result<Vec<Series>, LeagueError> {
        let url = format!(
            "{}/series?owner={}",
            self.config.base_url, self.config.organizer_id
        );

        let response = self
            .client
            .get(&url)
            .header("Authorization", format!("Bearer {}", self.config.api_token))
            .send()
            .await?;

        if !response.status().is_success() {
            return Err(LeagueError::Api(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        let data: serde_json::Value = response.json().await?;
        let series_array = data["data"]
            .as_array()
            .ok_or_else(|| LeagueError::Api("Invalid response format".into()))?;

        let series: Vec<Series> = series_array
            .iter()
            .filter_map(|v| serde_json::from_value::<ApiSeries>(v.clone()).ok())
            .map(Series::from)
            .collect();

        info!(count = series.len(), "Fetched series from Matchplay");
        Ok(series)
    }

    /// Get tournaments for the configured organizer.
    pub async fn get_tournaments(&self) -> Result<Vec<Tournament>, LeagueError> {
        let url = format!(
            "{}/tournaments?owner={}",
            self.config.base_url, self.config.organizer_id
        );

        let response = self
            .client
            .get(&url)
            .header("Authorization", format!("Bearer {}", self.config.api_token))
            .send()
            .await?;

        if !response.status().is_success() {
            return Err(LeagueError::Api(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        let data: serde_json::Value = response.json().await?;
        let tournaments_array = data["data"]
            .as_array()
            .ok_or_else(|| LeagueError::Api("Invalid response format".into()))?;

        let tournaments: Vec<Tournament> = tournaments_array
            .iter()
            .filter_map(|v| serde_json::from_value::<ApiTournament>(v.clone()).ok())
            .map(Tournament::from)
            .collect();

        info!(count = tournaments.len(), "Fetched tournaments from Matchplay");
        Ok(tournaments)
    }

    /// Get a specific tournament by ID.
    pub async fn get_tournament(&self, tournament_id: i64) -> Result<Tournament, LeagueError> {
        let url = format!("{}/tournaments/{}", self.config.base_url, tournament_id);

        let response = self
            .client
            .get(&url)
            .header("Authorization", format!("Bearer {}", self.config.api_token))
            .send()
            .await?;

        if response.status() == reqwest::StatusCode::NOT_FOUND {
            return Err(LeagueError::TournamentNotFound(tournament_id));
        }

        if !response.status().is_success() {
            return Err(LeagueError::Api(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        let data: serde_json::Value = response.json().await?;
        let tournament: ApiTournament = serde_json::from_value(data["data"].clone())?;
        Ok(Tournament::from(tournament))
    }

    /// Get standings for a tournament.
    pub async fn get_tournament_standings(
        &self,
        tournament_id: i64,
    ) -> Result<Vec<Standing>, LeagueError> {
        let url = format!(
            "{}/tournaments/{}/standings",
            self.config.base_url, tournament_id
        );

        let response = self
            .client
            .get(&url)
            .header("Authorization", format!("Bearer {}", self.config.api_token))
            .send()
            .await?;

        if !response.status().is_success() {
            return Err(LeagueError::Api(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        // Tournament standings return a direct array
        let standings_array: Vec<ApiStanding> = response.json().await?;

        // We need player names - fetch them as needed
        let mut standings = Vec::new();
        for api_standing in standings_array {
            let player_name = self
                .get_player(api_standing.player_id)
                .await
                .map(|p| p.name)
                .unwrap_or_else(|_| format!("Player {}", api_standing.player_id));
            standings.push(Standing::from_api(api_standing, player_name));
        }

        info!(
            tournament_id,
            count = standings.len(),
            "Fetched tournament standings"
        );
        Ok(standings)
    }

    /// Get a player by ID.
    pub async fn get_player(&self, player_id: i64) -> Result<Player, LeagueError> {
        let url = format!("{}/players/{}", self.config.base_url, player_id);

        let response = self
            .client
            .get(&url)
            .header("Authorization", format!("Bearer {}", self.config.api_token))
            .send()
            .await?;

        if response.status() == reqwest::StatusCode::NOT_FOUND {
            return Err(LeagueError::PlayerNotFound(player_id));
        }

        if !response.status().is_success() {
            return Err(LeagueError::Api(format!(
                "API returned status: {}",
                response.status()
            )));
        }

        let data: serde_json::Value = response.json().await?;
        let player: ApiPlayer = serde_json::from_value(data["data"].clone())?;
        Ok(Player::from(player))
    }
}
