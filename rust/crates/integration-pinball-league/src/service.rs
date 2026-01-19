//! League data service with caching.

use std::sync::Arc;
use std::time::Duration;

use chrono::Utc;
use dashmap::DashMap;
use integration_core::Cache;
use tracing::info;

use crate::{
    LeagueError, LeagueOverview, MatchplayClient, MatchplayConfig, Player, PlayerProfile,
    PlayerTournamentStats, Series, SeriesDetail, Standing, Tournament, TournamentDetail,
};

// Cache TTLs
const ACTIVE_STANDINGS_TTL: Duration = Duration::from_secs(5 * 60); // 5 minutes
const TOURNAMENT_LIST_TTL: Duration = Duration::from_secs(30 * 60); // 30 minutes
const COMPLETED_DATA_TTL: Duration = Duration::from_secs(24 * 60 * 60); // 24 hours

/// Service for league data with caching.
pub struct LeagueDataService {
    client: Arc<MatchplayClient>,
    series_cache: Cache<Vec<Series>>,
    tournaments_cache: Cache<Vec<Tournament>>,
    standings_cache: DashMap<String, (Vec<Standing>, chrono::DateTime<Utc>)>,
    players_cache: DashMap<i64, Player>,
}

impl LeagueDataService {
    /// Create a new league data service.
    pub fn new(config: MatchplayConfig) -> Result<Self, LeagueError> {
        let client = Arc::new(MatchplayClient::new(config)?);

        Ok(Self {
            client,
            series_cache: Cache::new(TOURNAMENT_LIST_TTL),
            tournaments_cache: Cache::new(TOURNAMENT_LIST_TTL),
            standings_cache: DashMap::new(),
            players_cache: DashMap::new(),
        })
    }

    /// Create from environment.
    pub fn from_env() -> Result<Self, LeagueError> {
        Self::new(MatchplayConfig::from_env()?)
    }

    /// Get league overview (main screen data).
    pub async fn get_overview(&self) -> Result<LeagueOverview, LeagueError> {
        let series = self.get_series().await?;
        let active_series = series.iter().find(|s| s.status == "active").cloned();

        let standings = if let Some(ref s) = active_series {
            self.get_series_standings(s.id).await.unwrap_or_default()
        } else {
            vec![]
        };

        let tournaments = self.get_tournaments().await?;

        let mut recent_tournaments: Vec<_> = tournaments
            .iter()
            .filter(|t| t.status == "completed")
            .cloned()
            .collect();
        recent_tournaments.sort_by(|a, b| b.completed_at.cmp(&a.completed_at));
        recent_tournaments.truncate(5);

        let mut upcoming_tournaments: Vec<_> = tournaments
            .iter()
            .filter(|t| t.status == "active" || t.status == "planned")
            .cloned()
            .collect();
        upcoming_tournaments.sort_by(|a, b| a.started_at.cmp(&b.started_at));
        upcoming_tournaments.truncate(3);

        Ok(LeagueOverview {
            active_series,
            standings,
            recent_tournaments,
            upcoming_tournaments,
            last_updated: Some(Utc::now()),
        })
    }

    /// Get all series.
    pub async fn get_series(&self) -> Result<Vec<Series>, LeagueError> {
        if let Some(cached) = self.series_cache.get(&"series".to_string()) {
            return Ok(cached);
        }

        let series = self.client.get_series().await?;
        self.series_cache.insert("series".to_string(), series.clone());
        Ok(series)
    }

    /// Get series detail.
    pub async fn get_series_detail(&self, series_id: i64) -> Result<SeriesDetail, LeagueError> {
        let series = self
            .get_series()
            .await?
            .into_iter()
            .find(|s| s.id == series_id)
            .ok_or(LeagueError::SeriesNotFound(series_id))?;

        let standings = self.get_series_standings(series_id).await?;

        let tournaments: Vec<_> = self
            .get_tournaments()
            .await?
            .into_iter()
            .filter(|t| t.series_id == Some(series_id))
            .collect();

        Ok(SeriesDetail {
            series,
            standings,
            tournaments,
        })
    }

    /// Get series standings.
    pub async fn get_series_standings(&self, _series_id: i64) -> Result<Vec<Standing>, LeagueError> {
        // Note: Matchplay API doesn't have direct series standings endpoint
        // Would need to aggregate from tournament results
        // For now, return empty
        Ok(vec![])
    }

    /// Get all tournaments.
    pub async fn get_tournaments(&self) -> Result<Vec<Tournament>, LeagueError> {
        if let Some(cached) = self.tournaments_cache.get(&"tournaments".to_string()) {
            return Ok(cached);
        }

        let tournaments = self.client.get_tournaments().await?;
        self.tournaments_cache
            .insert("tournaments".to_string(), tournaments.clone());
        Ok(tournaments)
    }

    /// Get tournament detail.
    pub async fn get_tournament_detail(
        &self,
        tournament_id: i64,
    ) -> Result<TournamentDetail, LeagueError> {
        let tournament = self.client.get_tournament(tournament_id).await?;
        let standings = self.get_tournament_standings(tournament_id).await?;

        Ok(TournamentDetail {
            tournament,
            standings,
        })
    }

    /// Get tournament standings.
    pub async fn get_tournament_standings(
        &self,
        tournament_id: i64,
    ) -> Result<Vec<Standing>, LeagueError> {
        let cache_key = format!("tournament_{}", tournament_id);

        // Check cache
        if let Some(entry) = self.standings_cache.get(&cache_key) {
            let (standings, fetched_at) = entry.value();
            let age = Utc::now().signed_duration_since(*fetched_at);

            // Determine TTL based on tournament status
            let tournament = self.client.get_tournament(tournament_id).await.ok();
            let ttl = if tournament.map(|t| t.status == "active").unwrap_or(false) {
                ACTIVE_STANDINGS_TTL
            } else {
                COMPLETED_DATA_TTL
            };

            if age.to_std().unwrap_or(Duration::MAX) < ttl {
                return Ok(standings.clone());
            }
        }

        // Fetch fresh
        let standings = self.client.get_tournament_standings(tournament_id).await?;

        // Cache player names
        for standing in &standings {
            if !self.players_cache.contains_key(&standing.player_id) {
                self.players_cache.insert(
                    standing.player_id,
                    Player {
                        id: standing.player_id,
                        name: standing.player_name.clone(),
                        ifpa_id: None,
                    },
                );
            }
        }

        self.standings_cache
            .insert(cache_key, (standings.clone(), Utc::now()));
        Ok(standings)
    }

    /// Get player profile.
    pub async fn get_player_profile(&self, player_id: i64) -> Result<PlayerProfile, LeagueError> {
        // Get or fetch player
        let player = if let Some(p) = self.players_cache.get(&player_id) {
            p.clone()
        } else {
            let p = self.client.get_player(player_id).await?;
            self.players_cache.insert(player_id, p.clone());
            p
        };

        // Get current series info
        let series = self.get_series().await?;
        let active_series = series.iter().find(|s| s.status == "active");

        let (current_series_rank, current_series_points) = if let Some(_s) = active_series {
            // Would need series standings aggregation
            (None, None)
        } else {
            (None, None)
        };

        // Get tournament history (simplified - would need per-player stats storage)
        let tournament_history: Vec<PlayerTournamentStats> = vec![];

        Ok(PlayerProfile {
            player,
            current_series_rank,
            current_series_points,
            total_tournaments: tournament_history.len() as i32,
            total_wins: 0,
            total_losses: 0,
            win_rate: None,
            best_finish: None,
            tournament_history,
        })
    }

    /// Force refresh all data.
    pub async fn refresh(&self) -> Result<(), LeagueError> {
        self.series_cache.clear();
        self.tournaments_cache.clear();
        self.standings_cache.clear();

        self.get_series().await?;
        self.get_tournaments().await?;

        info!("League data refreshed");
        Ok(())
    }
}
