-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : SUBSTANCE
-- Purpose : Sample seed records for SUBSTANCE module
-- ============================================================

INSERT INTO SUBSTANCE (
    ID, SUBSTANCE_ID, SUBSTANCE_NAME, GENERIC_SUBSTANCE_CODE, IS_ACTIVE,
    SUBSTANCE_ROLE, IS_STRUCTURED, STRENGTH, UNIT, UNSTRUCTURED_STRENGTH,
    SUBSTANCE_TERM_ID, MANUFACTURER_NAME, CLASS_OF_INGREDIENT
) VALUES
('1',  'SUB-001', 'Trastuzumab',       '00332101001', 'Y', 'ACTIVE',    'Y', '150',  'mg',     NULL,                  'SUB-TERM-001', 'Roche',              'PHARMA'),
('2',  'SUB-002', 'Clozapine',         '00332101004', 'Y', 'ACTIVE',    'Y', '100',  'mg',     NULL,                  'SUB-TERM-002', 'Novartis',           'PHARMA'),
('3',  'SUB-003', 'Risperidone',       '00332101005', 'Y', 'ACTIVE',    'Y', '2',    'mg',     NULL,                  'SUB-TERM-003', 'Janssen',            'PHARMA'),
('4',  'SUB-004', 'Paclitaxel',        '01256101001', 'Y', 'ACTIVE',    'Y', '6',    'mg_mL',  NULL,                  'SUB-TERM-004', 'Bristol-Myers Squibb','PHARMA'),
('5',  'SUB-005', 'Docetaxel',         '01256101002', 'Y', 'ACTIVE',    'Y', '20',   'mg_mL',  NULL,                  'SUB-TERM-005', 'Sanofi',             'PHARMA'),
('6',  'SUB-006', 'Pertuzumab',        '01256101003', 'Y', 'ACTIVE',    'Y', '420',  'mg',     NULL,                  'SUB-TERM-006', 'Roche',              'PHARMA'),
('7',  'SUB-007', 'Haloperidol',       '00876702001', 'Y', 'ACTIVE',    'Y', '5',    'mg',     NULL,                  'SUB-TERM-007', 'Janssen',            'PHARMA'),
('8',  'SUB-008', 'Olanzapine',        '01142501008', 'Y', 'ACTIVE',    'Y', '10',   'mg',     NULL,                  'SUB-TERM-008', 'Eli Lilly',          'PHARMA'),
('9',  'SUB-009', 'Lorazepam',         '01142501009', 'Y', 'ACTIVE',    'Y', '1',    'mg',     NULL,                  'SUB-TERM-009', 'Pfizer',             'PHARMA'),
('10', 'SUB-010', 'Aripiprazole',      '01142501010', 'Y', 'ACTIVE',    'Y', '10',   'mg',     NULL,                  'SUB-TERM-010', 'Otsuka',             'PHARMA'),
('11', 'SUB-011', 'Ibuprofen',         '00100201001', 'Y', 'ACTIVE',    'Y', '400',  'mg',     NULL,                  'SUB-TERM-011', 'Various',            'PHARMA'),
('12', 'SUB-012', 'Paracetamol',       '00100201002', 'Y', 'ACTIVE',    'Y', '500',  'mg',     NULL,                  'SUB-TERM-012', 'Various',            'PHARMA'),
('13', 'SUB-013', 'Amoxicillin',       '00100201003', 'Y', 'ACTIVE',    'Y', '500',  'mg',     NULL,                  'SUB-TERM-013', 'Various',            'PHARMA'),
('14', 'SUB-014', 'Atorvastatin',      '00100201004', 'Y', 'ACTIVE',    'Y', '20',   'mg',     NULL,                  'SUB-TERM-014', 'Pfizer',             'PHARMA'),
('15', 'SUB-015', 'Metformin',         '00100201005', 'Y', 'ACTIVE',    'Y', '500',  'mg',     NULL,                  'SUB-TERM-015', 'Various',            'PHARMA'),
('16', 'SUB-016', 'Microcrystalline Cellulose', NULL, 'Y', 'EXCIPIENT', 'N', NULL,   NULL,     'As per formulation',  NULL,           'Various',            'PHARMA'),
('17', 'SUB-017', 'Lactose Monohydrate',        NULL, 'Y', 'EXCIPIENT', 'N', NULL,   NULL,     'As per formulation',  NULL,           'Various',            'PHARMA'),
('18', 'SUB-018', 'Magnesium Stearate',         NULL, 'Y', 'EXCIPIENT', 'N', NULL,   NULL,     'As per formulation',  NULL,           'Various',            'PHARMA'),
('19', 'SUB-019', 'Aluminium Hydroxide',        NULL, 'Y', 'ADJUVANT',  'Y', '0.5',  'mg',     NULL,                  NULL,           'Various',            'PHARMA'),
('20', 'SUB-020', 'AS04 Adjuvant System',       NULL, 'Y', 'ADJUVANT',  'N', NULL,   NULL,     'MPL + Alum combination','SUB-TERM-020','GSK',              'PHARMA')
ON CONFLICT (ID) DO NOTHING;

INSERT INTO SUBSTANCE_SYNONYMS (ID, SUBSTANCE_REC_ID, SYNONYM_NAME, IS_ACTIVE) VALUES
('SYN-001', '1',  'Herceptin',          'Y'),
('SYN-002', '1',  'Herzuma',            'Y'),
('SYN-003', '2',  'Clozaril',           'Y'),
('SYN-004', '2',  'Leponex',            'Y'),
('SYN-005', '3',  'Risperdal',          'Y'),
('SYN-006', '4',  'Taxol',              'Y'),
('SYN-007', '5',  'Taxotere',           'Y'),
('SYN-008', '6',  'Perjeta',            'Y'),
('SYN-009', '7',  'Haldol',             'Y'),
('SYN-010', '8',  'Zyprexa',            'Y'),
('SYN-011', '9',  'Ativan',             'Y'),
('SYN-012', '10', 'Abilify',            'Y'),
('SYN-013', '11', 'Advil',              'Y'),
('SYN-014', '11', 'Nurofen',            'Y'),
('SYN-015', '12', 'Panadol',            'Y'),
('SYN-016', '12', 'Tylenol',            'Y'),
('SYN-017', '13', 'Amoxil',             'Y'),
('SYN-018', '14', 'Lipitor',            'Y'),
('SYN-019', '15', 'Glucophage',         'Y'),
('SYN-020', '16', 'Avicel',             'Y')
ON CONFLICT (ID) DO NOTHING;
