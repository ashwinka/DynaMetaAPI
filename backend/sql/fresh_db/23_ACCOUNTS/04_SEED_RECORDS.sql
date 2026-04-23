-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : ACCOUNTS
-- Purpose : Sample seed records for ACCOUNTS module
-- ============================================================

INSERT INTO ACCOUNTS (
    ID, ACC_ID, ACC_NAME, IS_ACTIVE, ACCOUNT_TYPE, HEALTH_AUTHORITY,
    SINGLE_REG_NUMBER, DESCRIPTION,
    ADDRESS, COUNTRY, CITY, STATE, POSTCODE,
    PHONE_COUNTRY_CODE, PHONE_AREA_CODE, PHONE_NUMBER, WEBSITE,
    FAX_COUNTRY_CODE, FAX_AREA_CODE, FAX_NUMBER
) VALUES
('1',  'ACC-001', 'PharmaGlobal Inc.',                    'Y', 'PHARMA_CO',   'FDA',     'US-FDA-2001-001', 'Global pharmaceutical MAH headquartered in Boston',
    '100 Pharma Way',          'US', 'Boston',       'MA',  '02101', '+1',  '617', '555-1001', 'www.pharmaglobal.com',    '+1',  '617', '555-1002'),
('2',  'ACC-002', 'BioReach CRO',                         'Y', 'CRO',         NULL,      NULL,              'Contract Research Organisation — EU clinical studies',
    '25 Research Park',        'GB', 'Cambridge',    NULL,  'CB2 1TN','+44','1223','555-2001', 'www.bioreach.co.uk',      '+44', '1223','555-2002'),
('3',  'ACC-003', 'EMA — European Medicines Agency',      'Y', 'REG_AUTH',    'EMA',     'EMA-001',         'European Medicines Agency — regulatory authority',
    '160 Domenico Scarlattilaan','NL','Amsterdam',   NULL,  '1083 HP','+31','88', '555-3001', 'www.ema.europa.eu',       '+31', '88',  '555-3002'),
('4',  'ACC-004', 'FDA — Food and Drug Administration',   'Y', 'REG_AUTH',    'FDA',     'FDA-001',         'US Food and Drug Administration',
    '10903 New Hampshire Ave',  'US', 'Silver Spring','MD',  '20993', '+1',  '301', '555-4001', 'www.fda.gov',             '+1',  '301', '555-4002'),
('5',  'ACC-005', 'MHRA',                                 'Y', 'REG_AUTH',    'MHRA',    'MHRA-001',        'Medicines and Healthcare products Regulatory Agency — UK',
    '10 South Colonnade',       'GB', 'London',       NULL,  'E14 4PU','+44','20', '555-5001', 'www.gov.uk/mhra',         '+44', '20',  '555-5002'),
('6',  'ACC-006', 'BfArM',                                'Y', 'REG_AUTH',    'BFARM',   'BFARM-001',       'Federal Institute for Drugs and Medical Devices — Germany',
    'Kurt-Georg-Kiesinger-Allee 3','DE','Bonn',      NULL,  '53175', '+49', '228','555-6001', 'www.bfarm.de',            '+49', '228', '555-6002'),
('7',  'ACC-007', 'ANSM',                                 'Y', 'REG_AUTH',    'ANSM',    'ANSM-001',        'Agence nationale de sécurité du médicament — France',
    '143-147 Bd Anatole France','FR', 'Saint-Denis',  NULL,  '93285', '+33', '1',  '555-7001', 'www.ansm.sante.fr',       '+33', '1',   '555-7002'),
('8',  'ACC-008', 'PMDA',                                 'Y', 'REG_AUTH',    'PMDA',    'PMDA-001',        'Pharmaceuticals and Medical Devices Agency — Japan',
    '3-3-2 Kasumigaseki',       'JP', 'Tokyo',        NULL,  '100-0013','+81','3', '555-8001', 'www.pmda.go.jp',          '+81', '3',   '555-8002'),
('9',  'ACC-009', 'CDSCO',                                'Y', 'REG_AUTH',    'CDSCO',   'CDSCO-001',       'Central Drugs Standard Control Organisation — India',
    'FDA Bhawan, Kotla Road',   'IN', 'New Delhi',    NULL,  '110002', '+91', '11', '555-9001', 'www.cdsco.gov.in',        '+91', '11',  '555-9002'),
('10', 'ACC-010', 'Quintiles India',                      'Y', 'CRO',         NULL,      NULL,              'CRO partner for India clinical operations',
    'UB City, Vittal Mallya Rd','IN', 'Bangalore',    NULL,  '560001', '+91', '80', '555-0101', 'www.iqvia.com',           '+91', '80',  '555-0102'),
('11', 'ACC-011', 'ICON plc',                             'Y', 'CRO',         NULL,      NULL,              'Global CRO — medical writing and clinical operations',
    'South County Business Park','IE','Dublin',       NULL,  'D02 R590','+353','1','555-1101', 'www.iconplc.com',         '+353','1',   '555-1102'),
('12', 'ACC-012', 'Parexel International',                'Y', 'CRO',         NULL,      NULL,              'Global CRO — clinical operations',
    '195 West Street',          'US', 'Waltham',      'MA',  '02451', '+1',  '781', '555-1201', 'www.parexel.com',         '+1',  '781', '555-1202'),
('13', 'ACC-013', 'Syneos Health',                        'Y', 'CRO',         NULL,      NULL,              'Biopharmaceutical solutions company',
    '1030 Sync Street',         'US', 'Morrisville',  'NC',  '27560', '+1',  '919', '555-1301', 'www.syneoshealth.com',    '+1',  '919', '555-1302'),
('14', 'ACC-014', 'Health Canada',                        'Y', 'REG_AUTH',    'HEALTH_CA','HC-001',         'Health Canada — federal health authority',
    'Address Locator 0900C2',   'CA', 'Ottawa',       'ON',  'K1A 0K9','+1', '613', '555-1401', 'www.canada.ca/health',    '+1',  '613', '555-1402'),
('15', 'ACC-015', 'TGA',                                  'Y', 'REG_AUTH',    'TGA',     'TGA-001',         'Therapeutic Goods Administration — Australia',
    'PO Box 100, Woden',        'AU', 'Canberra',     'ACT', '2606',  '+61', '2',   '555-1501', 'www.tga.gov.au',          '+61', '2',   '555-1502')
ON CONFLICT (ID) DO NOTHING;

-- ── ACCOUNT_REG_NUMBERS ───────────────────────────────────────
INSERT INTO ACCOUNT_REG_NUMBERS (ID, ACCOUNT_REC_ID, AUTHORITY_NAME, REGISTRATION_NUMBER) VALUES
('RN001', '1',  'FDA',       'NDA-21-001'),
('RN002', '1',  'EMA',       'EU/1/21/001'),
('RN003', '1',  'PMDA',      'JP-2021-001'),
('RN004', '2',  'EUDAMED',   'EUDAMED-CRO-002'),
('RN005', '3',  'EUDAMED',   'EMA-REG-003'),
('RN006', '11', 'HEALTH_CA', 'HC-CRO-011')
ON CONFLICT (ID) DO NOTHING;

-- ── ACCOUNT_CONTACTS ─────────────────────────────────────────
INSERT INTO ACCOUNT_CONTACTS (ID, ACCOUNT_REC_ID, IS_PRIMARY, CONTACT_ID, CONTACT_NAME, INTERCHANGE_ID, E2B_CONTACT, CASE_DISTRIBUTION) VALUES
('AC001', '1',  'Y', 'CON-011', 'Helen Brooks',   'PHARMAGLOBAL-HQ',  'Y', 'Y'),
('AC002', '1',  'N', 'CON-005', 'Alice Johnson',  'PHARMAGLOBAL-REG', 'N', 'Y'),
('AC003', '2',  'Y', 'CON-013', 'Nadia Petrov',   'BIOREACH-EU',      'Y', 'Y'),
('AC004', '3',  'Y', 'CON-014', 'Rachel Green',   'EMA-MAIN',         'Y', 'N'),
('AC005', '4',  'Y', 'CON-009', 'Patricia Moore', 'FDA-MAIN',         'Y', 'N'),
('AC006', '8',  'Y', 'CON-015', 'Hiroshi Nakamura','PMDA-MAIN',       'Y', 'N')
ON CONFLICT (ID) DO NOTHING;

-- ── ACCOUNT_CONTRACTS ────────────────────────────────────────
INSERT INTO ACCOUNT_CONTRACTS (ID, ACCOUNT_REC_ID, CONTRACT_NAME, FILE_NAME, DOCUMENT_ID, CONTRACT_NUMBER, IS_ACTIVE, EFFECTIVE_START_DATE, EXPIRY_DATE, DESCRIPTION) VALUES
('CT001', '2',  'BioReach CRO Master Service Agreement', 'bioreach_msa_2023.pdf', 'DOC-2023-001', 'MSA-2023-BR-001', 'Y', '2023-01-01', '2025-12-31', 'Master service agreement for EU clinical study operations'),
('CT002', '2',  'BioReach Data Processing Agreement',    'bioreach_dpa_2023.pdf', 'DOC-2023-002', 'DPA-2023-BR-001', 'Y', '2023-01-01', '2025-12-31', 'GDPR data processing agreement'),
('CT003', '11', 'ICON Medical Writing Agreement',        'icon_mwa_2022.pdf',     'DOC-2022-001', 'MWA-2022-IC-001', 'Y', '2022-06-01', '2024-05-31', 'Medical writing services agreement'),
('CT004', '12', 'Parexel Clinical Operations Contract',  'parexel_coc_2023.pdf',  'DOC-2023-003', 'COC-2023-PX-001', 'Y', '2023-03-01', '2026-02-28', 'Clinical operations contract for Phase III studies'),
('CT005', '13', 'Syneos Medical Monitoring Agreement',   'syneos_mma_2023.pdf',   'DOC-2023-004', 'MMA-2023-SY-001', 'Y', '2023-07-01', '2025-06-30', 'Medical monitoring services agreement')
ON CONFLICT (ID) DO NOTHING;
