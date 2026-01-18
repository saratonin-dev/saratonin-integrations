//! Pinball league/tournament integration via Matchplay Events API.
//!
//! This crate provides access to:
//! - Series (seasonal leagues)
//! - Tournaments (individual events)
//! - Standings (player rankings)
//! - Player profiles

mod client;
mod error;
mod models;
mod service;

pub use client::{MatchplayClient, MatchplayConfig};
pub use error::LeagueError;
pub use models::*;
pub use service::LeagueDataService;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_standing_from_api() {
        let api = ApiStanding {
            position: 1,
            player_id: 12345,
            points: Some(100.0),
            wins: Some(10),
            losses: Some(2),
        };

        let standing = Standing::from_api(api, "Test Player".to_string());
        assert_eq!(standing.rank, 1);
        assert_eq!(standing.player_id, 12345);
        assert_eq!(standing.player_name, "Test Player");
        assert_eq!(standing.points, Some(100.0));
    }
}
