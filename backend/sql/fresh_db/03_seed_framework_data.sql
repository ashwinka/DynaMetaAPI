-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 02_TENANT_seed_framework_data.sql
-- Purpose : Seed data for child tenants —
--           roles, users
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

-- Enable pgcrypto for UUID generation in seed scripts
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ── Default Roles ────────────────────────────────────────────
INSERT INTO USER_ROLES (ID, ROLE_ID, ROLE_NAME) VALUES
(gen_random_uuid()::VARCHAR, 'ADMIN', 'Administrator')
ON CONFLICT (ROLE_ID) DO NOTHING;

INSERT INTO ROLE_PRIVILEGES (ID, ROLE_ID, MODULE_ID, READ_ACCESS, WRITE_ACCESS) VALUES
(gen_random_uuid()::VARCHAR, 'ADMIN', '*', 'Y', 'Y')
ON CONFLICT (ROLE_ID, MODULE_ID) DO NOTHING;

-- ── Default Admin User ───────────────────────────────────────
-- password: Admin@123  (BCrypt hash — 10 rounds)
INSERT INTO APP_USERS (ID, USER_NAME, FULL_NAME, EMAIL_ID, PASSWORD_HASH, ROLES) VALUES
(gen_random_uuid()::VARCHAR, 'admin', 'System Administrator', 'admin@metadyna.local', 'Password1', '["ADMIN"]')
ON CONFLICT (USER_NAME) DO NOTHING;

-- ── Menu Groups ──────────────────────────────────────────────
INSERT INTO MENU_GROUPS (ID, MENU_ID, LABEL, ICON, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'admin', 'Administration',
 'M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z M15 12a3 3 0 11-6 0 3 3 0 016 0z',
 100)
ON CONFLICT (MENU_ID) DO NOTHING;

-- ── Module Registry ──────────────────────────────────────────
INSERT INTO MODULE (ID, MODULE_ID, ITEM_ID, LABEL, DESCRIPTION, ICON, MENU_GROUP_ID, VIEW, IS_DISABLED, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'APP_USERS',  'user-management',  'User Management',  'Manage master admin users',
 'M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z',
 'admin', 'listing', 'N', 2),
(gen_random_uuid()::VARCHAR, 'APP_ROLES',  'user-roles',       'User Roles',       'Manage roles and privileges',
 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
 'admin', 'listing', 'N', 3),
(gen_random_uuid()::VARCHAR, 'AUDIT_TRAIL','audit-trail',      'Audit Trail',      'View change history and access logs',
 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4',
 'admin', 'listing', 'N', 4),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB','codelist',        'Codelist',         'Codelist / controlled vocabulary library',
 'M4 6h16M4 10h16M4 14h16M4 18h16',
 'admin', 'listing', 'N', 5)
ON CONFLICT (MODULE_ID) DO NOTHING;

-- ── Patch icons for existing MODULE rows (idempotent UPDATE) ─
UPDATE MODULE SET ICON = 'M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z' WHERE MODULE_ID = 'APP_USERS';
UPDATE MODULE SET ICON = 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z' WHERE MODULE_ID = 'APP_ROLES';
UPDATE MODULE SET ICON = 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4' WHERE MODULE_ID = 'AUDIT_TRAIL';


-- ── CODE_LIST_LIB headers ────────────────────────────────────
INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'SEX',          'Patient / Person Sex'),
(gen_random_uuid()::VARCHAR, 'YES_NO',       'Yes / No'),
(gen_random_uuid()::VARCHAR, 'COUNTRY',      'Country'),
(gen_random_uuid()::VARCHAR, 'ACCESS_LEVEL', 'Access Level'),
(gen_random_uuid()::VARCHAR, 'PRIORITY',     'Priority')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;


-- ── SEX ──────────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'SEX', 'M', 'Male',    '{"en":"Male","fr":"Masculin","de":"Männlich"}',    1),
(gen_random_uuid()::VARCHAR, 'SEX', 'F', 'Female',  '{"en":"Female","fr":"Féminin","de":"Weiblich"}',   2),
(gen_random_uuid()::VARCHAR, 'SEX', 'U', 'Unknown', '{"en":"Unknown","fr":"Inconnu","de":"Unbekannt"}', 3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── YES_NO ────────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'YES_NO', 'Y', 'Yes', '{"en":"Yes","fr":"Oui","de":"Ja"}',  1),
(gen_random_uuid()::VARCHAR, 'YES_NO', 'N', 'No',  '{"en":"No","fr":"Non","de":"Nein"}', 2)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── COUNTRY ───────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'US', 'United States',  '{"en":"United States"}',  1),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'GB', 'United Kingdom', '{"en":"United Kingdom"}', 2),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'IN', 'India',          '{"en":"India"}',          3),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'DE', 'Germany',        '{"en":"Germany"}',        4),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'FR', 'France',         '{"en":"France"}',         5),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'JP', 'Japan',          '{"en":"Japan"}',          6),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'AU', 'Australia',      '{"en":"Australia"}',      7),
(gen_random_uuid()::VARCHAR, 'COUNTRY', 'CA', 'Canada',         '{"en":"Canada"}',         8)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── ACCESS_LEVEL ──────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'ACCESS_LEVEL', 'FULL',     'Full Access', '{"en":"Full Access"}', 1),
(gen_random_uuid()::VARCHAR, 'ACCESS_LEVEL', 'READONLY', 'Read Only',   '{"en":"Read Only"}',   2),
(gen_random_uuid()::VARCHAR, 'ACCESS_LEVEL', 'NONE',     'No Access',   '{"en":"No Access"}',   3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── PRIORITY ──────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'PRIORITY', 'HIGH',   'High',   '{"en":"High"}',   1),
(gen_random_uuid()::VARCHAR, 'PRIORITY', 'MEDIUM', 'Medium', '{"en":"Medium"}', 2),
(gen_random_uuid()::VARCHAR, 'PRIORITY', 'LOW',    'Low',    '{"en":"Low"}',    3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
