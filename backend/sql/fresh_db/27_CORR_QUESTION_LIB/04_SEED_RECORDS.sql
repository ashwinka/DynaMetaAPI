-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 04_SEED_RECORDS.sql
-- Module  : CORR_QUESTION_LIB
-- Purpose : Sample seed records for Correspondence Question Library
-- ============================================================

INSERT INTO CORR_QUESTION_LIB (
    ID, QUESTION_ID, QUESTION_TITLE, CATEGORY, SUB_CATEGORY, LANGUAGE,
    PRIORITY, IS_ACTIVE, IS_MANDATORY, APPLICABLE_TO,
    QUESTION_TEXT, HELP_TEXT, RESPONSE_TYPE, EXPECTED_RESPONSE,
    FOLLOW_UP_QUESTION_ID, CREATED_BY, CREATED_DATE, LAST_MODIFIED
) VALUES
-- ── Patient Information ───────────────────────────────────────
('1',  'CQ-001', 'Patient Date of Birth',
    'PATIENT_INFO', 'DEMOGRAPHICS', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'Please provide the patient''s date of birth.',
    'Enter the date in DD-MMM-YYYY format. If exact date is unknown, provide approximate year.',
    'DATE', 'DD-MMM-YYYY', NULL, 'admin', '2023-01-01', '2023-01-01'),

('2',  'CQ-002', 'Patient Weight at Time of Event',
    'PATIENT_INFO', 'DEMOGRAPHICS', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'What was the patient''s weight at the time of the adverse event?',
    'Provide weight in kilograms (kg). If unknown, state "Unknown".',
    'FREE_TEXT', 'e.g. 70 kg', NULL, 'admin', '2023-01-01', '2023-01-01'),

('3',  'CQ-003', 'Patient Medical History',
    'PATIENT_INFO', 'MEDICAL_HISTORY', 'EN', 'HIGH', 'Y', 'N', 'ICSR',
    'Please provide the patient''s relevant medical history including pre-existing conditions.',
    'Include all relevant conditions, surgeries, and chronic diseases.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

-- ── Drug Information ──────────────────────────────────────────
('4',  'CQ-004', 'Suspect Drug Dose and Frequency',
    'DRUG_INFO', 'DOSING', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'What was the dose and frequency of the suspect drug at the time of the adverse event?',
    'Include dose amount, unit, and frequency (e.g. 100 mg twice daily).',
    'FREE_TEXT', 'e.g. 100 mg BID', NULL, 'admin', '2023-01-01', '2023-01-01'),

('5',  'CQ-005', 'Suspect Drug Start Date',
    'DRUG_INFO', 'DOSING', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'When did the patient start taking the suspect drug?',
    'Provide the start date in DD-MMM-YYYY format.',
    'DATE', 'DD-MMM-YYYY', NULL, 'admin', '2023-01-01', '2023-01-01'),

('6',  'CQ-006', 'Suspect Drug Indication',
    'DRUG_INFO', 'INDICATION', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'What was the indication (reason) for prescribing the suspect drug?',
    'Provide the medical condition or reason for which the drug was prescribed.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

('7',  'CQ-007', 'Was Drug Discontinued After Event?',
    'DRUG_INFO', 'ACTION_TAKEN', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'Was the suspect drug discontinued following the adverse event?',
    'Select Yes or No. If Yes, provide the date of discontinuation.',
    'YES_NO', 'Yes / No', 'CQ-008', 'admin', '2023-01-01', '2023-01-01'),

('8',  'CQ-008', 'Date of Drug Discontinuation',
    'DRUG_INFO', 'ACTION_TAKEN', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'Please provide the date on which the suspect drug was discontinued.',
    'Enter the date in DD-MMM-YYYY format.',
    'DATE', 'DD-MMM-YYYY', NULL, 'admin', '2023-01-01', '2023-01-01'),

-- ── Adverse Event Details ─────────────────────────────────────
('9',  'CQ-009', 'Adverse Event Onset Date',
    'EVENT_INFO', 'TIMELINE', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'When did the adverse event first occur?',
    'Provide the onset date in DD-MMM-YYYY format. If exact date unknown, provide approximate date.',
    'DATE', 'DD-MMM-YYYY', NULL, 'admin', '2023-01-01', '2023-01-01'),

('10', 'CQ-010', 'Adverse Event Outcome',
    'EVENT_INFO', 'OUTCOME', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'What was the outcome of the adverse event?',
    'Select the most appropriate outcome from: Recovered, Recovering, Not Recovered, Fatal, Unknown.',
    'CODELIST', 'Recovered / Recovering / Not Recovered / Fatal / Unknown', NULL, 'admin', '2023-01-01', '2023-01-01'),

('11', 'CQ-011', 'Was the Event Serious?',
    'EVENT_INFO', 'SERIOUSNESS', 'EN', 'HIGH', 'Y', 'Y', 'ICSR',
    'Was the adverse event considered serious? If yes, please specify the seriousness criteria.',
    'Seriousness criteria: Death, Life-threatening, Hospitalisation, Disability, Congenital anomaly, Other medically important.',
    'YES_NO', 'Yes / No', 'CQ-012', 'admin', '2023-01-01', '2023-01-01'),

('12', 'CQ-012', 'Seriousness Criteria',
    'EVENT_INFO', 'SERIOUSNESS', 'EN', 'HIGH', 'Y', 'N', 'ICSR',
    'Please specify the seriousness criteria that apply to this adverse event.',
    'Select all that apply: Death, Life-threatening, Hospitalisation, Disability, Congenital anomaly, Other.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

-- ── Reporter Information ──────────────────────────────────────
('13', 'CQ-013', 'Reporter Qualification',
    'REPORTER_INFO', 'QUALIFICATION', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'What is the qualification of the reporter?',
    'e.g. Physician, Pharmacist, Nurse, Patient, Other healthcare professional.',
    'CODELIST', 'Physician / Pharmacist / Nurse / Patient / Other', NULL, 'admin', '2023-01-01', '2023-01-01'),

('14', 'CQ-014', 'Reporter Contact Details',
    'REPORTER_INFO', 'CONTACT', 'EN', 'LOW', 'Y', 'N', 'ICSR',
    'Please provide the reporter''s contact details for follow-up purposes.',
    'Include name, telephone number, and email address if available.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

-- ── Literature Cases ──────────────────────────────────────────
('15', 'CQ-015', 'Literature Reference Details',
    'LITERATURE', 'REFERENCE', 'EN', 'HIGH', 'Y', 'Y', 'LITERATURE',
    'Please provide the full reference details for the literature article.',
    'Include: Author(s), Title, Journal, Volume, Issue, Pages, Year, DOI.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

-- ── Email Cases ───────────────────────────────────────────────
('16', 'CQ-016', 'Confirm Patient Consent',
    'EMAIL_CASE', 'CONSENT', 'EN', 'HIGH', 'Y', 'Y', 'EMAIL',
    'Has the patient provided consent for their data to be processed for pharmacovigilance purposes?',
    'Consent must be confirmed before processing the case.',
    'YES_NO', 'Yes / No', NULL, 'admin', '2023-01-01', '2023-01-01'),

('17', 'CQ-017', 'Additional Clinical Information',
    'EVENT_INFO', 'CLINICAL', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'Please provide any additional clinical information relevant to the adverse event.',
    'Include laboratory results, concomitant medications, relevant medical history not previously reported.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01'),

('18', 'CQ-018', 'Rechallenge Information',
    'DRUG_INFO', 'RECHALLENGE', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'Was the suspect drug restarted after the adverse event? If yes, did the event recur?',
    'Rechallenge information is important for causality assessment.',
    'YES_NO', 'Yes / No', NULL, 'admin', '2023-01-01', '2023-01-01'),

('19', 'CQ-019', 'Dechallenge Information',
    'DRUG_INFO', 'DECHALLENGE', 'EN', 'MEDIUM', 'Y', 'N', 'ICSR',
    'Did the adverse event improve or resolve after the suspect drug was stopped or dose reduced?',
    'Dechallenge information is important for causality assessment.',
    'YES_NO', 'Yes / No', NULL, 'admin', '2023-01-01', '2023-01-01'),

('20', 'CQ-020', 'Batch / Lot Number',
    'DRUG_INFO', 'PRODUCT', 'EN', 'LOW', 'Y', 'N', 'ICSR',
    'Please provide the batch or lot number of the suspect drug product.',
    'The batch/lot number can usually be found on the product packaging.',
    'FREE_TEXT', NULL, NULL, 'admin', '2023-01-01', '2023-01-01')
ON CONFLICT (ID) DO NOTHING;

-- ── Translations ──────────────────────────────────────────────
INSERT INTO CORR_QUESTION_TRANSLATIONS (ID, QUESTION_ID, LANGUAGE, TRANSLATED_TITLE, TRANSLATED_TEXT) VALUES
('T001', '1',  'FR', 'Date de naissance du patient',         'Veuillez indiquer la date de naissance du patient.'),
('T002', '1',  'JA', '患者の生年月日',                        '患者の生年月日を入力してください。'),
('T003', '4',  'FR', 'Dose et fréquence du médicament suspect','Quelle était la dose et la fréquence du médicament suspect au moment de l''événement indésirable?'),
('T004', '4',  'JA', '被疑薬の用量と頻度',                    '有害事象発生時の被疑薬の用量と頻度を教えてください。'),
('T005', '9',  'FR', 'Date de début de l''événement indésirable','Quand l''événement indésirable s''est-il produit pour la première fois?'),
('T006', '9',  'JA', '有害事象の発現日',                      '有害事象が最初に発生した日はいつですか？'),
('T007', '10', 'FR', 'Issue de l''événement indésirable',    'Quelle a été l''issue de l''événement indésirable?'),
('T008', '10', 'JA', '有害事象の転帰',                        '有害事象の転帰はどうでしたか？'),
('T009', '11', 'FR', 'L''événement était-il grave?',         'L''événement indésirable a-t-il été considéré comme grave?'),
('T010', '11', 'JA', '重篤な事象でしたか？',                  'この有害事象は重篤と判断されましたか？')
ON CONFLICT (ID) DO NOTHING;
