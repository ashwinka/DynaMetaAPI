-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 06_seed_app_codelist_data.sql
-- Purpose : Shared / cross-module codelists
--           Module-specific codelists are in each module's
--           03_CODELIST_DATA.sql file.
-- Run on  : Child tenant schema, after 01_ddl_framework_tables.sql
-- Idempotent: ON CONFLICT DO NOTHING
-- ============================================================

-- Enable pgcrypto for UUID generation in seed scripts
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ── CODE_LIST_LIB headers ────────────────────────────────────
INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'USER_ROLE',    'User Role')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── USER_ROLE ─────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'USER_ROLE', 'ADMIN',    'Administrator',      '{"en":"Administrator"}',      1),
(gen_random_uuid()::VARCHAR, 'USER_ROLE', 'CASE_MGR', 'Case Manager',       '{"en":"Case Manager"}',       2),
(gen_random_uuid()::VARCHAR, 'USER_ROLE', 'REVIEWER', 'Medical Reviewer',   '{"en":"Medical Reviewer"}',   3),
(gen_random_uuid()::VARCHAR, 'USER_ROLE', 'SUBMITTER','Submission Officer',  '{"en":"Submission Officer"}', 4),
(gen_random_uuid()::VARCHAR, 'USER_ROLE', 'READONLY', 'Read Only',          '{"en":"Read Only"}',          5)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
