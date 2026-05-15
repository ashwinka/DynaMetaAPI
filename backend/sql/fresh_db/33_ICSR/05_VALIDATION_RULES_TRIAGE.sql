-- ============================================================
-- MetaDyna API — ICSR Module
-- Script  : 05_VALIDATION_RULES_TRIAGE.sql
-- Purpose : APP_RULES of type VALIDATION for ICSR Triage form
--
-- STRUCTURE:
--   RULE_EXPRESSION — condition logic only (AND/OR groups)
--     {"logic":"AND","conditions":[...],"expressions":[]}
--     "expressions" is reserved for sub-group / child expressions
--
--   RULE_ACTIONS — what to do when rule fires
--     [{"fieldId":"","severity":"error|warning|info","validationMessage":""}]
--     severity: error   = blocks save
--               warning = allows save with confirmation
--               info    = informational only
--
-- CONTEXT_PATH RESOLUTION:
--   Multi-context table fields take precedence over root fields.
--   500/530 → ''                      (root / 1:1)
--   515     → 'reporterInformations$'
--   600     → 'eventReactions$'
--   610     → 'drugProducts$'
-- ============================================================

INSERT INTO APP_RULES (
    ID, MODULE_ID, RULE_ID, STATUS, IS_ACTIVE, IS_OOB,
    RULE_TYPE, TRIGGER_FIELDS, CONTEXT_PATH, RULE_EXPRESSION, RULE_ACTIONS)
VALUES

-- ══════════════════════════════════════════════════════════════
-- SECTION 500 — CASE HEADER
-- ══════════════════════════════════════════════════════════════

-- ── Safety Report ID is mandatory ────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_SAFETY_REPORT_ID_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500001', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500001","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500001","severity":"error","validationMessage":"Safety Report ID is required."}]'),

-- ── Initial received date is mandatory ───────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_RECEIVE_DATE_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500007', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500007","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500007","severity":"error","validationMessage":"Initial received date is required."}]'),

-- ── Receipt date must not be before received date ─────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_RECEIPT_DATE_ORDER',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500008', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500008","operator":"neq","rhsValue":""},{"lhsFieldId":"500008","operator":"lt","rhsFieldId":"500007"}],"expressions":[]}',
    '[{"fieldId":"500008","severity":"error","validationMessage":"Latest received date cannot be before initial received date."}]'),

-- ── Report type is mandatory ──────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REPORT_TYPE_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500011', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500011","severity":"error","validationMessage":"Report type is required."}]'),

-- ── Initial or follow-up is mandatory ────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_INITIAL_FOLLOWUP_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500041', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500041","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500041","severity":"error","validationMessage":"Initial / Follow-up indicator is required."}]'),

-- ── Nullification reason required when nullification is set ───
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_NULLIFICATION_REASON_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500015', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500015","operator":"neq","rhsValue":""},{"lhsFieldId":"500016","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500016","severity":"error","validationMessage":"Reason for nullification / amendment is required when nullification flag is set."}]'),

-- ── Seriousness: at least one criterion required when serious = Y
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_SERIOUSNESS_CRITERIA_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500021', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500021","operator":"eq","rhsValue":"Y"},{"lhsFieldId":"500022","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500023","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500024","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500025","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500026","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500027","operator":"eq","rhsValue":"N"},{"lhsFieldId":"500028","operator":"eq","rhsValue":"N"}],"expressions":[]}',
    '[{"fieldId":"500021","severity":"warning","validationMessage":"Case is marked serious but no seriousness criterion is selected."}]'),

-- ── Primary source country recommended ───────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_PRIMARY_SRC_COUNTRY_RECOMMENDED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '500005', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500005","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"500005","severity":"info","validationMessage":"Primary source country is recommended for regulatory reporting."}]'),

-- ══════════════════════════════════════════════════════════════
-- SECTION 515 — REPORTER  (contextPath: reporterInformations$)
-- ══════════════════════════════════════════════════════════════

-- ── At least one reporter recommended ────────────────────────
-- COUNT on multi-context collection: fires when reporter count = 0
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REPORTER_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '515001', 'reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFunction":"COUNT","lhsFieldId":"515001","operator":"eq","rhsValue":"0"}],"expressions":[]}',
    '[{"fieldId":"515001","severity":"warning","validationMessage":"At least one reporter should be identified."}]'),

-- ── Qualification required when reporter is HCP ───────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REPORTER_QUALIFICATION_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '515013', 'reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"515013","operator":"eq","rhsValue":"Y"},{"lhsFieldId":"515004","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"515004","severity":"warning","validationMessage":"Reporter qualification should be specified for healthcare professionals."}]'),

-- ── Reporter country recommended ─────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REPORTER_COUNTRY_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '515031', 'reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"515031","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"515031","severity":"info","validationMessage":"Reporter country is recommended for E2B submission."}]'),

-- ══════════════════════════════════════════════════════════════
-- SECTION 530 — PATIENT  (contextPath: '' — 1:1 root child)
-- ══════════════════════════════════════════════════════════════

-- ── Patient initials recommended ─────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_PATIENT_INITIALS_RECOMMENDED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '530001', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530001","operator":"eq","rhsValue":""},{"lhsFieldId":"530009","operator":"eq","rhsValue":"N"}],"expressions":[]}',
    '[{"fieldId":"530001","severity":"info","validationMessage":"Patient initials are recommended for traceability."}]'),

-- ── Patient sex required ──────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_PATIENT_SEX_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '530002', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530002","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"530002","severity":"warning","validationMessage":"Patient sex is required for E2B reporting."}]'),

-- ── Age or DOB — at least one required ───────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_PATIENT_AGE_OR_DOB_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '530004', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530004","operator":"eq","rhsValue":""},{"lhsFieldId":"530005","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"530005","severity":"warning","validationMessage":"Patient date of birth or age at onset is required."}]'),

-- ── Age unit required when age is provided ────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_PATIENT_AGE_UNIT_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '530006', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530005","operator":"neq","rhsValue":""},{"lhsFieldId":"530006","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"530006","severity":"error","validationMessage":"Age unit is required when age at onset is provided."}]'),

-- ── Death date recommended when case is fatal ─────────────────
-- Mixed: 500022 (root) + 530037 (root 1:1) → contextPath ''
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_DEATH_DATE_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '530037', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500022","operator":"eq","rhsValue":"Y"},{"lhsFieldId":"530037","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"530037","severity":"warning","validationMessage":"Date of death is recommended when case is marked as fatal."}]'),

-- ══════════════════════════════════════════════════════════════
-- SECTION 610 — DRUG PRODUCTS  (contextPath: drugProducts$)
-- ══════════════════════════════════════════════════════════════

-- ── Product name required ─────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_SUSPECT_DRUG_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '610052', 'drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610052","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"610052","severity":"error","validationMessage":"Product name is required for each drug product."}]'),

-- ── Drug characterization required ───────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_DRUG_CHARACTERIZATION_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '610050', 'drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610050","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"610050","severity":"error","validationMessage":"Drug characterization (suspect / concomitant / interacting) is required."}]'),

-- ── Action taken required for suspect / interacting drugs ─────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_ACTION_TAKEN_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '610001', 'drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610050","operator":"in","rhsValue":["1","2"]},{"lhsFieldId":"610001","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"610001","severity":"warning","validationMessage":"Action taken with drug should be specified for suspect / interacting products."}]'),

-- ══════════════════════════════════════════════════════════════
-- SECTION 600 — EVENT / REACTIONS  (contextPath: eventReactions$)
-- ══════════════════════════════════════════════════════════════

-- ── Reaction term required ────────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_TERM_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600029', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600029","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"600029","severity":"error","validationMessage":"Reaction term is required."}]'),

-- ── Reaction onset date required ─────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_ONSET_DATE_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600024', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600024","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"600024","severity":"warning","validationMessage":"Reaction onset date is required for E2B reporting."}]'),

-- ── Reaction end date must not be before onset date ───────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_DATE_ORDER',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600013', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600013","operator":"neq","rhsValue":""},{"lhsFieldId":"600013","operator":"lt","rhsFieldId":"600024"}],"expressions":[]}',
    '[{"fieldId":"600013","severity":"error","validationMessage":"Reaction end date cannot be before onset date."}]'),

-- ── Reaction outcome required ─────────────────────────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_OUTCOME_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600026', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600026","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"600026","severity":"warning","validationMessage":"Reaction outcome is required for E2B reporting."}]'),

-- ── Reaction seriousness required when case is serious ────────
-- Mixed: 500021 (root) + 600043 (eventReactions$) → contextPath = eventReactions$
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_SERIOUSNESS_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600043', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500021","operator":"eq","rhsValue":"Y"},{"lhsFieldId":"600043","operator":"eq","rhsValue":""}],"expressions":[]}',
    '[{"fieldId":"600043","severity":"warning","validationMessage":"Reaction seriousness should be set when the case is marked serious."}]'),

-- ── At least one reaction required (COUNT on collection) ──────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_MIN_ONE_REACTION_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600029', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFunction":"COUNT","lhsFieldId":"600029","operator":"eq","rhsValue":"0"}],"expressions":[]}',
    '[{"fieldId":"600029","severity":"error","validationMessage":"At least one adverse reaction must be recorded."}]'),

-- ── Reaction term minimum length (LENGTH check) ───────────────
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_REACTION_TERM_MIN_LENGTH',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '600029', 'eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600029","operator":"neq","rhsValue":""},{"lhsFunction":"LENGTH","lhsFieldId":"600029","operator":"lt","rhsValue":"3"}],"expressions":[]}',
    '[{"fieldId":"600029","severity":"warning","validationMessage":"Reaction term appears too short — please verify the reported term."}]'),

-- ── At least one suspect drug required (COUNT on collection) ──
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_VAL_MIN_ONE_DRUG_REQUIRED',
    'PUBLISHED', 'Y', 'Y', 'VALIDATION', '610052', 'drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFunction":"COUNT","lhsFieldId":"610052","operator":"eq","rhsValue":"0"}],"expressions":[]}',
    '[{"fieldId":"610052","severity":"warning","validationMessage":"At least one drug product should be recorded for a valid ICSR."}]')

ON CONFLICT (MODULE_ID, RULE_ID) DO NOTHING;
