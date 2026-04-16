-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 06_seed_app_codelist_data.sql
-- Purpose : Shared / cross-module codelists
--           Module-specific codelists are in each module's
--           03_CODELIST_DATA.sql file.
-- Run on  : Child tenant schema, after 01_ddl_framework_tables.sql
-- Idempotent: ON CONFLICT DO NOTHING
-- ============================================================


------------ Department MOdule --------------
INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'Department Type')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── DEPT_TYPE ─────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'SAFETY',     'Drug Safety',       '{"en":"Drug Safety"}',       1),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'REGULATORY', 'Regulatory Affairs','{"en":"Regulatory Affairs"}', 2),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'MEDICAL',    'Medical Affairs',   '{"en":"Medical Affairs"}',   3),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'CLINICAL',   'Clinical',          '{"en":"Clinical"}',          4),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'IT',         'IT',                '{"en":"IT"}',                5),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'QUALITY',    'Quality',           '{"en":"Quality"}',           6),
(gen_random_uuid()::VARCHAR, 'DEPT_TYPE', 'OTHER',      'Other',             '{"en":"Other"}',             7)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
