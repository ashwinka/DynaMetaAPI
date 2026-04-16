-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Purpose : DB information about the module specific tables in to TABLE_METADATA and TABLE_COLUMN_METADATA
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

--   150  CODE_LIST_LIB     root                MULTI_CONTEXT=N
--   155  CODE_LIST_VALUES  parent=150          MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
ID,                        	  MODULE_ID,     TABLE_ID,  PARENT_TABLE_ID,  DB_TABLE_NAME,      CONTEXT_NAME,  MULTI_CONTEXT,  JOIN_COLUMN,    REF_JOIN_COLUMN,  CONTEXT_PATH) VALUES
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '150',     NULL,             'CODE_LIST_LIB',    '',            'N',            NULL,           NULL,             NULL),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '150',            'CODE_LIST_VALUES', 'values',      'Y',            'CODE_LIST_ID', 'CODE_LIST_ID',   'values')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
ID,                        	 MODULE_ID,      TABLE_ID,  FIELD_ID,   COLUMN_NAME,    FIELD_NAME,   	LISTING_ALIAS,  DATA_TYPE,  MAX_LENGTH,  REQUIRED_FIELD,  FIELD_PATH,				LABEL, 				UI_METADATA, 																				LABEL_INFO, DESCRIPTION) VALUES
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '150',     '150001',   'CODE_LIST_ID', 'codeListId',   'codeListId',   'TEXT',     300,         'Y',             'codeListId',				'lbl.codeListId',	'{"renderAs":"text", 		"fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}', 	'', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '150',     '150002',   'DESCRIPTION',  'description',  'description',  'TEXT',     300,         'Y',             'description',			'lbl.description',	'{"renderAs":"textarea",	"fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}', '', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '150',     '150003',   'IS_ACTIVE',    'isActive',     'isActive',     'TEXT',     1,           'N',             'isActive',				'lbl.active',		'{"renderAs":"bool-switch",	"fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}', 	'', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '155001',   'CODE',         'code',         'code',         'TEXT',     100,         'Y',             'values$.code',			'lbl.code',			'{"renderAs":"text", 		"fieldWidth":"1", "columnWidth":"20ch", "allowSorting":true}', 	'', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '155002',   'DECODE',       'decode',       'decode',       'TEXT',     300,         'Y',             'values$.decode',			'lbl.decode',		'{"renderAs":"text", 		"fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}', 	'', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '155003',   'TRANSLATIONS', 'translations', 'translations', 'TEXT',     NULL,        'N',             'values$.translations',	'lbl.translations',	'{"renderAs":"textarea",	"fieldWidth":"3", "columnWidth":"40ch", "allowSorting":false}', '', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '155004',   'SEQUENCE',     'sequence',     'sequence',     'NUMBER',   NULL,        'N',             'values$.sequence',		'lbl.sequence',		'{"renderAs":"numeric", 	"fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}', 	'', 		''),
(gen_random_uuid()::VARCHAR, 'CODELIST_LIB', '155',     '155005',   'IS_ACTIVE',    'isActive',     'isActive',     'TEXT',     1,           'N',             'values$.isActive',		'lbl.active',		'{"renderAs":"bool-switch",	"fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}', 	'', 		'')
ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
