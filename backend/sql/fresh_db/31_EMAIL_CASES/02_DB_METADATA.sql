-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Purpose : DB information about the module specific tables in to TABLE_METADATA and TABLE_COLUMN_METADATA
-- ============================================================

--   340  EMAIL_CASES   root   MULTI_CONTEXT=N

INSERT INTO TABLE_METADATA (
ID,                        MODULE_ID,     TABLE_ID,  PARENT_TABLE_ID,  DB_TABLE_NAME,  CONTEXT_NAME,  MULTI_CONTEXT,  JOIN_COLUMN,  REF_JOIN_COLUMN,  CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES','340',     NULL,             'EMAIL_CASES',  '',            'N',            NULL,         NULL,             NULL)
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
ID,                        MODULE_ID,      TABLE_ID,  FIELD_ID,   COLUMN_NAME,          FIELD_NAME,       	LISTING_ALIAS,      DATA_TYPE,  MAX_LENGTH,  REQUIRED_FIELD,  FIELD_PATH) VALUES
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340001',   'CASE_ID',           'caseId',           'caseId',           'TEXT',     100,         'Y',             'caseId'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340002',   'EMAIL_SUBJECT',     'emailSubject',     'emailSubject',     'TEXT',     500,         'N',             'emailSubject'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340003',   'SENDER_NAME',       'senderName',       'senderName',       'TEXT',     300,         'N',             'senderName'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340004',   'SENDER_EMAIL',      'senderEmail',      'senderEmail',      'TEXT',     300,         'N',             'senderEmail'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340005',   'SENDER_COUNTRY',    'senderCountry',    'senderCountry',    'TEXT',     10,          'N',             'senderCountry'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340006',   'RECEIVED_DATE',     'receivedDate',     'receivedDate',     'DATE',     NULL,        'N',             'receivedDate'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340007',   'STATUS',            'status',           'status',           'TEXT',     50,          'N',             'status'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340008',   'PRIORITY',          'priority',         'priority',         'TEXT',     20,          'N',             'priority'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340009',   'ASSIGNED_TO',       'assignedTo',       'assignedTo',       'TEXT',     100,         'N',             'assignedTo'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340010',   'DUE_DATE',          'dueDate',          'dueDate',          'DATE',     NULL,        'N',             'dueDate'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340011',   'CASE_CREATED',      'caseCreated',      'caseCreated',      'TEXT',     1,           'N',             'caseCreated'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340012',   'LINKED_CASE_ID',    'linkedCaseId',     'linkedCaseId',     'TEXT',     100,         'N',             'linkedCaseId'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340013',   'IS_SAFETY_RELATED', 'isSafetyRelated',  'isSafetyRelated',  'TEXT',     1,           'N',             'isSafetyRelated'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340014',   'REPORTER_TYPE',     'reporterType',     'reporterType',     'TEXT',     10,          'N',             'reporterType'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340015',   'PRODUCT_MENTIONED', 'productMentioned', 'productMentioned', 'TEXT',     300,         'N',             'productMentioned'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340016',   'EVENT_MENTIONED',   'eventMentioned',   'eventMentioned',   'TEXT',     500,         'N',             'eventMentioned'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340017',   'SERIOUS',           'serious',          'serious',          'TEXT',     1,           'N',             'serious'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340018',   'TRIAGE_DECISION',   'triageDecision',   'triageDecision',   'TEXT',     50,          'N',             'triageDecision'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340019',   'TRIAGE_DATE',       'triageDate',       'triageDate',       'DATE',     NULL,        'N',             'triageDate'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340020',   'TRIAGE_BY',         'triageBy',         'triageBy',         'TEXT',     100,         'N',             'triageBy'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340021',   'EMAIL_BODY',        'emailBody',        'emailBody',        'TEXT',     NULL,        'N',             'emailBody'),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', '340',     '340022',   'PROCESSING_NOTES',  'processingNotes',  'processingNotes',  'TEXT',     NULL,        'N',             'processingNotes')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
