-- Machine Favorites Migration
-- Each user can have ONE favorite machine per tenant

CREATE TABLE machine_favorites (
    user_id UUID NOT NULL,
    user_name VARCHAR(255),
    machine_id VARCHAR(100) NOT NULL,
    tenant_id VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id, tenant_id),
    UNIQUE (user_id, tenant_id)
);

CREATE INDEX idx_machine_favorites_tenant ON machine_favorites(tenant_id);
CREATE INDEX idx_machine_favorites_machine ON machine_favorites(machine_id, tenant_id);
