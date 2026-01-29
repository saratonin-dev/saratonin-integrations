use sqlx::PgPool;
use uuid::Uuid;

use super::MatchplayUser;
use crate::LeagueError;

pub async fn link_user(
    pool: &PgPool,
    user_id: Uuid,
    matchplay_user_id: i32,
    tenant_id: &str,
) -> Result<(), LeagueError> {
    sqlx::query(
        r#"
        INSERT INTO matchplay_users (user_id, matchplay_user_id, tenant_id)
        VALUES ($1, $2, $3)
        ON CONFLICT (matchplay_user_id, tenant_id)
        DO UPDATE SET user_id = EXCLUDED.user_id, linked_at = NOW()
        "#,
    )
    .bind(user_id)
    .bind(matchplay_user_id)
    .bind(tenant_id)
    .execute(pool)
    .await
    .map_err(|e| LeagueError::Database(e.to_string()))?;

    Ok(())
}

pub async fn unlink_user(pool: &PgPool, user_id: Uuid, tenant_id: &str) -> Result<(), LeagueError> {
    sqlx::query(
        r#"
        DELETE FROM matchplay_users
        WHERE user_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(user_id)
    .bind(tenant_id)
    .execute(pool)
    .await
    .map_err(|e| LeagueError::Database(e.to_string()))?;

    Ok(())
}

pub async fn get_by_user_id(
    pool: &PgPool,
    user_id: Uuid,
    tenant_id: &str,
) -> Result<Option<MatchplayUser>, LeagueError> {
    let user = sqlx::query_as::<_, MatchplayUser>(
        r#"
        SELECT user_id, matchplay_user_id, tenant_id, linked_at
        FROM matchplay_users
        WHERE user_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(user_id)
    .bind(tenant_id)
    .fetch_optional(pool)
    .await
    .map_err(|e| LeagueError::Database(e.to_string()))?;

    Ok(user)
}

pub async fn get_by_matchplay_id(
    pool: &PgPool,
    matchplay_user_id: i32,
    tenant_id: &str,
) -> Result<Option<MatchplayUser>, LeagueError> {
    let user = sqlx::query_as::<_, MatchplayUser>(
        r#"
        SELECT user_id, matchplay_user_id, tenant_id, linked_at
        FROM matchplay_users
        WHERE matchplay_user_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(matchplay_user_id)
    .bind(tenant_id)
    .fetch_optional(pool)
    .await
    .map_err(|e| LeagueError::Database(e.to_string()))?;

    Ok(user)
}

pub async fn get_all_for_tenant(
    pool: &PgPool,
    tenant_id: &str,
) -> Result<Vec<MatchplayUser>, LeagueError> {
    let users = sqlx::query_as::<_, MatchplayUser>(
        r#"
        SELECT user_id, matchplay_user_id, tenant_id, linked_at
        FROM matchplay_users
        WHERE tenant_id = $1
        "#,
    )
    .bind(tenant_id)
    .fetch_all(pool)
    .await
    .map_err(|e| LeagueError::Database(e.to_string()))?;

    Ok(users)
}
