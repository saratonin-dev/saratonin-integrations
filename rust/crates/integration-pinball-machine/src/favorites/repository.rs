//! Favorites database repository.

use sqlx::PgPool;
use uuid::Uuid;

use super::MachineFavorite;
use crate::MachineError;

/// Set a user's favorite machine.
/// This replaces any existing favorite for the user in this tenant.
pub async fn set_favorite(
    pool: &PgPool,
    user_id: Uuid,
    user_name: Option<&str>,
    machine_id: &str,
    tenant_id: &str,
) -> Result<(), MachineError> {
    sqlx::query(
        r#"
        INSERT INTO machine_favorites (user_id, user_name, machine_id, tenant_id)
        VALUES ($1, $2, $3, $4)
        ON CONFLICT (user_id, tenant_id)
        DO UPDATE SET machine_id = EXCLUDED.machine_id, user_name = EXCLUDED.user_name, created_at = NOW()
        "#,
    )
    .bind(user_id)
    .bind(user_name)
    .bind(machine_id)
    .bind(tenant_id)
    .execute(pool)
    .await
    .map_err(|e| MachineError::Database(e.to_string()))?;

    Ok(())
}

/// Clear a user's favorite.
pub async fn clear_favorite(
    pool: &PgPool,
    user_id: Uuid,
    tenant_id: &str,
) -> Result<(), MachineError> {
    sqlx::query(
        r#"
        DELETE FROM machine_favorites
        WHERE user_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(user_id)
    .bind(tenant_id)
    .execute(pool)
    .await
    .map_err(|e| MachineError::Database(e.to_string()))?;

    Ok(())
}

/// Get all favorites for a tenant.
pub async fn get_all_favorites(
    pool: &PgPool,
    tenant_id: &str,
) -> Result<Vec<MachineFavorite>, MachineError> {
    let favorites = sqlx::query_as::<_, MachineFavorite>(
        r#"
        SELECT user_id, user_name, machine_id, tenant_id, created_at
        FROM machine_favorites
        WHERE tenant_id = $1
        "#,
    )
    .bind(tenant_id)
    .fetch_all(pool)
    .await
    .map_err(|e| MachineError::Database(e.to_string()))?;

    Ok(favorites)
}

/// Get favorites for a specific machine.
pub async fn get_machine_favorites(
    pool: &PgPool,
    machine_id: &str,
    tenant_id: &str,
) -> Result<Vec<MachineFavorite>, MachineError> {
    let favorites = sqlx::query_as::<_, MachineFavorite>(
        r#"
        SELECT user_id, user_name, machine_id, tenant_id, created_at
        FROM machine_favorites
        WHERE machine_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(machine_id)
    .bind(tenant_id)
    .fetch_all(pool)
    .await
    .map_err(|e| MachineError::Database(e.to_string()))?;

    Ok(favorites)
}

/// Get a user's current favorite.
pub async fn get_user_favorite(
    pool: &PgPool,
    user_id: Uuid,
    tenant_id: &str,
) -> Result<Option<MachineFavorite>, MachineError> {
    let favorite = sqlx::query_as::<_, MachineFavorite>(
        r#"
        SELECT user_id, user_name, machine_id, tenant_id, created_at
        FROM machine_favorites
        WHERE user_id = $1 AND tenant_id = $2
        "#,
    )
    .bind(user_id)
    .bind(tenant_id)
    .fetch_optional(pool)
    .await
    .map_err(|e| MachineError::Database(e.to_string()))?;

    Ok(favorite)
}
