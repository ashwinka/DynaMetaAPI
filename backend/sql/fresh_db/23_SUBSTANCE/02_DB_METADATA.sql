-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : SUBSTANCE
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

--   250  SUBSTANCE          root        MULTI_CONTEXT=N
--   255  SUBSTANCE_SYNONYMS parent=250  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', NULL,  'SUBSTANCE',          '',        'N', NULL,              NULL, NULL),
    (gen_random_uuid()::VARCHAR, 'SUBSTANCE', '255', '250', 'SUBSTANCE_SYNONYMS', 'synonyms','Y', 'SUBSTANCE_REC_ID','ID', 'synonyms$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 250 SUBSTANCE ────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250001', 'SUBSTANCE_ID',           'substanceId',          'substanceId',          'TEXT',   100,  'Y', 'substanceId',
    'lbl.substanceId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the substance'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250002', 'SUBSTANCE_NAME',         'substanceName',        'substanceName',        'TEXT',   300,  'Y', 'substanceName',
    'lbl.substanceName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Full name of the substance'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250003', 'GENERIC_SUBSTANCE_CODE', 'genericSubstanceCode', 'genericSubstanceCode', 'TEXT',   100,  'N', 'genericSubstanceCode',
    'lbl.genericSubstanceCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Generic / WHO-DD substance code'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250004', 'IS_ACTIVE',              'isActive',             'isActive',             'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the substance is active'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250005', 'SUBSTANCE_ROLE',         'substanceRole',        'substanceRole',        'TEXT',   50,   'N', 'substanceRole',
    'lbl.substanceRole',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"SUBSTANCE_ROLE"}',
    'Role of the substance in the product (active, excipient, adjuvant)'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250006', 'IS_STRUCTURED',          'isStructured',         'isStructured',         'TEXT',   1,    'N', 'isStructured',
    'lbl.isStructured',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Indicates whether the substance strength is structured'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250007', 'STRENGTH',               'strength',             'strength',             'TEXT',   10,   'N', 'strength',
    'lbl.strength',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Numeric strength value of the substance'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250008', 'UNIT',                   'unit',                 'unit',                 'TEXT',   50,   'N', 'unit',
    'lbl.unit',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"SUBSTANCE_UNIT"}',
    'Unit of measurement for the substance strength'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250009', 'UNSTRUCTURED_STRENGTH',  'unstructuredStrength', 'unstructuredStrength', 'TEXT',   100,  'N', 'unstructuredStrength',
    'lbl.unstructuredStrength',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":false}',
    'Free-text strength description when not structured'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250010', 'SUBSTANCE_TERM_ID',      'substanceTermId',      'substanceTermId',      'TEXT',   300,  'N', 'substanceTermId',
    'lbl.substanceTermId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true}',
    'Substance / Specified Substance TermID from coding dictionary'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250011', 'MANUFACTURER_NAME',      'manufacturerName',     'manufacturerName',     'TEXT',   300,  'N', 'manufacturerName',
    'lbl.manufacturerName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'Name of the substance manufacturer'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '250', '250012', 'CLASS_OF_INGREDIENT',    'classOfIngredient',    'classOfIngredient',    'TEXT',   50,   'N', 'classOfIngredient',
    'lbl.classOfIngredient',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true,  "codelist":"INGREDIENT_CLASS"}',
    'Classification of the ingredient (consumer, pharmaceutical, non-pharmaceutical)'),

-- ── 255 SUBSTANCE_SYNONYMS ───────────────────────────────────
(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '255', '255001', 'SYNONYM_NAME',           'synonymName',          'synonymName',          'TEXT',   100,  'N', 'synonyms$.synonymName',
    'lbl.synonymName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Synonym or alternate name for the substance'),

(gen_random_uuid()::VARCHAR, 'SUBSTANCE', '255', '255002', 'IS_ACTIVE',              'isActive',             'isActive',             'TEXT',   1,    'N', 'synonyms$.isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether this synonym is active')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
