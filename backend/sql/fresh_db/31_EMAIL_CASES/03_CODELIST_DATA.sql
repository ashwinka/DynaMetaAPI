-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 03_CODELIST_DATA.sql
-- Purpose : Codelist data seed for EMAIL_CASES module
-- ============================================================
-- Enable pgcrypto for UUID generation in seed scripts

INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR,'EMAIL_CASE_STATUS',   'Email Case Status'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_PRIORITY', 'Email Case Priority'),
(gen_random_uuid()::VARCHAR,'TRIAGE_DECISION',     'Triage Decision')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── EMAIL_CASE_STATUS ─────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_STATUS', 'NEW',       'New',       '{"en":"New"}',       1),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_STATUS', 'IN_REVIEW', 'In Review', '{"en":"In Review"}', 2),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_STATUS', 'TRIAGED',   'Triaged',   '{"en":"Triaged"}',   3),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_STATUS', 'CLOSED',    'Closed',    '{"en":"Closed"}',    4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── EMAIL_CASE_PRIORITY ───────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_PRIORITY', 'HIGH',   'High',   '{"en":"High"}',   1),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_PRIORITY', 'MEDIUM', 'Medium', '{"en":"Medium"}', 2),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASE_PRIORITY', 'LOW',    'Low',    '{"en":"Low"}',    3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── TRIAGE_DECISION ───────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'TRIAGE_DECISION', 'CREATE_CASE',     'Create Case',     '{"en":"Create Case"}',     1),
(gen_random_uuid()::VARCHAR, 'TRIAGE_DECISION', 'NON_SAFETY',      'Non-Safety',      '{"en":"Non-Safety"}',      2),
(gen_random_uuid()::VARCHAR, 'TRIAGE_DECISION', 'PENDING_REVIEW',  'Pending Review',  '{"en":"Pending Review"}',  3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
