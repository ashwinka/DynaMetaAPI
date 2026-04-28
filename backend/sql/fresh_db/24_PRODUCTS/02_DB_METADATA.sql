-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 02_DB_METADATA.sql
-- Module  : PRODUCTS
-- Purpose : TABLE_METADATA and TABLE_COLUMN_METADATA
--           UI_METADATA JSON derived from listing/form metadata.
--           LABEL holds the i18n key; DESCRIPTION holds English text.
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

--   260  PRODUCTS                   root        MULTI_CONTEXT=N
--   261  PRODUCT_SUBSTANCES         parent=260  MULTI_CONTEXT=Y
--   262  PRODUCT_LOCAL_TRADE_NAMES  parent=260  MULTI_CONTEXT=Y
--   263  PRODUCT_SYNONYMS           parent=260  MULTI_CONTEXT=Y

INSERT INTO TABLE_METADATA (
    ID, MODULE_ID, TABLE_ID, PARENT_TABLE_ID, DB_TABLE_NAME, CONTEXT_NAME, MULTI_CONTEXT, JOIN_COLUMN, REF_JOIN_COLUMN, CONTEXT_PATH)
VALUES
    (gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', NULL,  'PRODUCTS',                   '',                  'N', NULL,            NULL, NULL),
    (gen_random_uuid()::VARCHAR, 'PRODUCTS', '261', '260', 'PRODUCT_SUBSTANCES',         'substances',        'Y', 'PRODUCT_REC_ID','ID', 'substances$'),
    (gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '260', 'PRODUCT_LOCAL_TRADE_NAMES',  'localTradeNames',   'Y', 'PRODUCT_REC_ID','ID', 'localTradeNames$'),
    (gen_random_uuid()::VARCHAR, 'PRODUCTS', '263', '260', 'PRODUCT_SYNONYMS',           'synonyms',          'Y', 'PRODUCT_REC_ID','ID', 'synonyms$')
ON CONFLICT (MODULE_ID, TABLE_ID) DO NOTHING;

INSERT INTO TABLE_COLUMN_METADATA (
    ID, MODULE_ID, TABLE_ID, FIELD_ID, COLUMN_NAME, FIELD_NAME, LISTING_ALIAS, DATA_TYPE, MAX_LENGTH, REQUIRED_FIELD, FIELD_PATH, LABEL, UI_METADATA, DESCRIPTION)
VALUES
-- ── 260 PRODUCTS ─────────────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260001', 'PRODUCT_ID',               'productId',              'productId',              'TEXT',   100,  'Y', 'productId',
    'lbl.productId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "primaryKey":true}',
    'Unique identifier for the drug product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260002', 'PREFERRED_DESCRIPTION',    'preferredDescription',   'preferredDescription',   'TEXT',   300,  'Y', 'preferredDescription',
    'lbl.preferredDescription',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Preferred product description / trade name'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260003', 'IS_ACTIVE',                'isActive',               'isActive',               'TEXT',   1,    'N', 'isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether the product is active'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260004', 'PRODUCT_FLAG',             'productFlag',            'productFlag',            'TEXT',   50,   'N', 'productFlag',
    'lbl.productFlag',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"PRODUCT_FLAG"}',
    'Product type flag (Drug, Device, Vaccine, etc.)'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260005', 'PRODUCT_CLASS',            'productClass',           'productClass',           'TEXT',   50,   'N', 'productClass',
    'lbl.productClass',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true,  "codelist":"PRODUCT_CLASS"}',
    'Regulatory product class (Class 1–5)'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260006', 'ROUTE_OF_ADMIN',           'routeOfAdmin',           'routeOfAdmin',           'TEXT',   50,   'N', 'routeOfAdmin',
    'lbl.routeOfAdmin',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"ROUTE_OF_ADMIN"}',
    'Route of administration for the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260007', 'ROUTE_OF_ADMIN_TERM_ID',   'routeOfAdminTermId',     'routeOfAdminTermId',     'TEXT',   300,  'N', 'routeOfAdminTermId',
    'lbl.routeOfAdminTermId',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":false}',
    'Route of administration term ID from coding dictionary'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260008', 'FORM_OF_ADMIN',            'formOfAdmin',            'formOfAdmin',            'TEXT',   50,   'N', 'formOfAdmin',
    'lbl.formOfAdmin',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"FORM_OF_ADMIN"}',
    'Pharmaceutical dose form / form of administration'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260009', 'PHARMA_DOSE_FORM_TERM_ID', 'pharmaDoseFormTermId',   'pharmaDoseFormTermId',   'TEXT',   300,  'N', 'pharmaDoseFormTermId',
    'lbl.pharmaDoseFormTermId',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"18ch", "allowSorting":false}',
    'Pharmaceutical dose form term ID from EDQM coding dictionary'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260010', 'DESCRIPTION',              'description',            'description',            'TEXT',   1000, 'N', 'description',
    'lbl.description',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"30ch", "allowSorting":false}',
    'Free-text description of the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260011', 'MANUFACTURER_ACC_ID',      'manufacturerAccId',      'manufacturerAccId',      'TEXT',   100,  'N', 'manufacturerAccId',
    'lbl.manufacturerCode',
    '{"renderAs":"lookup",      "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "dispValField":"manufacturerCode", "lkpStoreValField":"accId", "lkpDispValField":"accName"}',
    'Manufacturer account ID — store value field, populated by lookup'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260012', 'MANUFACTURER_CODE',        'manufacturerCode',       'manufacturerCode',       'TEXT',   100,  'N', 'manufacturerCode',
    'lbl.manufacturerName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'Manufacturer name — display value field, populated by lookup'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260013', 'VIGILANCE_TYPE',           'vigilanceType',          'vigilanceType',          'TEXT',   50,   'N', 'vigilanceType',
    'lbl.vigilanceType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"VIGILANCE_TYPE"}',
    'Pharmacovigilance type for the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260014', 'VACCINE_TYPE',             'vaccineType',            'vaccineType',            'TEXT',   50,   'N', 'vaccineType',
    'lbl.vaccineType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"VACCINE_TYPE"}',
    'Vaccine type classification'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260015', 'PRODUCT_KEYWORDS',         'productKeywords',        'productKeywords',        'TEXT',   1000, 'N', 'productKeywords',
    'lbl.productKeywords',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"20ch", "allowSorting":false}',
    'Search keywords for the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260016', 'PRODUCT_ACTIVE_INGREDIENT','productActiveIngredient','productActiveIngredient','TEXT',   1000, 'N', 'productActiveIngredient',
    'lbl.productActiveIngredient',
    '{"renderAs":"textarea",    "fieldWidth":"3", "columnWidth":"20ch", "allowSorting":false}',
    'Active ingredient(s) of the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260017', 'WHO_DD_CODE',              'whoDdCode',              'whoDdCode',              'TEXT',   100,  'N', 'whoDdCode',
    'lbl.whoDdCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'WHO Drug Dictionary code'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260018', 'WHO_DD_DECODE',            'whoDdDecode',            'whoDdDecode',            'TEXT',   300,  'N', 'whoDdDecode',
    'lbl.whoDdDecode',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'WHO Drug Dictionary decoded name'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260019', 'INTERNAL_DRUG_CODE',       'internalDrugCode',       'internalDrugCode',       'TEXT',   100,  'N', 'internalDrugCode',
    'lbl.internalDrugCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Internal company drug code'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260020', 'MADE_BY',                  'madeBy',                 'madeBy',                 'TEXT',   50,   'N', 'madeBy',
    'lbl.madeBy',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"MADE_BY"}',
    'Indicates the origin / ownership of the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260021', 'COMPANY_PRODUCT',          'companyProduct',         'companyProduct',         'TEXT',   1,    'N', 'companyProduct',
    'lbl.companyProduct',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Indicates this is a company-owned product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260022', 'SUBJECT_TO_RISK_MGMT',     'subjectToRiskMgmt',      'subjectToRiskMgmt',      'TEXT',   1,    'N', 'subjectToRiskMgmt',
    'lbl.subjectToRiskMgmt',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true}',
    'Indicates the product is subject to a risk management plan'),

-- Device Information fields
(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260023', 'BRAND_NAME',               'brandName',              'brandName',              'TEXT',   300,  'N', 'brandName',
    'lbl.brandName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'Brand name of the device'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260024', 'MODEL_NUMBER',             'modelNumber',            'modelNumber',            'TEXT',   300,  'N', 'modelNumber',
    'lbl.modelNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Model number of the device'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260025', 'CATALOGUE_NUMBER',         'catalogueNumber',        'catalogueNumber',        'TEXT',   300,  'N', 'catalogueNumber',
    'lbl.catalogueNumber',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true}',
    'Catalogue number of the device'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260026', 'DEVICE_COMPONENT_NAME',    'deviceComponentName',    'deviceComponentName',    'TEXT',   300,  'N', 'deviceComponentName',
    'lbl.deviceComponentName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"20ch", "allowSorting":true}',
    'Device component name'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260027', 'DEVICE_COMPONENT_TERM_ID', 'deviceComponentTermId',  'deviceComponentTermId',  'TEXT',   300,  'N', 'deviceComponentTermId',
    'lbl.deviceComponentTermId',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":false}',
    'Device component term ID from coding dictionary'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260028', 'DEVICE_COMPONENT_TERM_ID_VER','deviceComponentTermIdVer','deviceComponentTermIdVer','TEXT',300,'N','deviceComponentTermIdVer',
    'lbl.deviceComponentTermIdVer',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":false}',
    'Device component term ID version date / number'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260029', 'MANUFACTURED_BY_ACC_ID',   'manufacturedByAccId',    'manufacturedByAccId',    'TEXT',   100,  'N', 'manufacturedByAccId',
    'lbl.manufacturedBy',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'Device manufacturer — selected via lookup from ACCOUNTS'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '260', '260030', 'DEVICE_MFG_SITE_ACC_ID',   'deviceMfgSiteAccId',     'deviceMfgSiteAccId',     'TEXT',   100,  'N', 'deviceMfgSiteAccId',
    'lbl.deviceMfgSite',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'Device manufacturing site — selected via lookup from ACCOUNTS'),

-- ── 261 PRODUCT_SUBSTANCES ───────────────────────────────────
(gen_random_uuid()::VARCHAR, 'PRODUCTS', '261', '261001', 'SUBSTANCE_ID',             'substanceId',            'substanceId',            'TEXT',   100,  'N', 'substances$.substanceId',
    'lbl.substanceId',
    '{"renderAs":"lookup",      "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "lookupModule":"SUBSTANCE", "dispValField":"substanceName", "lkpStoreValField":"substanceId", "lkpDispValField":"substanceName"}',
    'Substance ID — store value field, populated by lookup'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '261', '261002', 'SUBSTANCE_NAME',           'substanceName',          'substanceName',          'TEXT',   300,  'N', 'substances$.substanceName',
    'lbl.substanceName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"24ch", "allowSorting":true}',
    'Substance name — display value field, populated by lookup'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '261', '261003', 'IS_ACTIVE',                'isActive',               'isActive',               'TEXT',   1,    'N', 'substances$.isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether this substance link is active'),

-- ── 262 PRODUCT_LOCAL_TRADE_NAMES ────────────────────────────
(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262001', 'LTN',                      'ltn',                    'ltn',                    'TEXT',   300,  'Y', 'localTradeNames$.ltn',
    'lbl.ltn',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true}',
    'Local trade name of the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262002', 'NDC_CODE',                 'ndcCode',                'ndcCode',                'TEXT',   100,  'N', 'localTradeNames$.ndcCode',
    'lbl.ndcCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'National Drug Code'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262003', 'ATC_CODE',                 'atcCode',                'atcCode',                'TEXT',   100,  'N', 'localTradeNames$.atcCode',
    'lbl.atcCode',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"12ch", "allowSorting":true}',
    'Anatomical Therapeutic Chemical code'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262004', 'AUTHORIZATION_NO',         'authorizationNo',        'authorizationNo',        'TEXT',   200,  'N', 'localTradeNames$.authorizationNo',
    'lbl.authorizationNo',
    '{"renderAs":"text",        "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true}',
    'Marketing authorisation number'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262005', 'APPROVAL_TYPE',            'approvalType',           'approvalType',           'TEXT',   50,   'N', 'localTradeNames$.approvalType',
    'lbl.approvalType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"18ch", "allowSorting":true,  "codelist":"APPROVAL_TYPE"}',
    'Type of marketing authorisation approval'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262006', 'MAH_ACC_ID',               'mahAccId',               'mahAccId',               'TEXT',   100,  'N', 'localTradeNames$.mahAccId',
    'lbl.mah',
    '{"renderAs":"lookup",      "fieldWidth":"2", "columnWidth":"22ch", "allowSorting":true,  "lookupModule":"ACCOUNTS", "lkpStoreValField":"accId"}',
    'Marketing Authorisation Holder — single-column lookup from ACCOUNTS'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262007', 'AUTHORIZATION_COUNTRY',    'authorizationCountry',   'authorizationCountry',   'TEXT',   10,   'N', 'localTradeNames$.authorizationCountry',
    'lbl.authorizationCountry',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"COUNTRY"}',
    'Country in which the product is authorised'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262008', 'SUBMISSION_TYPE',          'submissionType',         'submissionType',         'TEXT',   50,   'N', 'localTradeNames$.submissionType',
    'lbl.submissionType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"16ch", "allowSorting":true,  "codelist":"SUBMISSION_TYPE"}',
    'Regulatory submission type'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262009', 'PRODUCT_FLAG',             'productFlag',            'productFlag',            'TEXT',   50,   'N', 'localTradeNames$.productFlag',
    'lbl.productFlag',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"PRODUCT_FLAG"}',
    'Product flag for this local trade name'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '262', '262010', 'VACCINE_TYPE',             'vaccineType',            'vaccineType',            'TEXT',   50,   'N', 'localTradeNames$.vaccineType',
    'lbl.vaccineType',
    '{"renderAs":"combo",       "fieldWidth":"1", "columnWidth":"14ch", "allowSorting":true,  "codelist":"VACCINE_TYPE"}',
    'Vaccine type for this local trade name'),

-- ── 263 PRODUCT_SYNONYMS ─────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'PRODUCTS', '263', '263001', 'SYNONYM_NAME',             'synonymName',            'synonymName',            'TEXT',   100,  'N', 'synonyms$.synonymName',
    'lbl.synonymName',
    '{"renderAs":"text",        "fieldWidth":"2", "columnWidth":"28ch", "allowSorting":true}',
    'Synonym or alternate name for the product'),

(gen_random_uuid()::VARCHAR, 'PRODUCTS', '263', '263002', 'IS_ACTIVE',                'isActive',               'isActive',               'TEXT',   1,    'N', 'synonyms$.isActive',
    'lbl.active',
    '{"renderAs":"bool-switch", "fieldWidth":"1", "columnWidth":"8ch",  "allowSorting":true,  "align":"center"}',
    'Indicates whether this synonym is active')

ON CONFLICT (MODULE_ID, TABLE_ID, FIELD_ID) DO NOTHING;
