use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use uuid::Uuid;

#[derive(Debug, Clone, Serialize, Deserialize, FromRow)]
pub struct MatchplayUser {
    pub user_id: Uuid,
    pub matchplay_user_id: i32,
    pub tenant_id: String,
    pub linked_at: DateTime<Utc>,
}
