-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : CORR_QUESTION_LIB
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

--   270  CORR_QUESTION_LIB              root        MULTI_CONTEXT=N
--   271  CORR_QUESTION_TRANSLATIONS     parent=270  MULTI_CONTEXT=Y
--   272  CORR_QUESTION_USAGE_HISTORY    parent=270  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', NULL,  'CORR_QUESTION_LIB',           '',             'N', NULL,         NULL, NULL),
    (gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '271', '270', 'CORR_QUESTION_TRANSLATIONS',  'translations', 'Y', 'QUESTION_ID','ID', 'translations$'),
    (gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '272', '270', 'CORR_QUESTION_USAGE_HISTORY', 'usageHistory', 'Y', 'QUESTION_ID','ID', 'usageHistory$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 270 CORR_QUESTION_LIB ────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270001', 'QUESTION_ID',          'questionId',         'questionId',         'TEXT',   100,  'Y', 'questionId',
    'lbl.questionId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the correspondence question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270002', 'QUESTION_TITLE',       'questionTitle',      'questionTitle',      'TEXT',   500,  'Y', 'questionTitle',
    'lbl.questionTitle',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"36ch", "allowSorting":true}',
    'Short title / summary of the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270003', 'QUESTION_TEXT',        'questionText',       'questionText',       'TEXT',   NULL, 'N', 'questionText',
    'lbl.questionText',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'Full text of the correspondence question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270004', 'CATEGORY',             'category',           'category',           'TEXT',   100,  'N', 'category',
    'lbl.category',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"CQ_CATEGORY"}',
    'Category grouping for the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270005', 'SUB_CATEGORY',         'subCategory',        'subCategory',        'TEXT',   100,  'N', 'subCategory',
    'lbl.subCategory',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"CQ_SUB_CATEGORY"}',
    'Sub-category for finer grouping of the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270006', 'LANGUAGE',             'language',           'language',           'TEXT',   10,   'N', 'language',
    'lbl.language',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"LANGUAGE"}',
    'Primary language of the question text'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270007', 'PRIORITY',             'priority',           'priority',           'TEXT',   20,   'N', 'priority',
    'lbl.priority',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"PRIORITY"}',
    'Priority level of the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270008', 'IS_ACTIVE',            'isActive',           'isActive',           'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the question is active'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270009', 'IS_MANDATORY',         'isMandatory',        'isMandatory',        'TEXT',   1,    'N', 'isMandatory',
    'lbl.isMandatory',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Indicates whether a response to this question is mandatory'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270010', 'RESPONSE_TYPE',        'responseType',       'responseType',       'TEXT',   50,   'N', 'responseType',
    'lbl.responseType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"CQ_RESPONSE_TYPE"}',
    'Expected response type (free text, date, yes/no, codelist)'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270011', 'EXPECTED_RESPONSE',    'expectedResponse',   'expectedResponse',   'TEXT',   500,  'N', 'expectedResponse',
    'lbl.expectedResponse',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Sample or expected response text'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270012', 'APPLICABLE_TO',        'applicableTo',       'applicableTo',       'TEXT',   100,  'N', 'applicableTo',
    'lbl.applicableTo',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"CQ_APPLICABLE_TO"}',
    'Case type or context this question applies to'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270013', 'FOLLOW_UP_QUESTION_ID','followUpQuestionId', 'followUpQuestionId', 'TEXT',   100,  'N', 'followUpQuestionId',
    'lbl.followUpQuestionId',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true,  "lookupModule":"CORR_QUESTION_LIB", "lkpStoreValField":"questionId"}',
    'Linked follow-up question — single-column lookup'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270014', 'HELP_TEXT',            'helpText',           'helpText',           'TEXT',   NULL, 'N', 'helpText',
    'lbl.helpText',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Guidance text shown to the user when answering the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270015', 'CREATED_BY',           'createdBy',          'createdBy',          'TEXT',   100,  'N', 'createdBy',
    'lbl.createdBy',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'User who created the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270016', 'CREATED_DATE',         'createdDate',        'createdDate',        'DATE',   NULL, 'N', 'createdDate',
    'lbl.createdDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Date the question was created'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '270', '270017', 'LAST_MODIFIED',        'lastModified',       'lastModified',       'DATE',   NULL, 'N', 'lastModified',
    'lbl.lastModified',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Date the question was last modified'),

-- ── 271 CORR_QUESTION_TRANSLATIONS ───────────────────────────
(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '271', '271001', 'LANGUAGE',             'language',           'language',           'TEXT',   10,   'N', 'translations$.language',
    'lbl.language',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"LANGUAGE"}',
    'Language of this translation'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '271', '271002', 'TRANSLATED_TITLE',     'translatedTitle',    'translatedTitle',    'TEXT',   500,  'N', 'translations$.translatedTitle',
    'lbl.translatedTitle',
    '{"renderAs":"text",        "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":true}',
    'Translated title of the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '271', '271003', 'TRANSLATED_TEXT',      'translatedText',     'translatedText',     'TEXT',   NULL, 'N', 'translations$.translatedText',
    'lbl.translatedText',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}',
    'Full translated text of the question'),

-- ── 272 CORR_QUESTION_USAGE_HISTORY ──────────────────────────
(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '272', '272001', 'CASE_ID',              'caseId',             'caseId',             'TEXT',   100,  'N', 'usageHistory$.caseId',
    'lbl.caseId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'Case ID where this question was used'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '272', '272002', 'USED_DATE',            'usedDate',           'usedDate',           'DATE',   NULL, 'N', 'usageHistory$.usedDate',
    'lbl.usedDate',
    '{"renderAs":"date",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "readOnly":true}',
    'Date the question was used in a case'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '272', '272003', 'USED_BY',              'usedBy',             'usedBy',             'TEXT',   100,  'N', 'usageHistory$.usedBy',
    'lbl.usedBy',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "readOnly":true}',
    'User who used the question'),

(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', '272', '272004', 'CHANNEL',              'channel',            'channel',            'TEXT',   100,  'N', 'usageHistory$.channel',
    'lbl.channel',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"CQ_CHANNEL"}',
    'Communication channel through which the question was sent')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
