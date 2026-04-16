-- ============================================================
-- MetaDyna API — Master Tenant Schema
-- Script  : 02_seed_master_tenant_data.sql
-- Purpose : Initial seed data for master tenant
-- Run on  : Fresh master tenant database setup only
-- ============================================================

-- Enable pgcrypto for UUID generation in seed scripts
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Default dev tenant (update DB_URL / credentials per environment)
-- NOTE: DB_PASSWORD must be AES-encrypted using CredentialEncryptor before inserting.
--       For dev convenience the plain value is shown — encrypt before production use.
INSERT INTO TENANT_INFO (ID, TENANT_ID, TENANT_NAME, DB_URL, DB_USERNAME, DB_PASSWORD, IS_ACTIVE)
VALUES (
    gen_random_uuid()::VARCHAR,
    'PV_T1',
    'PV Tenant',
    'jdbc:postgresql://localhost:5432/PV_T1',
    'postgres',
    'Password1',   -- replace with AES-encrypted value via CredentialEncryptor
    'Y'
)
ON CONFLICT (TENANT_ID) DO NOTHING;

INSERT INTO MODULE (ID, MODULE_ID, ITEM_ID, LABEL, DESCRIPTION, ICON, MENU_GROUP_ID, VIEW, IS_DISABLED, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'TENANTS', 'manage-tenants', 'Manage Tenants', 'Tenants and DB details management',
 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6',
 'admin', 'listing', 'N', 1)
ON CONFLICT (MODULE_ID) DO NOTHING;

UPDATE MODULE SET ICON = 'M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6' WHERE MODULE_ID = 'TENANTS';
