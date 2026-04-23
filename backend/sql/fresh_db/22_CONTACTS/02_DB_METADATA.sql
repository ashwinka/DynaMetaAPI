-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : CONTACTS
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================


--   220  CONTACTS           root        MULTI_CONTEXT=N
--   225  CONTACT_ADDRESSES  parent=220  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, 						 MODULE_ID,  TABLE_ID, 	PARENT_TABLE_ID, DB_TABLE_NAME, 		CONTEXT_NAME, 	MULTI_CONTEXT, JOIN_COLUMN,  	REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'CONTACTS', '220', 	NULL,  			 'CONTACTS',          	'',         	'N', 			NULL,           NULL, 			NULL),
    (gen_random_uuid()::VARCHAR, 'CONTACTS', '225', 	'220', 			 'CONTACT_ADDRESSES', 	'addresses',	'Y', 			'CONTACT_REC_ID','ID',			'addresses$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 220 CONTACTS ─────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220001', 'CONTACT_ID',        'contactId',        'contactId',        'TEXT',   100,  'Y', 'contactId',
    'lbl.contactId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220002', 'IS_ACTIVE',         'isActive',         'isActive',         'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the contact is active'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220003', 'TITLE',             'title',            'title',            'TEXT',   50,   'N', 'title',
    'lbl.title',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"CONTACT_TITLE"}',
    'Salutation or title of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220004', 'FIRST_NAME',        'firstName',        'firstName',        'TEXT',   100,  'Y', 'firstName',
    'lbl.firstName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'First name of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220005', 'MIDDLE_NAME',       'middleName',       'middleName',       'TEXT',   100,  'N', 'middleName',
    'lbl.middleName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Middle name of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220006', 'LAST_NAME',         'lastName',         'lastName',         'TEXT',   100,  'N', 'lastName',
    'lbl.lastName',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Last name of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220007', 'CONTACT_MEDIUM',    'contactMedium',    'contactMedium',    'TEXT',   50,   'N', 'contactMedium',
    'lbl.contactMedium',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"CONTACT_MEDIUM"}',
    'Preferred communication medium for the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220008', 'DO_NOT_CONTACT',    'doNotContact',     'doNotContact',     'TEXT',   1,    'N', 'doNotContact',
    'lbl.doNotContact',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Flag to suppress all outbound communication to this contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220009', 'EMAIL_ID',          'emailId',          'emailId',          'TEXT',   300,  'N', 'emailId',
    'lbl.emailId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"26ch", "allowSorting":true}',
    'Primary email address of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220010', 'GENDER',            'gender',           'gender',           'TEXT',   20,   'N', 'gender',
    'lbl.gender',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true,  "codelist":"SEX"}',
    'Gender of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220011', 'DEPARTMENT_ID',     'departmentId',     'departmentId',     'TEXT',   36,   'N', 'departmentId',
    'lbl.department',
    '{"renderAs":"lookup",      "fieldWidth":"3", "columnWidth":"20ch", "allowSorting":true,  "lookupModule":"DEPARTMENTS", "lkpStoreValField":"departmentCode"}',
    'Department this contact belongs to'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220012', 'QUALIFICATION',     'qualification',    'qualification',    'TEXT',   100,  'N', 'qualification',
    'lbl.qualification',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"CONTACT_QUALIFICATION"}',
    'Professional qualification of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220013', 'SPECIALIZATION',    'specialization',   'specialization',   'TEXT',   100,  'N', 'specialization',
    'lbl.specialization',
    '{"renderAs":"combo",       "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true,  "codelist":"CONTACT_SPECIALIZATION"}',
    'Medical or professional specialization of the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220014', 'CONTACT_CATEGORY',  'contactCategory',  'contactCategory',  'TEXT',   50,   'N', 'contactCategory',
    'lbl.contactCategory',
    '{"renderAs":"combo",       "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "codelist":"CONTACT_CATEGORY"}',
    'Category classifying the contact as internal/external HCP/non-HCP'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220015', 'PHONE_COUNTRY_CODE','phoneCountryCode', 'phoneCountryCode', 'TEXT',   10,   'N', 'phoneCountryCode',
    'lbl.phoneCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the contact phone'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220016', 'PHONE_AREA_CODE',   'phoneAreaCode',    'phoneAreaCode',    'TEXT',   10,   'N', 'phoneAreaCode',
    'lbl.phoneAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the contact phone'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220017', 'PHONE_NUMBER',      'phoneNumber',      'phoneNumber',      'TEXT',   50,   'N', 'phoneNumber',
    'lbl.phoneNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local phone number for the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220018', 'FAX_COUNTRY_CODE',  'faxCountryCode',   'faxCountryCode',   'TEXT',   10,   'N', 'faxCountryCode',
    'lbl.faxCountryCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Country dialling code for the contact fax'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220019', 'FAX_AREA_CODE',     'faxAreaCode',      'faxAreaCode',      'TEXT',   10,   'N', 'faxAreaCode',
    'lbl.faxAreaCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":false}',
    'Area code for the contact fax'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '220', '220020', 'FAX_NUMBER',        'faxNumber',        'faxNumber',        'TEXT',   50,   'N', 'faxNumber',
    'lbl.faxNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":false}',
    'Local fax number for the contact'),

-- ── 225 CONTACT_ADDRESSES ─────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225001', 'IS_PRIMARY',        'isPrimary',        'isPrimary',        'TEXT',   1,    'N', 'addresses$.isPrimary',
    'lbl.isPrimary',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"10ch", "allowSorting":true}',
    'Marks this as the primary address for the contact'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225002', 'HOUSE_APT_NUMBER',  'houseAptNumber',   'houseAptNumber',   'TEXT',   100,  'N', 'addresses$.houseAptNumber',
    'lbl.houseAptNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":false}',
    'House or apartment number'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225003', 'ADDRESS',           'address',          'address',          'TEXT',   1000, 'N', 'addresses$.address',
    'lbl.address',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Full street address'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225004', 'COUNTRY',           'country',          'country',          'TEXT',   10,   'N', 'addresses$.country',
    'lbl.country',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'Country of the address'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225005', 'CITY',              'city',             'city',             'TEXT',   150,  'N', 'addresses$.city',
    'lbl.city',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'City of the address'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225006', 'STATE',             'state',            'state',            'TEXT',   150,  'N', 'addresses$.state',
    'lbl.state',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'State or province of the address'),

(gen_random_uuid()::VARCHAR, 'CONTACTS', '225', '225007', 'ADDRESS_TYPE',      'addressType',      'addressType',      'TEXT',   50,   'N', 'addresses$.addressType',
    'lbl.addressType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"ADDRESS_TYPE"}',
    'Type of address (permanent, current, office, residential, other)')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
