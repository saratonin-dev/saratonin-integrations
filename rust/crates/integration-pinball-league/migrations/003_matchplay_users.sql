-- Matchplay Users Migration
-- Links saratonin users to their Matchplay Events user IDs

CREATE TABLE matchplay_users (
    user_id UUID PRIMARY KEY,
    matchplay_user_id INTEGER NOT NULL,
    tenant_id VARCHAR(100) NOT NULL,
    linked_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (matchplay_user_id, tenant_id)
);

CREATE INDEX idx_matchplay_users_tenant ON matchplay_users(tenant_id);
