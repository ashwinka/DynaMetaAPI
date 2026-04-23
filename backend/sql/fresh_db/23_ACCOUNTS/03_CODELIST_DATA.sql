-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 03_CODELIST_DATA.sql
-- Purpose : Codelist data seed for ACCOUNTS module
-- ============================================================

INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'Account Type'),
(gen_random_uuid()::VARCHAR, 'EDI_METHOD',   'EDI Transmission Method'),
(gen_random_uuid()::VARCHAR, 'E2B_PROFILE',  'E2B Message Profile'),
(gen_random_uuid()::VARCHAR, 'AUTHORITY',    'Regulatory Authority')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── ACCOUNT_TYPE ──────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'MAH',       'Marketing Authorisation Holder', '{"en":"Marketing Authorisation Holder"}', 1),
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'PARTNER',   'Business Partner',               '{"en":"Business Partner"}',               2),
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'CRO',       'CRO',                            '{"en":"CRO"}',                            3),
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'AUTHORITY', 'Regulatory Authority',           '{"en":"Regulatory Authority"}',           4),
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'HOSPITAL',  'Hospital / HCP',                 '{"en":"Hospital / HCP"}',                 5),
(gen_random_uuid()::VARCHAR, 'ACCOUNT_TYPE', 'OTHER',     'Other',                          '{"en":"Other"}',                          6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── EDI_METHOD ────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'EDI_METHOD', 'AS2',    'AS2',    '{"en":"AS2"}',    1),
(gen_random_uuid()::VARCHAR, 'EDI_METHOD', 'SFTP',   'SFTP',   '{"en":"SFTP"}',   2),
(gen_random_uuid()::VARCHAR, 'EDI_METHOD', 'EMAIL',  'Email',  '{"en":"Email"}',  3),
(gen_random_uuid()::VARCHAR, 'EDI_METHOD', 'MANUAL', 'Manual', '{"en":"Manual"}', 4)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── E2B_PROFILE ───────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'E2B_PROFILE', 'E2B_R2', 'ICH E2B(R2)', '{"en":"ICH E2B(R2)"}', 1),
(gen_random_uuid()::VARCHAR, 'E2B_PROFILE', 'E2B_R3', 'ICH E2B(R3)', '{"en":"ICH E2B(R3)"}', 2),
(gen_random_uuid()::VARCHAR, 'E2B_PROFILE', 'NONE',   'None',         '{"en":"None"}',         3)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;

-- ── AUTHORITY ─────────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'FDA',        'FDA (US)',        '{"en":"FDA (US)"}',        1),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'EMA',        'EMA (EU)',        '{"en":"EMA (EU)"}',        2),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'MHRA',       'MHRA (UK)',       '{"en":"MHRA (UK)"}',       3),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'PMDA',       'PMDA (Japan)',    '{"en":"PMDA (Japan)"}',    4),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'CDSCO',      'CDSCO (India)',   '{"en":"CDSCO (India)"}',   5),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'TGA',        'TGA (Australia)', '{"en":"TGA (Australia)"}', 6),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'HC',         'Health Canada',   '{"en":"Health Canada"}',   7),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'SWISSMEDIC', 'Swissmedic',      '{"en":"Swissmedic"}',      8),
(gen_random_uuid()::VARCHAR, 'AUTHORITY', 'OTHER',      'Other',           '{"en":"Other"}',           9)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
