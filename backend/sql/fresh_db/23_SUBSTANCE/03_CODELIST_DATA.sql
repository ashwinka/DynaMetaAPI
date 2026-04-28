-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 03_CODELIST_DATA.sql
-- Purpose : Codelist data seed for SUBSTANCE module
-- ============================================================

INSERT INTO CODE_LIST_LIB (ID, CODE_LIST_ID, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'Substance Type')
ON CONFLICT (CODE_LIST_ID) DO NOTHING;

-- ── SUBSTANCE_TYPE ────────────────────────────────────────────
INSERT INTO CODE_LIST_VALUES (ID, CODE_LIST_ID, CODE, DECODE, TRANSLATIONS, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'SMALL_MOL', 'Small Molecule', '{"en":"Small Molecule"}', 1),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'BIOLOGIC',  'Biologic',        '{"en":"Biologic"}',       2),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'VACCINE',   'Vaccine',         '{"en":"Vaccine"}',        3),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'PEPTIDE',   'Peptide',         '{"en":"Peptide"}',        4),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'NUCLEIC',   'Nucleic Acid',    '{"en":"Nucleic Acid"}',   5),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE_TYPE', 'OTHER',     'Other',           '{"en":"Other"}',          6)
ON CONFLICT (CODE_LIST_ID, CODE) DO NOTHING;
