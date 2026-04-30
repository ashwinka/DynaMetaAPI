-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_ICSR_CASES.sql
-- Module  : ICSR
-- Table   : ICSR_CASES (tableId: 500) — Case Header
-- Purpose : DDL for ICSR case header table
--           Fields ordered by ICH E2B weight:
--           Tier 1 — Core E2B R2(A.1)/R3(C.1) mandatory
--           Tier 2 — Seriousness criteria
--           Tier 3 — Case management / workflow
--           Tier 4 — Organisation / assignment
--           Tier 5 — Coding flags (system)
--           Tier 6 — Admin / workflow (non-E2B)
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS ICSR_CASES (
    ID                                          VARCHAR(36)     NOT NULL PRIMARY KEY,

    -- ── Tier 1: Core E2B R2(A.1) / R3(C.1) ─────────────────
    -- R2: A.1.0.1 / R3: C.1.1
    SAFETY_REPORT_ID                            VARCHAR(50),
    -- R2: A.1.0.2 / R3: C.1.2
    SAFETY_REPORT_VERSION                       VARCHAR(10),
    -- R2: A.1.1 / R3: C.1.3
    AUTHORITY_NUMB                              VARCHAR(50),
    -- R2: A.1.2 / R3: C.1.4 — codelist: ICSR_INITIAL_SENDER
    INITIAL_SENDER                              VARCHAR(50),
    -- R2: A.1.3 / R3: C.1.5
    PRIMARY_SRC_COUNTRY                         VARCHAR(50),
    -- R2: A.1.4 / R3: C.1.6
    OCCUR_COUNTRY                               VARCHAR(50),
    -- R2: A.1.5 / R3: C.1.7 — date first received from source
    RECEIVE_DATE                                DATE,
    -- R2: A.1.6 / R3: C.1.8 — most recent info date
    RECEIPT_DATE                                DATE,
    -- R3: C.1.8.1 — regulatory clock start date
    REGULATORY_START_DATE                       DATE,
    REGULATORY_CLOCK_COMMENT                    VARCHAR(300),
    -- R2: A.1.7 / R3: C.1.3 — codelist: ICSR_REPORT_TYPE
    REPORT_TYPE                                 VARCHAR(50),
    -- R2: A.1.8 / R3: C.1.9 — locally expedited
    FULFILL_EXPEDITE_CRITERIA                   CHAR(1),
    -- R2: A.1.9 / R3: C.1.10
    MEDICALLY_CONFIRMED                           CHAR(1),
    -- R2: A.1.10 / R3: C.1.11
    ADDITIONAL_DOC                              CHAR(1),
    -- R2: A.1.11 / R3: C.1.12 — codelist: ICSR_NULLIFICATION
    CASE_NULLIFICATION                          VARCHAR(50),
    NULLIFICATION_REASON                        VARCHAR(50),
    -- R3: C.1.13 — other safety reference
    OTHER_SAFETY_REF                            VARCHAR(300),
    OTHER_SAFETY_REF_VER                        VARCHAR(300),

    -- ── Tier 2: Seriousness Criteria ────────────────────────
    -- R2: A.1.12 / R3: E.i.3.1-3.7
    SERIOUSNESS_AS_PER_COMPANY                  CHAR(1),
    DEATH                                       CHAR(1),
    LIFE_THREATENING                             CHAR(1),
    HOSPITALIZATION                             CHAR(1),
    DISABLING                                   CHAR(1),
    CONGENITAL_ANOMALY                          CHAR(1),
    OTHER_SERIOUS                               CHAR(1),
    REQUIRED_INTERVENTION                       CHAR(1),

    -- ── Tier 3: Case Management / Workflow ──────────────────
    AER_NO                                      VARCHAR(300),
    AER_VERSION_NO                              VARCHAR(300),
    RECEIPT_NO                                  VARCHAR(300),
    -- codelist: ICSR_LOCAL_CRITERIA
    CASE_PRIORITY                               VARCHAR(50),
    -- codelist: ICSR_PRIORITY
    PRIORITY                                    VARCHAR(50),
    -- codelist: ICSR_REPORT_CATEGORY
    REPORT_CLASSIFICATION                       VARCHAR(50),
    -- codelist: ICSR_REPORT_CLASSIFICATION
    REPORT_CLASSIFICATION_CATEGORY              VARCHAR(50),
    -- codelist: ICSR_SAFETY_REPORT_TYPE
    SAFETY_REPORT_TYPE                          VARCHAR(50),
    -- codelist: ICSR_SAFETY_CLASSIFICATION
    SAFETY_CLASSIFICATION                       VARCHAR(50),
    -- codelist: ICSR_CASE_TYPE
    CASE_TYPE                                   VARCHAR(50),
    -- codelist: ICSR_INITIAL_FOLLOWUP
    INITIAL_OR_FOLLOWUP                         VARCHAR(50),
    -- codelist: ICSR_FLAG
    ICSR_FLAG                                   VARCHAR(50),
    SUSAR                                       CHAR(1),
    IS_CASE_AESI                                CHAR(1),
    BATCH_UNBLINDING                            CHAR(1),
    -- codelist: ICSR_CASE_SIGNIFICANCE
    CASE_VERSION_SIGNIFICANCE                   VARCHAR(50),
    AER_APPROVAL_STATUS                         VARCHAR(50),
    AER_APPROVAL_DATE                           DATE,
    INITIAL_CASE_APPROVAL_DATE                  DATE,
    CASE_DUE_DATE                               DATE,
    SUBMISSION_DUE_DATE                         VARCHAR(50),
    COMPANY_INITIAL_RECEIVED_DATE               DATE,
    COMPANY_RECEIVED_DATE                       DATE,
    FOLLOW_UP                                   CHAR(1),
    FOLLOW_UP_STATEMENT                         VARCHAR(300),
    FOLLOW_UP_STATEMENT_WITH_DATA               VARCHAR(1000),
    FOLLOW_UP_NOTIFICATION_STATUS               CHAR(1),
    FOLLOW_UP_NOTIFY_FLAG                       CHAR(1),
    FOLLOW_UP_REF                               VARCHAR(300),

    -- ── Tier 4: Organisation / Assignment ───────────────────
    REPORTED_SENDER                             VARCHAR(300),
    ACCOUNT_NAME                                VARCHAR(300),
    COMPANY_UNIT                                VARCHAR(300),
    PROCESSING_UNIT                             VARCHAR(300),
    ASSIGNED_TO_NAME                            VARCHAR(300),
    CASE_OWNER_NAME                             VARCHAR(300),
    ASSESSOR                                    VARCHAR(300),
    SAFETY_MANAGER                              VARCHAR(300),
    SAFETY_MANAGER_APPROVAL_DATE                DATE,
    -- codelist: ICSR_RECEIVE_MEDIUM
    MEDIUM_CODE                                 VARCHAR(50),
    -- codelist: ICSR_RECEIVE_FORMAT
    SOURCE_AE_FORM_TYPE                         VARCHAR(50),
    LRN                                         VARCHAR(300),
    MAPPED_AER_NO                               VARCHAR(300),
    MAH_IDENTIFICATION                          VARCHAR(300),

    -- ── Tier 5: Coding Flags (system) ───────────────────────
    DRUG_CODED_FLAG                             CHAR(1),
    EVENT_CODED_FLAG                            CHAR(1),
    DRUG_INDICATION_CODED                       CHAR(1),
    PARTIAL_CODED_FLAG                          CHAR(1),
    COMPLETION_FLAG                             CHAR(1),
    LATEST_AER                                  CHAR(1),
    LATEST_APPROVED                             CHAR(1),

    -- ── Tier 6: Admin / Non-E2B ─────────────────────────────
    -- codelist: ICSR_NON_CASE_REASON
    NON_CASE_REASON                             VARCHAR(50),
    NON_CASE_REASON_COMMENTS                    VARCHAR(50),
    PUBLISH_REPORT_REASON                       VARCHAR(300),
    -- codelist: ICSR_REMOVE_REASON
    REMOVE_REASON_CODE                          VARCHAR(50),
    REMOVE_REASON_COMMENT                       VARCHAR(300),
    -- codelist: ICSR_CLASSIFICATION_TYPE
    CLASSIFICATION_TYPE_CODE                    VARCHAR(50),
    -- codelist: ICSR_LATENESS_REASON
    OVERALL_LATENESS_REASON                     VARCHAR(50),
    LATENESS_COMMENTS                           VARCHAR(300),
    -- codelist: ICSR_INBOUND_LATENESS
    INBOUND_LATENESS_REASON                     VARCHAR(50),
    -- codelist: ICSR_CORRECTIVE_ACTION
    CORRECTIVE_ACTION_CATEGORY                  VARCHAR(50),
    STOPPED_OUT_WF                              VARCHAR(50),
    STOPPED_WF_TASKS                            VARCHAR(50),
    ARCHIVED_DATE                               DATE,
    CASE_MIGRATED_FROM                          VARCHAR(300),
    CASE_QUALITY_SCORE                          VARCHAR(300),
    CUSTOM_FORM_NAME                            VARCHAR(300),
    AER_CLOSE_DATE                              DATE,
    COMPOUND_OUTSOURCING_503B                   VARCHAR(50),
    COMBINATION_PRODUCT_REPORT                  CHAR(1),
    EXEMPTION_NUMBER                            VARCHAR(300),
    FORM_CODE                                   VARCHAR(300),
    FOLLOW_UP_STATEMENT_CHANGE_NARRATIVE        VARCHAR(1000),
    -- codelist: ICSR_LINKED_REASON (multi-context field stored here as JSON)
    LINKED_REASON                               VARCHAR(50),
    -- codelist: ICSR_DEVICE_LABELING
    DEVICE_PROBLEM_LABELING                     VARCHAR(50),
    -- codelist: ICSR_DEVICE_OUTCOME
    DEVICE_PROBLEM_REPORT_OUTCOME               VARCHAR(50),
    NO_PRODUCT                                  CHAR(1),
    NO_SUSPECT_PRODUCT                          CHAR(1),

    CREATED_AT                                  TIMESTAMP NOT NULL DEFAULT NOW(),
    UPDATED_AT                                  TIMESTAMP NOT NULL DEFAULT NOW()
);

-- ── ICSR_CASE_DOCUMENTS — caseDocuments$ (multi-context) ─────
-- R2: A.1.10 / R3: C.1.11 — Additional documents
CREATE TABLE IF NOT EXISTS ICSR_CASE_DOCUMENTS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    FILE_NAME               VARCHAR(300)    NOT NULL,                       -- R3: C.1.11.1
    IS_DOCUMENT_INCLUDED    VARCHAR(50),                                    -- R3: C.1.11.2 codelist: ICSR_DOC_INCLUDED
    FILE_S3_PATH            VARCHAR(300),                                   -- internal storage path
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_REPORTER_INFORMATIONS — reporterInformations$ (multi-context) ─
-- R2: A.2 / R3: C.2.r — Primary source / reporter information
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_REPORTER_INFORMATIONS (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    -- Tier 1: Core E2B R2(A.2) / R3(C.2.r)
    PRIMARY_REPORTER                CHAR(1),                                -- R2:A.2.1 / R3:C.2.r.1
    E2B_R3_REGULATORY_PURPOSE       CHAR(1),                                -- R3:C.2.r.1 only
    DO_NOT_REPORT_NAME                 CHAR(1),                                -- R2:A.2.1.1 / R3:C.2.r.1.1
    REPORTER_TYPE                   VARCHAR(50),                            -- R2:A.2.1.2 / R3:C.2.r.4 codelist: ICSR_REPORTER_QUALIFICATION
    REPORTER_SENT_TO_FDA            VARCHAR(50),                            -- R2:A.2.1.3 codelist: ICSR_REPORTER_INFORMED_AUTH
    -- Tier 2: Reporter identity
    REPORTER_TITLE                   VARCHAR(50),                            -- R2:A.2.1.4 / R3:C.2.r.2.1 codelist: ICSR_REPORTER_TITLE
    REPORTER_GIVEN_NAME               VARCHAR(50),                            -- R2:A.2.1.5 / R3:C.2.r.2.2
    REPORTER_MIDDLE_NAME              VARCHAR(50),
    REPORTER_FAMILY_NAME              VARCHAR(50),                            -- R2:A.2.1.6 / R3:C.2.r.2.3
    REPORTER_OR_CONTACT             VARCHAR(50),                            -- codelist: ICSR_PERSON_TYPE
    CONSENT_CONTACT                 CHAR(1),
    FOLLOW_UP                       CHAR(1),
    -- Tier 3: Professional details
    IS_HEALTH_PROFESSIONAL                  CHAR(1),                                -- R2:A.2.1.2a
    OCCUPATION                      VARCHAR(50),                            -- codelist: ICSR_REPORTER_OCCUPATION
    SPECIALTY                       VARCHAR(50),                            -- R2:A.2.1.2b codelist: ICSR_REPORTER_SPECIALITY
    HCP_CLASSIFICATION_KR           VARCHAR(50),                            -- codelist: ICSR_HCP_CLASSIFICATION
    OTHERHCP_KR                     VARCHAR(50),                            -- codelist: ICSR_OTHER_HCP
    REPORTER_ORGANIZATION            VARCHAR(50),                            -- R2:A.2.1.7 / R3:C.2.r.2.4
    REPORTER_DEPARTMENT             VARCHAR(50),                            -- lookup: DEPARTMENTS
    PHYSICIAN_CODE                  VARCHAR(300),
    PRIMARY_SRC_LIT_REF         VARCHAR(300),                           -- R2:A.2.1.8
    -- Tier 4: Contact / address
    REPORTER_STREET                  VARCHAR(50),                            -- R2:A.2.1.9 / R3:C.2.r.3.1
    STREET_ADDRESS                  VARCHAR(50),
    PO_BOX                          VARCHAR(50),
    REPORTER_CITY                    VARCHAR(50),                            -- R2:A.2.1.10 / R3:C.2.r.3.2
    REPORTER_STATE                   VARCHAR(50),                            -- R2:A.2.1.11 / R3:C.2.r.3.3
    REPORTER_POSTCODE                VARCHAR(50),                            -- R2:A.2.1.12 / R3:C.2.r.3.4
    REPORTER_COUNTRY                 VARCHAR(50),                            -- R2:A.2.1.13 / R3:C.2.r.3.5 codelist: COUNTRY
    PHONE                           VARCHAR(50),                            -- R2:A.2.1.14 / R3:C.2.r.3.6
    TELEPHONE                       VARCHAR(50),
    FAX                             VARCHAR(300),                           -- R2:A.2.1.15 / R3:C.2.r.3.7
    EMAIL                           VARCHAR(300),                           -- R2:A.2.1.16 / R3:C.2.r.3.8
    REPORTER_COUNTRY_PRACTICE       VARCHAR(50),                            -- R3:C.2.r.3.9 codelist: COUNTRY (country of practice, may differ from address)
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_SOURCE_INFORMATIONS — sourceInformations$ (multi-context) ─
-- R2: A.1 / R3: C.1 — Source / reference tracking
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_SOURCE_INFORMATIONS (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PRIMARY_SOURCE_FLAG         CHAR(1),                                    -- R2:A.1 primary source indicator
    SOURCE                      VARCHAR(50),                                -- codelist: ICSR_SOURCE_TYPE
    DATE_RECEIVED               DATE,                                       -- R2:A.1.5 / R3:C.1.7
    ORIGINATING_ACCOUNT         VARCHAR(300),                               -- lookup: ACCOUNTS
    IDENTIFICATION_NUMBER       VARCHAR(300),                               -- source reference number
    REFERENCE_TYPE              VARCHAR(50),                                -- codelist: ICSR_SOURCE_REF_TYPE
    SOURCE_AER_NUMBER           VARCHAR(300),                               -- source AER version
    FOLLOW_UP                   CHAR(1),
    DESCRIPTION                 VARCHAR(300),
    SENDER_ORGANISATION_TYPE    VARCHAR(50),                                -- R3:C.1.6.1 codelist: ICSR_SENDER_ORG_TYPE
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PATIENT — patient (1:1 child) ───────────────────────
-- R2: B.1 / R3: D — Patient characteristics
-- FK: CASE_ID → ICSR_CASES(ID)
-- CN-specific fields excluded.
CREATE TABLE IF NOT EXISTS ICSR_PATIENT (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL UNIQUE REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    -- Tier 1: Core R2(B.1)/R3(D)
    PATIENT_INITIAL                 VARCHAR(50),                            -- R2:B.1.1 / R3:D.1
    DO_NOT_REPORT_NAME              CHAR(1),                                -- R2:B.1.1.1 / R3:D.1.1
    PATIENT_IDENTIFIABLE            CHAR(1),
    PAT_SEX                         VARCHAR(50),                            -- R2:B.1.2 / R3:D.5 codelist: SEX
    GENDER                          VARCHAR(50),                            -- R3:D.5.1 codelist: ICSR_PAT_GENDER
    GENDER_OTHER                    VARCHAR(50),
    PAT_DOB                         VARCHAR(50),                            -- R2:B.1.3 / R3:D.2.1
    PAT_ONSET_AGE                   VARCHAR(300),                           -- R2:B.1.4 / R3:D.2.2a
    PAT_ONSET_AGE_UNIT              VARCHAR(50),                            -- R2:B.1.4 / R3:D.2.2b codelist: ICSR_AGE_UNIT
    PAT_AGE_GROUP                   VARCHAR(50),                            -- R2:B.1.5 / R3:D.2.3 codelist: ICSR_AGE_GROUP
    PATIENT_AGE_IN_YEARS            VARCHAR(300),                           -- calculated
    -- Tier 2: Demographics
    TITLE                           VARCHAR(50),                            -- codelist: CONTACT_TITLE
    PATIENT_FIRST_NAME              VARCHAR(300),
    MIDDLE_NAME                     VARCHAR(300),
    PATIENT_LAST_NAME               VARCHAR(300),
    SELECTED_RACE_IDS               VARCHAR(50),                            -- R3:D.7 codelist: ICSR_PAT_RACE
    ETHNIC_ORIGIN                   VARCHAR(50),                            -- R3:D.8 codelist: ICSR_PAT_ETHNICITY
    CONSENT_TO_CONTACT              VARCHAR(50),                            -- codelist: ICSR_CONSENT
    FOLLOW_UP                       CHAR(1),
    PATIENT_MILITARY_STATUS         VARCHAR(50),                            -- codelist: ICSR_MILITARY_STATUS
    -- Tier 3: Physical
    PAT_WEIGHT                      VARCHAR(300),                           -- R2:B.1.6 / R3:D.3
    PAT_WEIGHT_UNIT                 VARCHAR(50),                            -- codelist: ICSR_WEIGHT_UNIT
    PAT_HEIGHT                      VARCHAR(300),                           -- R2:B.1.7 / R3:D.4
    PAT_HEIGHT_UNIT                 VARCHAR(50),                            -- codelist: ICSR_HEIGHT_UNIT
    BIRTH_WEIGHT                    VARCHAR(300),
    BIRTH_WEIGHT_UNIT               VARCHAR(50),                            -- codelist: ICSR_WEIGHT_UNIT
    BODY_MASS_INDEX                 VARCHAR(300),
    BODY_SURFACE_INDEX              VARCHAR(300),
    PAT_LAST_MENSTRUAL_DATE         VARCHAR(50),                            -- R2:B.1.8 / R3:D.6
    PAT_PREGNANT                    VARCHAR(50),                            -- R2:B.1.9 / R3:D.9 codelist: YES_NO
    GESTATION_PERIOD                VARCHAR(300),                           -- R2:B.1.10 / R3:D.10
    GESTATION_PERIOD_UNIT           VARCHAR(50),                            -- codelist: ICSR_GESTATION_UNIT
    -- Tier 4: Medical background
    PAT_MEDICAL_HISTORY_TEXT        VARCHAR(1000),                          -- R2:B.1.11 / R3:D.7.1
    RESULTS_TESTS_PROCEDURES        VARCHAR(1000),                          -- R2:B.1.12 / R3:D.7.2
    HAS_CONCOMITANT_THERAPIES       CHAR(1),
    HEALTH_DAMAGE_TYPE              VARCHAR(50),                            -- codelist: YES_NO
    -- Tier 5: Death / Autopsy
    PAT_DEATH_DATE                  VARCHAR(50),                            -- R2:B.1.13 / R3:D.11
    PAT_AUTOPSY_YES_NO              CHAR(1),                                -- R2:B.1.14 / R3:D.12
    PAT_AUTOPSY_DATE                VARCHAR(50),
    -- Tier 6: Contact / Address
    ADDRESS1                        VARCHAR(300),
    ADDRESS2                        VARCHAR(300),
    CITY                            VARCHAR(300),
    STATE                           VARCHAR(300),
    POSTAL_CODE                     VARCHAR(300),
    COUNTRY                         VARCHAR(50),                            -- codelist: COUNTRY
    COUNTY                          VARCHAR(300),
    PHONE_NUMBER                    VARCHAR(300),
    EMAIL                           VARCHAR(300),
    -- Tier 7: Record numbers
    PAT_HOSPITAL_RECORD_NUMB        VARCHAR(50),                            -- R2:B.1.1.2
    PAT_MEDICAL_RECORD_NUMB         VARCHAR(50),
    PAT_SPECIALIST_RECORD_NUMB      VARCHAR(50),
    PAT_INVESTIGATION_NUMB          VARCHAR(50),
    REGISTRATION_NO                 VARCHAR(300),
    -- Tier 8: Vaccine-specific
    VAC_AGE                         VARCHAR(300),
    VAC_AGE_UNIT                    VARCHAR(50),                            -- codelist: ICSR_AGE_UNIT
    VAC_ILLNESS                     VARCHAR(300),
    VAC_MEDDRA_PT_CODE              VARCHAR(300),
    VAC_MEDDRA_LLT_CODE             VARCHAR(300),
    VAC_PREGNANT                    CHAR(1),
    -- Tier 9: Biological father (R3:D.9)
    PARTNER_NAME                    VARCHAR(50),
    PARTNER_DOB                     VARCHAR(50),
    BIOLOGICAL_FATHER_AGE           VARCHAR(300),
    BIOLOGICAL_FATHER_AGE_UNIT      VARCHAR(50),                            -- codelist: ICSR_AGE_UNIT
    BIO_FATHER_CONTACT              VARCHAR(50),
    -- Tier 10: Admin
    EVENT_DATE                      DATE,
    USER_NOT_INTENDED_RECIPIENT     CHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PATIENT_SUMMARY — patient.summary (1:1 child) ───────
-- R2: H / R3: H — Case narrative and comments
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PATIENT_SUMMARY (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL UNIQUE REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    -- Tier 1: Core R2(H)/R3(H)
    COMPANY_NARRATIVE               TEXT,                                   -- R2:H.1 / R3:H.1
    REPORTERCOMMENT                 TEXT,                                   -- R2:H.2 / R3:H.2
    SENDERCOMMENT                   TEXT,                                   -- R2:H.3 / R3:H.3
    SUMMARY_DESCRIPTION             TEXT,                                   -- R3:H.4
    -- Tier 2: Medical assessment
    EVALUATION_COMMENTS             TEXT,                                   -- R2:H.4
    EVALUATION_SUMMARY              TEXT,
    ADDITIONAL_INFORMATION          VARCHAR(300),
    ADDTIONAL_COMMENTS              VARCHAR(300),
    WHAT_FURTHER_INVESTIGATIONS     VARCHAR(300),
    -- Tier 3: Clinical narrative
    PATIENT_DURING_EVENT_DESC       VARCHAR(300),
    TREATMENT_FOLLOWING_EVENT       VARCHAR(300),
    MANUFACTURER_NARRATIVE          VARCHAR(300),
    ADD_MANUFACTURER_NARRATIVE      VARCHAR(300),
    -- Tier 4: Device / corrective actions
    CORRECTIVE_ACTIONS              VARCHAR(300),
    CORRECTIVE_PREVN_NARRATIVE      VARCHAR(300),
    IDENTIFIED_ACTON_NARRATIVE      VARCHAR(300),
    CORRECTED_DATA                  VARCHAR(300),
    PRODUCT_COMPLAINT_DETAILS       VARCHAR(300),
    VALUE                           VARCHAR(300),                           -- initialManufactureAnalysis
    -- Tier 5: Admin
    FOLLOW_UP                       CHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PATIENT_MEDICAL_HISTORIES — patientMedicalHistory$ (multi-context) ─
-- R2: B.1.7 / R3: D.7.r — Patient medical history episodes
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PATIENT_MEDICAL_HISTORIES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    -- Tier 1: Core R2(B.1.7)/R3(D.7.r)
    MEDICAL_EPISODE_NAME          VARCHAR(50),                                -- R2:B.1.7.1a / R3:D.7.r.1a verbatim
    MEDICAL_EPISODE_LLT_CODE         VARCHAR(50),                                -- R2:B.1.7.1b / R3:D.7.r.1b MedDRA LLT
    MEDICAL_EPISODE_PT_CODE            VARCHAR(300),                               -- R3:D.7.r.1c MedDRA PT
    MEDICAL_START_DATE            VARCHAR(50),                                -- R2:B.1.7.2 / R3:D.7.r.2
    MEDICAL_END_DATE              VARCHAR(50),                                -- R2:B.1.7.3 / R3:D.7.r.3
    MEDICAL_CONTINUE             CHAR(1),                                    -- R2:B.1.7.4 / R3:D.7.r.4
    -- Tier 2: Classification
    DISEASE_TYPE                VARCHAR(50),                                -- codelist: ICSR_MED_HIST_TYPE
    CONDITION_TREATED           CHAR(1),
    IS_FAMILY_HISTORY           CHAR(1),                                    -- R3:D.7.r.5 only
    ILLNESS_AT_VACCINE      VARCHAR(300),
    -- Tier 3: Duration
    DURATION                    VARCHAR(300),
    DURATION_UNIT               VARCHAR(50),                                -- codelist: ICSR_DURATION_UNIT
    -- Tier 4: Coding / Admin
    CODING_TYPE                 VARCHAR(50),                                -- codelist: ICSR_CODING_TYPE
    CONCOMITANT_THERAPIES       CHAR(1),
    MEDICAL_COMMENT              VARCHAR(1000),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PATIENT_PAST_DRUG_THERAPIES — patientPastDrugTherapies$ (multi-context) ─
-- R2: B.1.8 / R3: D.8.r — Patient past drug therapy
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PATIENT_PAST_DRUG_THERAPIES (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    -- Tier 1: Core product identification
    DRUG_NAME                        VARCHAR(300),                           -- R2:B.1.8.1 / R3:D.8.r.1
    PRODUCT_NAMEAS_REPORTED         VARCHAR(300),
    INVENTED_NAME                   VARCHAR(50),
    TRADEMARK_NAME                  VARCHAR(50),
    SCIENTIFIC_NAME                 VARCHAR(50),
    WHODD_CODE                      VARCHAR(300),
    WHODD_MPID                      VARCHAR(300),
    KDD_CODE                        VARCHAR(300),
    -- Tier 2: MedDRA coding + product IDs
    DRUG_INDICATION                  VARCHAR(50),                            -- R2:B.1.8.2 / R3:D.8.r.2
    DRUG_INDICATION_LLT_CODE             VARCHAR(300),                           -- R2:B.1.8.2a / R3:D.8.r.2a LLT
    DRUG_INDICATION_PT_CODE           VARCHAR(300),                           -- R3:D.8.r.2b PT
    DRUG_REACTION                    VARCHAR(50),                            -- R2:B.1.8.3 / R3:D.8.r.3
    DRUG_REACTION_LLT_CODE               VARCHAR(300),                           -- R2:B.1.8.3a / R3:D.8.r.3a LLT
    DRUG_REACTION_PT_CODE             VARCHAR(300),                           -- R3:D.8.r.3b PT
    E2B_R3_MED_PRODID               VARCHAR(50),                            -- R3:D.8.r.7.1 MPID
    E2B_R3_MEDPRODID_DATENUMBER     VARCHAR(50),                            -- R3:D.8.r.7.2
    E2B_R3_PHARMA_PRODID            VARCHAR(50),                            -- R3:D.8.r.8.1 PhPID
    E2B_R3_PHARMAPRODID_DATENUMBER  VARCHAR(50),                            -- R3:D.8.r.8.2
    MED_PRODUCT_ID                  VARCHAR(300),
    -- Tier 3: Dates + vaccine
    DRUG_START_DATE                   VARCHAR(50),                            -- R2:B.1.8.4 / R3:D.8.r.4
    DRUG_END_DATE                     VARCHAR(50),                            -- R2:B.1.8.5 / R3:D.8.r.5
    VAC_AGE          VARCHAR(300),
    VAC_AGE_UNIT     VARCHAR(50),                            -- codelist: ICSR_AGE_UNIT
    -- Tier 4: Additional product details
    FORM_NAME                       VARCHAR(50),
    STRENGTH_NAME                   VARCHAR(50),
    CONTAINER_NAME                  VARCHAR(50),
    DEVICE_NAME                     VARCHAR(50),
    INTENDED_USE_NAME               VARCHAR(50),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PAST_DRUG_SUBSTANCES — patientPastDrugSubstanceCollection$ (second-level multi-context) ─
-- R3: D.8.r.6 — Substance / specified substance
-- FK: PAST_DRUG_ID → ICSR_PATIENT_PAST_DRUG_THERAPIES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PAST_DRUG_SUBSTANCES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    PAST_DRUG_ID                VARCHAR(36)     NOT NULL REFERENCES ICSR_PATIENT_PAST_DRUG_THERAPIES(ID) ON DELETE CASCADE,
    SUBSTANCE_NAME              VARCHAR(300),                               -- R3:D.8.r.6.1
    SUBSTANCE_TERMID            VARCHAR(300),                               -- R3:D.8.r.6.2
    SUBSTANCE_TERMID_VERSION    VARCHAR(300),                               -- R3:D.8.r.6.3
    SUBSTANCE_STRENGTH_NUMBER   VARCHAR(300),                               -- R3:D.8.r.6.4
    SUBSTANCE_STRENGTH_UNIT     VARCHAR(50),                                -- R3:D.8.r.6.5 codelist: ICSR_SUBSTANCE_STRENGTH_UNIT
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PREGNANCY — patient.pregnancy (1:1 child) ───────────
-- R2: B.1.9 / R3: D.9 — Pregnancy information
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PREGNANCY (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL UNIQUE REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    EXPOSURE_STATUS             VARCHAR(50),                                -- codelist: ICSR_PREGNANCY_TYPE (prospective/retrospective)
    TRIMESTER_OF_EXPOSURE       VARCHAR(50),                                -- codelist: ICSR_TRIMESTER
    PREGNANCY_CONFIRM_DATE      VARCHAR(50),
    PREGNANCY_CONFIRM_MODE      VARCHAR(50),                                -- codelist: ICSR_PREGNANCY_CONFIRM_MODE
    EXPECTED_DUE_DATE           DATE,
    GRAVIDITY                   VARCHAR(50),
    PARA                        VARCHAR(300),
    PLANNED_PREGNANCY           CHAR(1),
    CONTRACEPTIVES_USED         CHAR(1),
    CONTRACEPTIVE_FAILURE       CHAR(1),
    TYPES_OF_CONTRACEPTIVE_USED VARCHAR(50),
    PRE_PREGNANCY_WEIGHT        VARCHAR(300),
    PRE_PREGNANCY_WEIGHT_UNIT   VARCHAR(50),                                -- reuse ICSR_WEIGHT_UNIT
    DELIVERY_METHOD             VARCHAR(50),                                -- codelist: ICSR_DELIVERY_METHOD
    FAMILY_HISTORY_BIRTH_DEFECTS CHAR(1),
    FOLLOW_UP                   CHAR(1),
    COMMENTS                    VARCHAR(50),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PREGNANCY_OUTCOMES — pregnancyOutcomes$ (first-level multi-context) ─
-- FK: CASE_ID → ICSR_CASES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PREGNANCY_OUTCOMES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PREGNANCY_OUTCOME_DATE      VARCHAR(50),
    PREGNANCY_END_DATE          DATE,
    PREGNANCY_CLINICAL_STATUS   VARCHAR(50),                                -- codelist: ICSR_PREGNANCY_OUTCOME
    METHOD_OF_DELIVERY          VARCHAR(50),                                -- codelist: ICSR_DELIVERY_METHOD
    NO_OF_FOETUS                VARCHAR(300),
    LIVE_BIRTH_COMPLICATIONS    VARCHAR(50),                                -- codelist: ICSR_LIVE_BIRTH_COMPLICATIONS
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_PREV_PREGNANCY_OUTCOMES — previousPregnancyOutcomes$ (second-level) ─
-- FK: OUTCOME_ID → ICSR_PREGNANCY_OUTCOMES(ID)
CREATE TABLE IF NOT EXISTS ICSR_PREV_PREGNANCY_OUTCOMES (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    OUTCOME_ID                      VARCHAR(36)     NOT NULL REFERENCES ICSR_PREGNANCY_OUTCOMES(ID) ON DELETE CASCADE,
    PAST_PREGNANCY_OUTCOME          VARCHAR(50),                            -- codelist: ICSR_PREGNANCY_OUTCOME
    PAST_PREGNANCY_OUTCOME_DETAILS  VARCHAR(50),
    NO_OF_CHILDREN                  VARCHAR(300),
    NUMBER_OF_ABORTIONS             VARCHAR(300),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_NEONATES — neonates$ (second-level multi-context) ───
-- FK: OUTCOME_ID → ICSR_PREGNANCY_OUTCOMES(ID)
CREATE TABLE IF NOT EXISTS ICSR_NEONATES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    OUTCOME_ID                  VARCHAR(36)     NOT NULL REFERENCES ICSR_PREGNANCY_OUTCOMES(ID) ON DELETE CASCADE,
    BIRTH_OUTCOME               VARCHAR(50),                                -- codelist: ICSR_BIRTH_OUTCOME
    CHILD_SEX                   VARCHAR(50),                                -- reuse SEX codelist
    WHICH_PREGNANCY             VARCHAR(50),                                -- codelist: ICSR_WHICH_PREGNANCY
    CURRENT_PREGNANCY           CHAR(1),
    GESTATIONAL_AGE_BIRTH       VARCHAR(300),
    GESTATIONAL_AGE_BIRTH_UNIT  VARCHAR(50),                                -- reuse ICSR_GESTATION_UNIT
    METHOD_OF_DELIVERY          VARCHAR(50),                                -- codelist: ICSR_DELIVERY_METHOD
    CONGENITAL_ANOMALY          CHAR(1),
    CONGENITAL_ANOMALY_TYPE     VARCHAR(50),                                -- codelist: ICSR_CONGENITAL_ANOMALY_TYPE
    APGAR_SCORE                 VARCHAR(300),
    APGAR_SCORE_5_MINUTE        VARCHAR(50),
    APGAR_SCORE_10_MINUTE       VARCHAR(50),
    NICU_ADMISSION              CHAR(1),
    ADMISSION_DURATION          VARCHAR(50),
    ADMISSION_DURATION_UNIT     VARCHAR(50),                                -- reuse ICSR_DURATION_UNIT
    RESUSCITATED                CHAR(1),
    OTHER_NEONATE_DETAILS       VARCHAR(300),
    OTHER_OUTCOME_DETAILS       VARCHAR(300),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ICSR_NEONATE_CHILDREN — childCollection$ (third-level multi-context) ─
-- FK: NEONATE_ID → ICSR_NEONATES(ID)
CREATE TABLE IF NOT EXISTS ICSR_NEONATE_CHILDREN (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    NEONATE_ID              VARCHAR(36)     NOT NULL REFERENCES ICSR_NEONATES(ID) ON DELETE CASCADE,
    CHILD_AGE               VARCHAR(300),
    CHILD_UNIT              VARCHAR(50),                                    -- reuse ICSR_GESTATION_UNIT
    HEAD_CIRCUM_BIRTH       VARCHAR(300),
    HEAD_CIRCUM_BIRTH_UNIT  VARCHAR(50),                                    -- reuse ICSR_HEIGHT_UNIT
    NEON_BIRTH_LEN          VARCHAR(300),
    NEON_BIRTH_LEN_UNIT     VARCHAR(50),                                    -- reuse ICSR_HEIGHT_UNIT
    NEON_WEIGHT             VARCHAR(300),
    NEON_WEIGHT_UNIT        VARCHAR(50),                                    -- reuse ICSR_WEIGHT_UNIT
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 560 — ICSR_DEATH_CAUSES
-- R2: B.1.9.1 / R3: D.9.1.r — Reported causes of death (multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DEATH_CAUSES (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PAT_DEATH_REPORT_LLT_CODE     VARCHAR(300),                                   -- R2:B.1.9.1 MedDRA LLT code
    PAT_DEATH_REPORT_PT_CODE   VARCHAR(300),                                   -- MedDRA PT code
    PAT_DEATH_REPORT          VARCHAR(50),                                    -- R2:B.1.9 free-text cause
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 561 — ICSR_PATIENT_AUTOPSIES
-- R2: B.1.9.2 / R3: D.9.2.r — Autopsy determined causes of death (multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PATIENT_AUTOPSIES (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PAT_DET_AUTOPSY           VARCHAR(50),                                    -- R2:B.1.9.2 free-text autopsy cause
    PAT_DET_AUTOPSY_LLT_CODE      VARCHAR(300),                                   -- MedDRA LLT code
    PAT_DET_AUTOPSY_PT_CODE    VARCHAR(300),                                   -- MedDRA PT code
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 565 — ICSR_PARENT
-- R2: B.1.15 / R3: D.10 — Parent information (1:1)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PARENT (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PARENT_IDENTIFICATION        VARCHAR(50),                                    -- R2:B.1.15 parent ID/initials
    PARENT_SEX                   VARCHAR(50),                                    -- R2:B.1.15.1 reuse SEX codelist
    PARENT_DOB                   DATE,                                           -- R2:B.1.15.2
    PARENT_AGE                   VARCHAR(300),                                   -- R2:B.1.15.3
    PARENT_AGE_UNIT               VARCHAR(50),                                    -- R2:B.1.15.3 reuse ICSR_AGE_UNIT
    PAR_ETHNIC_ORIGIN           VARCHAR(50),                                    -- reuse ICSR_PAT_ETHNICITY
    PARENT_LAST_MENS_DATE          DATE,                                           -- R2:B.1.15.4
    PARENT_WEIGHT                VARCHAR(300),                                   -- R2:B.1.15.5
    PARENT_WEIGHT_UNIT           VARCHAR(50),                                    -- R2:B.1.15.5 reuse ICSR_WEIGHT_UNIT
    PARENT_HEIGHT                VARCHAR(10),                                    -- R2:B.1.15.6
    PARENT_HEIGHT_UNIT           VARCHAR(50),                                    -- R2:B.1.15.6 reuse ICSR_HEIGHT_UNIT
    PARENT_MED_RELEVANT_TEXT     VARCHAR(1000),                                    -- R2:B.1.15.7 free text
    PARENT_VAC_AGE       VARCHAR(10),                                    -- vaccine-specific
    PARENT_VAC_AGE_UNIT  VARCHAR(50),                                    -- reuse ICSR_AGE_UNIT
    CONSENT_TO_CONTACT_PARENT   VARCHAR(50),                                    -- reuse ICSR_CONSENT
    FOLLOW_UP                   VARCHAR(1),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 570 — ICSR_PARENT_PAST_DRUG_THERAPIES
-- R2: B.1.15.8 / R3: D.10.8 — Parent past drug therapies (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PARENT_PAST_DRUG_THERAPIES (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    DRUG_NAME                        VARCHAR(300),                               -- R2:B.1.15.8.1 product name as reported
    PRODUCT_NAMEAS_REPORTED         VARCHAR(300),
    INVENTED_NAME                   VARCHAR(50),
    SCIENTIFIC_NAME                 VARCHAR(50),
    TRADEMARK_NAME                  VARCHAR(50),
    MED_PRODUCT_ID                  VARCHAR(300),
    E2B_R3_MED_PRODID               VARCHAR(50),                               -- R3 MPID
    E2B_R3_MEDPRODID_DATENUMBER     VARCHAR(50),
    E2B_R3_PHARMA_PRODID            VARCHAR(50),                               -- R3 PhPID
    E2B_R3_PHARMAPRODID_DATENUMBER  VARCHAR(50),
    WHODD_CODE                      VARCHAR(300),
    WHODD_MPID                      VARCHAR(300),
    KDD_CODE                        VARCHAR(300),
    DRUG_START_DATE                   VARCHAR(50),                                -- R2:B.1.15.8.2
    DRUG_END_DATE                     VARCHAR(50),                                -- R2:B.1.15.8.3
    DRUG_INDICATION                  VARCHAR(50),                                -- R2:B.1.15.8.4
    DRUG_INDICATION_LLT_CODE             VARCHAR(300),
    DRUG_INDICATION_PT_CODE           VARCHAR(300),
    DRUG_REACTION                    VARCHAR(50),                                -- R2:B.1.15.8.5
    DRUG_REACTION_LLT_CODE               VARCHAR(300),
    DRUG_REACTION_PT_CODE             VARCHAR(300),
    FORM_NAME                       VARCHAR(50),
    STRENGTH_NAME                   VARCHAR(50),
    CONTAINER_NAME                  VARCHAR(50),
    DEVICE_NAME                     VARCHAR(50),
    INTENDED_USE_NAME               VARCHAR(50),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 571 — ICSR_PARENT_PAST_DRUG_SUBSTANCES
-- R3: D.10.8 — Active substances for parent past drug therapies (second-level multi-context)
-- FK: THERAPY_ID → ICSR_PARENT_PAST_DRUG_THERAPIES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PARENT_PAST_DRUG_SUBSTANCES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    THERAPY_ID                  VARCHAR(36)     NOT NULL REFERENCES ICSR_PARENT_PAST_DRUG_THERAPIES(ID) ON DELETE CASCADE,
    SUBSTANCE_NAME              VARCHAR(300),                                   -- R3 substance name
    SUBSTANCE_TERMID            VARCHAR(300),                                   -- R3 substance TermID
    SUBSTANCE_TERMID_VERSION    VARCHAR(300),                                   -- R3 TermID version
    SUBSTANCE_STRENGTH_NUMBER   VARCHAR(300),                                   -- R3 strength number
    SUBSTANCE_STRENGTH_UNIT     VARCHAR(50),                                    -- reuse ICSR_SUBSTANCE_STRENGTH_UNIT
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 575 — ICSR_PARENT_MED_HISTORIES
-- R2: B.1.15.9 / R3: D.10.9 — Parent medical history episodes (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PARENT_MED_HISTORIES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    MEDICAL_EPISODE_NAME          VARCHAR(50),                                    -- R2:B.1.15.9.1 disease term
    MEDICALEPISODENAME_CODE     VARCHAR(300),                                   -- MedDRA LLT
    MEDICALEPISODENAME_PTCODE   VARCHAR(300),                                   -- MedDRA PT
    MEDICAL_START_DATE            VARCHAR(50),                                    -- R2:B.1.15.9.2
    MEDICAL_END_DATE              VARCHAR(50),
    MEDICAL_CONTINUE             VARCHAR(1),
    DISEASE_TYPE                VARCHAR(50),                                    -- reuse ICSR_MED_HIST_TYPE
    DURATION                    VARCHAR(300),
    DURATION_UNIT               VARCHAR(50),                                    -- reuse ICSR_DURATION_UNIT
    CODING_TYPE                 VARCHAR(50),                                    -- reuse ICSR_CODING_TYPE
    MEDICAL_COMMENT              VARCHAR(1000),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 580 — ICSR_STUDY
-- R2: C / R3: G — Study information (1:1)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_STUDY (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    PROTOCOL_NO                     VARCHAR(50),                                -- R2:C.5.1 sponsor study/protocol no
    STUDY_TITLE                     VARCHAR(300),                                -- R2:C.5.2 study name
    LSMV_STUDY_TITLE                VARCHAR(1000),                               -- full study title
    STUDY_ACRONYM                   VARCHAR(300),
    STUDY_LIBRARY_RECORD_ID         VARCHAR(300),
    STUDY_TYPE                      VARCHAR(50),                                -- reuse STUDY_TYPE
    STUDY_DESIGN                    VARCHAR(50),                                -- reuse STUDY_DESIGN
    STUDY_PHASE                     VARCHAR(50),                                -- reuse STUDY_PHASE
    BLINDING_TECHNIQUE              VARCHAR(50),                                -- reuse BLINDING_TECHNIQUE
    SUBJECT_ID                      VARCHAR(50),                                -- R2:C.5.7
    RANDOMIZATION_NUMBER            VARCHAR(50),                                -- R2:C.5.8
    ENROLMENT_DATE                  VARCHAR(50),
    ENROLMENT_STATUS                VARCHAR(50),                                -- ICSR_ENROLMENT_STATUS
    GLOBAL_STUDY_ENROLLMENT_COUNT   VARCHAR(10),
    WITHDRAWN_DATE                  VARCHAR(50),
    STUDY_COMPLETION_STATUS         VARCHAR(50),                                -- ICSR_STUDY_COMPLETION_STATUS
    STUDY_DISCONT_REASON_CODE       VARCHAR(50),                                -- ICSR_STUDY_DISCONT_REASON
    SITE_NUMBER                     VARCHAR(50),                                -- R2:C.5.9
    INVESTIGATOR_NO                 VARCHAR(300),
    INVESTIGATION_SITE              VARCHAR(50),
    INVESTIGATION_SITE_RECORD_ID    VARCHAR(50),
    EUDRACT_NO                      VARCHAR(300),
    PRIMARY_IND                     VARCHAR(300),
    REPORTED_PRIMARY_IND            VARCHAR(300),
    PANDA_NO                        VARCHAR(50),
    PROJECT_NO                      VARCHAR(300),
    STUDY_SERIAL_NUMBER             VARCHAR(300),
    CODE_BROKEN                     VARCHAR(50),                                -- reuse CODE_STATUS
    DATE_CODE_BROKEN                DATE,
    STUDY_CODE_BROKEN               VARCHAR(50),                                -- reuse CODE_STATUS
    UNBLINDED_INFORMATION           VARCHAR(1000),
    EUCT_REGULATION                 VARCHAR(1),
    CTD_TO_CTR_TRANSITION_DATE      DATE,
    STUDY_START_DATE                DATE,
    STUDY_END_DATE                  DATE,
    SAFETY_REPORTING_RESPONSIBILITY VARCHAR(50),                                -- ICSR_SAFETY_REPORTING
    MEDICAL_DEVICE_SAFETY_REPORTING VARCHAR(50),                                -- ICSR_SAFETY_REPORTING
    OTHER_STUDY                     VARCHAR(50),                                -- ICSR_OTHER_STUDY
    PROTOCOL_DETAILS                VARCHAR(1000),
    QUERY_CONTACT                   VARCHAR(1000),
    FOLLOW_UP                       VARCHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 582 — ICSR_STUDY_REGISTRATIONS
-- R2: C.5.10 / R3: G.k.10 — Study registrations per country (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_STUDY_REGISTRATIONS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    REG_NO                  VARCHAR(50),                                        -- R2:C.5.10.1 registration number
    COUNTRY                 VARCHAR(50),                                        -- R2:C.5.10.2 reuse COUNTRY
    STUDY_REGISTRATION_DATE DATE,
    NO_OF_PATIENTSENROLLED  VARCHAR(50),
    NO_OF_MEDICINALPRODUCT  VARCHAR(50),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 583 — ICSR_STUDY_CROSS_REF_INDS
-- R2: C.5.11 / R3: G.k.11 — Cross-referenced INDs (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_STUDY_CROSS_REF_INDS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    STUDY_CROSS_REF_IND     VARCHAR(300),                                       -- R2:C.5.11.1 IND number
    PARENT_IND              VARCHAR(50),                                        -- R2:C.5.11.2 reuse YES_NO
    REPORTED_SPSR_STUDY_NO  VARCHAR(300),
    STUDY_NAME              VARCHAR(300),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 600 — ICSR_EVENT_REACTIONS
-- R2: B.2 / R3: E — Event/Reaction (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_EVENT_REACTIONS (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    REACTION_TERM                    VARCHAR(50),                                -- R2:B.2.1 / R3:E.i.1
    REACT_MEDDRA_LLT_CODE             VARCHAR(300),                               -- R2:B.2.1a MedDRA LLT
    REACT_MEDDRA_PT_CODE              VARCHAR(50),                                -- R3:E.i.1b MedDRA PT
    TERM_HIGHLIGHTED                 VARCHAR(50),                                -- R2:B.2.2 ICSR_TERM_HIGHLIGHTED
    E2B_R3_PRIMARY_SOURCE_TRANSLN   VARCHAR(50),                                -- R3:E.i.1.2 native lang term
    PRIMARY_SRC_REACTION_LANG         VARCHAR(50),                                -- R3:E.i.1.2a ICSR_NATIVE_LANGUAGE
    REACT_START_DATE                  VARCHAR(50),                                -- R2:B.2.3 / R3:E.i.3
    REACT_END_DATE                    VARCHAR(50),                                -- R2:B.2.4 / R3:E.i.4
    REACT_DURATION                   VARCHAR(300),                               -- R2:B.2.5 / R3:E.i.5
    REACT_DURATION_UNIT               VARCHAR(50),                                -- ICSR_DURATION_UNIT
    REACT_FIRST_TIME                  VARCHAR(300),                               -- R3:E.i.6a start latency
    REACT_FIRST_TIME_UNIT              VARCHAR(50),                                -- ICSR_DURATION_UNIT
    REACT_LAST_TIME                   VARCHAR(300),                               -- R3:E.i.6b end latency
    REACT_LAST_TIME_UNIT               VARCHAR(50),                                -- ICSR_DURATION_UNIT
    REACT_OUTCOME                    VARCHAR(50),                                -- R2:B.2.7 ICSR_REACT_OUTCOME
    SEVERITY                        VARCHAR(50),                                -- ICSR_SEVERITY
    SERIOUSNESS                     VARCHAR(1),                                 -- R2:B.2.6
    DEATH                           VARCHAR(1),                                 -- R2:B.2.6.1
    LIFE_THREATENING                 VARCHAR(1),                                 -- R2:B.2.6.2
    HOSPITALIZATION                 VARCHAR(1),                                 -- R2:B.2.6.3
    DISABILITY                      VARCHAR(1),                                 -- R2:B.2.6.4
    CONGENITAL_ANOMALY               VARCHAR(1),                                 -- R2:B.2.6.5
    NON_SERIOUS                      VARCHAR(1),                                 -- R2:B.2.6.6
    NON_SERIOUS_INFO                 VARCHAR(300),
    INTERVENTION_REQUIRED            VARCHAR(1),
    HOSPITALISATION_DATE            VARCHAR(50),
    HOSPITAL_DISCHARGE_DATE         VARCHAR(50),
    EVENT_TYPE                      VARCHAR(50),                                -- ICSR_EVENT_TYPE
    CONDITION                       VARCHAR(50),                                -- ICSR_REACT_CONDITION
    CODING_TYPE                     VARCHAR(50),                                -- ICSR_CODING_TYPE
    RANK_ORDER                      VARCHAR(300),
    IS_SERIOUS_EVENT                VARCHAR(1),
    IS_IME                          VARCHAR(1),
    IS_DME                          VARCHAR(1),
    ANTICIPATED_EVENTS              VARCHAR(1),
    EXEMPTED_EVENTS                 VARCHAR(1),
    MEDICALLY_CONFIRMED               VARCHAR(1),
    CAUSE_OF_ADVERSE_EVENT          VARCHAR(50),                                -- ICSR_CAUSE_AE
    DRUG_INTERACTION                VARCHAR(1),
    CAUSED_BY_LO_DEFECT             VARCHAR(1),
    OTHER_CAUSE_OF_ADVERSE_EVENT_DETAILS VARCHAR(300),
    TREATMENT_PERFORMED             VARCHAR(50),                                -- ICSR_TREATMENT_PERFORMED
    TREATMENT_DESC                  VARCHAR(300),
    DETECTED_COUNTRY                VARCHAR(50),                                -- COUNTRY
    COUNTRY_DETECTION_MANUAL        VARCHAR(300),
    EVENT_OCCUR_LOCATION            VARCHAR(50),                                -- ICSR_EVENT_OCCUR_LOCATION
    OTHER_EVENT_OCCUR_LOCATION      VARCHAR(300),
    REACTION_SITE                   VARCHAR(50),                                -- ICSR_REACTION_SITE
    REACTION_SITE_TEXT                VARCHAR(300),
    DEVICE_EVENT_SEVERITY           VARCHAR(50),                                -- ICSR_DEVICE_EVENT_SEVERITY
    EUDAMED_REF_NUMBER              VARCHAR(50),
    INCIDENT_OCCURRED_DURING        VARCHAR(50),                                -- ICSR_INCIDENT_OCCURRED_DURING
    LOCATION                        VARCHAR(50),                                -- ICSR_LOCATION
    MUNICIPALITY                    VARCHAR(300),
    HCF_NAME                        VARCHAR(50),
    HCF_NUMBER                      VARCHAR(50),
    EVENTS_DURING_INCIDENT    VARCHAR(50),                                -- ICSR_EVENTS_DURING_INCIDENT
    NEAR_INCIDENT           VARCHAR(1),
    SERIOUS_PUBLIC_HEALTH_THREAT        VARCHAR(1),
    UNANTICIPATED_STATE_HEALTH     VARCHAR(1),
    TOTAL_INCIDENTS_REPORTED        VARCHAR(300),
    BASIC_IDENTIFICATION            VARCHAR(50),                                -- ICSR_SIMILAR_INCIDENT_BASIS
    BASIC_ID_DESC                   VARCHAR(50),
    DEVICE_CRITERIA                 VARCHAR(50),                                -- ICSR_DEVICE_MARKET_CRITERIA
    DEVICE_CRITERIA_DESC            VARCHAR(50),
    IMDRF_SIMILAR_CODES             VARCHAR(50),
    IMDRF_SIMILAR_DESC              VARCHAR(50),
    COMMENTS_SIMILAR_INCIDENT       VARCHAR(300),
    INVESTIGATION_FINDING           VARCHAR(300),
    MEDICAL_DEVICE_PROBLEM          VARCHAR(300),
    PROBLEM_CODE                    VARCHAR(50),
    PROBLEM_TERM                    VARCHAR(50),
    ROOT_CAUSE_CODE                 VARCHAR(50),
    ROOT_CAUSE_TERM                 VARCHAR(50),
    OTHER_CODE_FLAG                 VARCHAR(50),
    OTHER_CODE_DESC                 VARCHAR(50),
    EVENT_RECEIVED_DATE             DATE,
    FOLLOW_UP                       VARCHAR(1),
    AE_ADDITIONAL_INFO       VARCHAR(300),
    OTHER                           VARCHAR(300),
    FAILED_REASON_OR_OTHER_INFO     VARCHAR(300),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 602 — ICSR_REACTION_VACCINE
-- Vaccine-specific reaction details (1:1 per reaction)
-- FK: REACTION_ID → ICSR_EVENT_REACTIONS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_REACTION_VACCINE (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    REACTION_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_EVENT_REACTIONS(ID) ON DELETE CASCADE,
    HOSPITALIZATION_REQUIRED    VARCHAR(1),
    NO_OF_DAYS_HOSPITALIZED     VARCHAR(300),
    RESULT_PROLONG_HOSPITAL     VARCHAR(1),
    AE_OUTCOME                  VARCHAR(1),
    HEALTHCARE_PROFESSIONAL     VARCHAR(1),
    DEPARTMENT                  VARCHAR(1),
    HOSPITAL_NAME               VARCHAR(300),
    CITY                        VARCHAR(300),
    STATE                       VARCHAR(300),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 603 — ICSR_SIMILAR_INCIDENTS
-- Device similar incident and market data (second-level multi-context)
-- FK: REACTION_ID → ICSR_EVENT_REACTIONS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_SIMILAR_INCIDENTS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    REACTION_ID             VARCHAR(36)     NOT NULL REFERENCES ICSR_EVENT_REACTIONS(ID) ON DELETE CASCADE,
    START_DATE              DATE,
    END_DATE                DATE,
    EEA_NO_DEVICE_MARKET    VARCHAR(300),
    EEA_NO_SIMILAR_EVENTS   VARCHAR(300),
    COI_NO_DEVICE_MARKET    VARCHAR(300),
    COI_NO_SIMILAR_EVENTS   VARCHAR(300),
    WORLD_NO_DEVICE_MARKET  VARCHAR(300),
    WORLD_NO_SIMILAR_EVENTS VARCHAR(300),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 610 — ICSR_DRUG_PRODUCTS
-- R2: B.4 / R3: G — Drug/Product (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_PRODUCTS (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    REPORTED_MEDICINAL_PRODUCT        VARCHAR(300),                               -- R2:B.4.k.2.1 product name as reported
    MEDICINAL_PRODUCT                VARCHAR(300),
    PREFERRED_PRODUCT_DESC                    VARCHAR(1000),
    INVENTED_NAME                   VARCHAR(50),
    SCIENTIFIC_NAME                 VARCHAR(50),
    TRADEMARK_NAME                  VARCHAR(50),
    SYNONYM_DRUG                    VARCHAR(300),
    PRODUCT_ACTIVE_INGREDIENT       VARCHAR(300),
    MEDICINAL_PRODUCT_ID               VARCHAR(300),
    E2B_R3_MED_PRODID               VARCHAR(100),                               -- R3:G.k.2.1.1 MPID
    E2B_R3_MEDPRODID_DATENUMBER     VARCHAR(50),
    E2B_R3_PHARMA_PRODID            VARCHAR(50),                                -- R3:G.k.2.2.1 PhPID
    E2B_R3_PHARMAPRODID_DATENUMBER  VARCHAR(50),
    WHODD_CODE                       VARCHAR(50),
    KDD_CODE                        VARCHAR(300),
    NDC_NO                          VARCHAR(300),
    NDC_CODE_VERSION                VARCHAR(300),
    INTERNAL_DRUG_CODE              VARCHAR(300),
    PRODUCT_RECORD_ID               VARCHAR(300),
    DRUG_CHARACTERIZATION            VARCHAR(50),                                -- ICSR_DRUG_CHAR
    PRODUCT_TYPE                    VARCHAR(50),                                -- PRODUCT_FLAG
    STUDY_PRODUCT_TYPE              VARCHAR(50),                                -- STUDY_PRODUCT_TYPE
    RANK_ORDER                      VARCHAR(300),
    COMPANY_PRODUCT                 VARCHAR(1),
    MANUFACTURER_NAME               VARCHAR(300),
    STRENGTH_NAME                   VARCHAR(50),
    FORM_STRENGTH_UNIT              VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    FORM_NAME                       VARCHAR(50),
    CONTAINER_NAME                  VARCHAR(50),
    DEVICE_NAME                     VARCHAR(50),
    INTENDED_USE_NAME               VARCHAR(50),
    DRUG_CUMULATIVE_DOSE_NUMB        VARCHAR(300),
    DRUG_CUMULATIVE_DOSE_UNIT        VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    EXPIRATION_DATE                 DATE,
    OBTAIN_DRUG_COUNTRY               VARCHAR(50),                                -- COUNTRY
    DECHALLENGE                     VARCHAR(50),                                -- ICSR_DECHALLENGE
    DRUG_RECHALLENGE       VARCHAR(50),                                -- ICSR_RECHALLENGE
    ACTION_DRUG                      VARCHAR(50),                                -- ICSR_ACTION_DRUG
    INVESTIGATIONAL_PROD_BLINDED    VARCHAR(1),
    PRIOR_USE                       VARCHAR(1),
    PRIOR_USE_EQUIVALENT_DRUG                 VARCHAR(1),
    CAUSED_BY_LACK_OF_EFFECT             VARCHAR(1),
    BIO_FATHER_DRUG                 VARCHAR(1),
    PRODUCT_AVAILABLE_FLAG          VARCHAR(1),
    SERIOUS_PUBLIC_HEALTH_THREAT    VARCHAR(1),
    BIOSIMILAR                      VARCHAR(1),
    GENERIC                         VARCHAR(1),
    PRODUCT_OTC            VARCHAR(1),
    PRODUCT_COMPOUNDED              VARCHAR(1),
    RETURNED_TO_MFR_DATE            VARCHAR(50),
    DRUG_ADDITIONAL_INFO            VARCHAR(1000),
    PROD_REF_COMMENTS               VARCHAR(1000),
    PROD_REF_REQUIRED               VARCHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 612 — ICSR_DRUG_ACTIVE_SUBSTANCES
-- R3: G.k.2.3 — Active substances (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_ACTIVE_SUBSTANCES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    ACTIVE_SUBSTANCE_NAME         VARCHAR(50),                                    -- R3:G.k.2.3.1
    SUBSTANCE_TERMID            VARCHAR(300),                                   -- R3:G.k.2.3.2a
    SUBSTANCE_TERMID_VERSION    VARCHAR(300),                                   -- R3:G.k.2.3.2b
    SUBSTANCE_STRENGTH          VARCHAR(300),                                   -- R3:G.k.2.3.3a
    SUBSTANCE_STRENGTH_UNIT     VARCHAR(50),                                    -- ICSR_SUBSTANCE_STRENGTH_UNIT
    CAS_NUMBER                  VARCHAR(300),
    KDD_CODE                    VARCHAR(300),
    CLINICAL_DRUG_CODE_JPN       VARCHAR(300),
    PRIMARY_ACTIVE              VARCHAR(300),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 615 — ICSR_DRUG_THERAPIES
-- R2: B.4.k.3-14 / R3: G.k.4-7 — Drug therapy details (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_THERAPIES (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    DRUG_START_DATE                   VARCHAR(50),                                -- R2:B.4.k.3
    THERAPY_START_DATE_TEXT         VARCHAR(300),
    DRUG_END_DATE                     VARCHAR(50),                                -- R2:B.4.k.4
    THERAPY_END_DATE_TEXT           VARCHAR(300),
    THERAPY_ONGOING           VARCHAR(1),
    THERAPY_DOSE_REDUCED_DATE       VARCHAR(50),
    DRUG_ADMIN_DURATION               VARCHAR(300),                               -- R2:B.4.k.5
    DRUG_ADMIN_DURATION_UNIT           VARCHAR(50),                                -- ICSR_DURATION_UNIT
    DRUG_UNIT_DOSE_NUMB         VARCHAR(300),                               -- R2:B.4.k.6a
    DRUG_UNIT_DOSE_UNIT         VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    DAILY_DOSE                      VARCHAR(300),
    DAILY_DOSE_UNIT                 VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    TOTAL_DOSE                      VARCHAR(300),
    TOTAL_DOSE_UNIT                 VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    DRUG_CUMULATIVE_DOSE_NUMB        VARCHAR(300),
    DRUG_CUMULATIVE_DOSE_UNIT        VARCHAR(50),                                -- ICSR_DOSAGE_UNIT
    DRUG_DOSAGE_TEXT                VARCHAR(1000),
    DRUG_FREQUENCY_NUMB          VARCHAR(50),                                -- R2:B.4.k.8
    DRUG_FREQ_TIME_NUMB           VARCHAR(300),                               -- R2:B.4.k.9
    DRUG_FREQ_TIME_UNIT            VARCHAR(50),                                -- ICSR_FREQ_TIME_UNIT
    DOSE_NUM_SERIES                 VARCHAR(300),
    DRUG_ADMIN_ROUTE         VARCHAR(50),                                -- ROUTE_OF_ADMIN
    ROUTE_ADMIN_TERMID              VARCHAR(300),
    ROUTE_ADMIN_TERMID_VER          VARCHAR(300),
    DRUG_PARENT_ADMIN_ROUTE           VARCHAR(50),                                -- ROUTE_OF_ADMIN
    PAR_ROUTE_ADMIN_TERMID          VARCHAR(50),
    PAR_ROUTE_ADMIN_TERMID_VER      VARCHAR(50),
    DRUG_DOSAGE_FORM                  VARCHAR(50),                                -- FORM_OF_ADMIN
    PHARMACEUTICAL_TERMID           VARCHAR(50),
    PHARMACEUTICAL_TERMID_VER       VARCHAR(50),
    FORM_STRENGTH                   VARCHAR(300),
    FORM_STRENGTH_UNIT              VARCHAR(50),                                -- ICSR_SUBSTANCE_STRENGTH_UNIT
    LOT_NUMBER                      VARCHAR(50),                                -- R2:B.4.k.12
    EXPIRATION_DATE                 VARCHAR(50),                                -- R2:B.4.k.13
    THERAPY_SITE                   VARCHAR(50),                                -- ICSR_THERAPY_SITE
    ANATOMICAL_APPROACH_SITE        VARCHAR(50),                                -- ICSR_VACC_ANAT_SITE
    IS_SAMPLE_AVAILABLE             VARCHAR(1),
    TITLE                           VARCHAR(50),
    FIRST_NAME                      VARCHAR(300),
    MIDDLE_NAME                     VARCHAR(300),
    LAST_NAME                       VARCHAR(300),
    TELEPHONE                       VARCHAR(300),
    EMAIL                        VARCHAR(300),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 617 — ICSR_DRUG_THERAPY_VACCINES
-- Vaccine facility details (third-level multi-context)
-- FK: THERAPY_ID → ICSR_DRUG_THERAPIES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_THERAPY_VACCINES (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    THERAPY_ID                  VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_THERAPIES(ID) ON DELETE CASCADE,
    VACCINE_NAME                VARCHAR(300),
    VACCINATION_TYPE            VARCHAR(50),                                    -- ICSR_VACC_FACILITY_TYPE
    VACCINATION_ADDRESS1        VARCHAR(300),
    VACCINATION_ADDRESS2        VARCHAR(300),
    VACCINATION_CITY            VARCHAR(300),
    VACCINATION_STATE           VARCHAR(50),
    VACCINATION_POSTAL_CODE     VARCHAR(300),
    VACCINATION_COUNTRY         VARCHAR(50),                                    -- COUNTRY
    VACCINATION_TELEPHONE       VARCHAR(300),
    VACCINATION_FAX             VARCHAR(300),
    VACCINE_FACILITY_MILITARY_FLAG VARCHAR(1),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 620 — ICSR_DRUG_INDICATIONS
-- R2: B.4.k.11 / R3: G.k.7 — Drug indications (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_INDICATIONS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    DRUG_INDICATION          VARCHAR(50),                                        -- R2:B.4.k.11
    DRUG_INDICATION_LLT_CODE     VARCHAR(300),                                       -- MedDRA LLT
    DRUG_INDICATION_PT_CODE        VARCHAR(300),                                       -- MedDRA PT
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 625 — ICSR_PRODUCT_DEVICES
-- Device-specific product details (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_PRODUCT_DEVICES (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    BRAND_NAME                      VARCHAR(300),
    BRAND_NAME_JP                   VARCHAR(300),
    COMMON_DEVICE_NAME              VARCHAR(300),
    GENERAL_NAME                    VARCHAR(300),
    GENERAL_NAME_CODE               VARCHAR(300),
    PRODUCT_DESC                    VARCHAR(1000),
    PRO_CODE                        VARCHAR(300),
    UDI_NUMBER                      VARCHAR(50),
    CATALOGUE_NUMBER                VARCHAR(300),
    MODEL_NUMBER                    VARCHAR(300),
    SERIAL_NUMBER                   VARCHAR(300),
    LOT_NUMBER                      VARCHAR(50),
    DEVICE_CE_NUMBER               VARCHAR(300),
    APPROVAL_NO                     VARCHAR(300),
    FDA_REG_NUM                     VARCHAR(300),
    PROD_ARTG_NUM                   VARCHAR(300),
    DEVICE_MANUFACTURE_DATE         DATE,
    EXPIRATION_DATE                 DATE,
    IMPLANTED_DATE                  DATE,
    EXPLANTED_DATE                  DATE,
    DURATION_OF_IMPLANTATION        VARCHAR(300),
    DURATION_OF_IMPLANTATION_UNIT   VARCHAR(50),                                -- ICSR_DURATION_UNIT
    DEVICE_AGE                      VARCHAR(300),
    DEVICE_AGE_UNIT                 VARCHAR(50),                                -- ICSR_DURATION_UNIT
    PROD_RETURN_DATE                DATE,
    DATE_EXPECTED_NEXT_REPORT       DATE,
    DEVICE_EVALUATED_BY_MFR  VARCHAR(50),                                -- ICSR_DEVICE_EVALUATED
    REASON_EVALUATION_NOT_PROVIDED  VARCHAR(50),                                -- ICSR_DEVICE_EVAL_NOT_PROVIDED
    CURRENT_DEV_LOCATION            VARCHAR(50),                                -- ICSR_DEVICE_LOCATION
    REMEDIAL_ACTION    VARCHAR(50),                                -- ICSR_REMEDIAL_ACTION
    REMEDIAL_ACTION_OTHER           VARCHAR(1000),
    CORRECTION_REMOVE_REPORTING_NO  VARCHAR(300),
    DEVICE_USED_FOR                 VARCHAR(50),                                -- ICSR_DEVICE_USAGE
    OPERATOR_OF_DEVICE              VARCHAR(50),                                -- ICSR_DEVICE_OPERATOR
    DEVICE_REPROCESSED_AND_REUSED   VARCHAR(50),                                -- ICSR_DEVICE_REPROCESSED
    LABELLED_FOR_SINGLE_USE         VARCHAR(1),
    MAL_FUNCTION                    VARCHAR(1),
    IS_PROD_COMBINATION             VARCHAR(1),
    PRIMARY_DEVICE_FLAG             VARCHAR(50),                                -- ICSR_LABELLING
    PRODUCT_CHARACTERIZATION        VARCHAR(50),                                -- ICSR_DRUG_CHAR
    SUMMARY_REPORT                  VARCHAR(1),
    RISK_ASSESSMENT_REVIEWED        VARCHAR(1),
    RISK_ASSESSMENT_ADEQUATE      VARCHAR(1),
    ROOT_CAUSE_CONFIRMED       VARCHAR(1),
    NOMENCLATURE_CODE               VARCHAR(300),
    NOMENCLATURE_SYSTEM             VARCHAR(50),
    NOMENCLATURE_TEXT               VARCHAR(1000),
    DEVICE_COMPONENT_NAME           VARCHAR(50),
    DEVICE_COMPONENT_TERMID         VARCHAR(50),
    DEVICE_COMPONENT_TERMID_VER      VARCHAR(50),
    COMPETENT_AUTHORITY_NAME            VARCHAR(300),
    NCA_LOCAL_REF_NUM               VARCHAR(300),
    NCA_FSCA_REF_NUM                VARCHAR(300),
    MFR_NUMBER                      VARCHAR(300),
    REPORT_SENT_TO_FDA              VARCHAR(1),
    REPORT_SENT_FDA_DATE            DATE,
    REPORT_SENT_TO_MANUF            VARCHAR(1),
    REPORT_SENT_MANUF_DATE          DATE,
    RESPONSE_TO_AUTHORITY_REQD       VARCHAR(1),
    USER_FACILITY       VARCHAR(300),
    USER_FACILITY_REPORT_NO        VARCHAR(300),
    IMPORTER                     VARCHAR(300),
    REPROCESSOR_UNIT         VARCHAR(300),
    OTHER_PLEASE_SPECIFY            VARCHAR(1000),
    DEVICE_TYPE                     VARCHAR(300),
    NO_OF_EVENTS_SUMMARIZED         VARCHAR(300),
    FOLLOW_UP_ADDITIONAL_INFO              VARCHAR(1),
    FOLLOW_UP_CORRECTION            VARCHAR(1),
    FOLLOW_UP_DEVICE_EVALUATION     VARCHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 627 — ICSR_DEVICE_MANUFACTURERS
-- Device manufacturer details (third-level multi-context)
-- FK: DEVICE_ID → ICSR_PRODUCT_DEVICES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DEVICE_MANUFACTURERS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    DEVICE_ID               VARCHAR(36)     NOT NULL REFERENCES ICSR_PRODUCT_DEVICES(ID) ON DELETE CASCADE,
    MANUFACTURER_AS_REPORTED VARCHAR(300),
    MANUFACTURER_AS_CODED   VARCHAR(300),
    MANUFACTURER_ADDRESS    VARCHAR(300),
    CITY                    VARCHAR(300),
    STATE                   VARCHAR(300),
    COUNTRY                 VARCHAR(50),                                        -- COUNTRY
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 628 — ICSR_DEVICE_PROBLEM_EVALUATIONS
-- Device problem evaluation type/value (third-level multi-context)
-- FK: DEVICE_ID → ICSR_PRODUCT_DEVICES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DEVICE_PROBLEM_EVALUATIONS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    DEVICE_ID           VARCHAR(36)     NOT NULL REFERENCES ICSR_PRODUCT_DEVICES(ID) ON DELETE CASCADE,
    EVALUATION_TYPE     VARCHAR(50),
    EVALUATION_VALUE    VARCHAR(300),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 629 — ICSR_DEVICE_IMDRF_EVALUATIONS
-- IMDRF-coded device evaluations (third-level multi-context)
-- FK: DEVICE_ID → ICSR_PRODUCT_DEVICES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DEVICE_IMDRF_EVALUATIONS (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    DEVICE_ID                   VARCHAR(36)     NOT NULL REFERENCES ICSR_PRODUCT_DEVICES(ID) ON DELETE CASCADE,
    EVALUATION_TYPE_IMDRF_1     VARCHAR(300),                                   -- Annex A: Medical Device Problem
    EVALUATION_TYPE_IMDRF_2     VARCHAR(300),                                   -- Annex B: Type of Investigation
    EVALUATION_TYPE_IMDRF_3     VARCHAR(300),                                   -- Annex C: Investigation Findings
    EVALUATION_TYPE_IMDRF_4     VARCHAR(300),                                   -- Annex D: Investigation Conclusion
    EVALUATION_TYPE_IMDRF_5     VARCHAR(300),                                   -- Annex G: Medical Device Component
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 630 — ICSR_DRUG_APPROVALS
-- R2: B.4.k.2.2 / R3: G.k.3 — Drug authorization per country (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_APPROVALS (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    AUTHORIZATION_NUMBER           VARCHAR(300),                               -- R2:B.4.k.2.2
    AUTHORIZATION_TYPE           VARCHAR(50),                                -- ICSR_APPROVAL_TYPE
    AUTHORIZATION_COUNTRY        VARCHAR(50),                                -- COUNTRY
    TRADE_NAME                      VARCHAR(300),
    MAH_AS_REPORTED         VARCHAR(300),                               -- MAH as reported
    MAH_AS_CODED                    VARCHAR(300),
    SUBSTANCE_NAME                  VARCHAR(300),
    PRODUCT_TYPE                    VARCHAR(50),                                -- PRODUCT_FLAG
    WHODD_MPID                      VARCHAR(300),
    DEVICE_CLASS                    VARCHAR(50),                                -- ICSR_DEVICE_CLASS
    DEVICE_DEMOGRAPHIC        VARCHAR(50),                                -- ICSR_DEVICE_DEMOGRAPHIC
    DEVICE_MARKETED_BEFORE          VARCHAR(1),
    NOTIFIED_BODY_IDENT_NO          VARCHAR(300),
    NOTIFIED_CERTIFICATE_NO         VARCHAR(300),
    HC_ID_NUMBER                    VARCHAR(300),
    DEVICE_MARKET_MONTHS                VARCHAR(300),
    DEVICE_MARKET_YEARS                 VARCHAR(300),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 635 — ICSR_DRUG_REACTION_RELATEDNESS
-- R2: B.4.k.17-18 / R3: G.k.9 — Drug-reaction relatedness (second-level multi-context)
-- FK: DRUG_ID → ICSR_DRUG_PRODUCTS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_REACTION_RELATEDNESS (
    ID                              VARCHAR(36)     NOT NULL PRIMARY KEY,
    DRUG_ID                         VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_PRODUCTS(ID) ON DELETE CASCADE,
    REACTION_NAME                   VARCHAR(300),
    FK_AR_REC_ID                    VARCHAR(300),                               -- FK to event reaction record
    DRUG_REACT_ASSESS_TERM                  VARCHAR(50),
    ACTION_DRUG                      VARCHAR(50),                                -- ICSR_ACTION_DRUG
    DECHALLENGE                     VARCHAR(50),                                -- ICSR_DECHALLENGE
    RECHALLENGE                     VARCHAR(50),                                -- ICSR_RECHALLENGE
    COMPANY_CAUSALITY               VARCHAR(50),                                -- ICSR_CAUSALITY
    REPORTER_CAUSALITY              VARCHAR(50),                                -- ICSR_CAUSALITY
    OUTCOME_AFTER_CHANGE            VARCHAR(50),                                -- ICSR_REACT_OUTCOME
    DRUG_START_LATENCY                VARCHAR(300),
    DRUG_START_LATENCY_UNIT            VARCHAR(50),                                -- ICSR_DURATION_UNIT
    DRUG_END_LATENCY                  VARCHAR(300),
    DRUG_END_LATENCY_UNIT              VARCHAR(50),                                -- ICSR_DURATION_UNIT
    IS_AESI                          VARCHAR(1),
    ASSESS_RELATIONSHIP             VARCHAR(1),
    ASSESS_RELATIONSHIP_MANUAL      VARCHAR(1),
    COMPANY_CAUSALITY_MANUAL        VARCHAR(1),
    COMPANY_CAUSALITY_PROCEDURE     VARCHAR(50),                                -- ICSR_CAUSALITY
    REPORTER_CAUSALITY_PROCEDURE    VARCHAR(50),                                -- ICSR_CAUSALITY
    PROCEDURE_COMMENTS              VARCHAR(1000),
    FOLLOW_UP                       VARCHAR(1),
    TEMPORAL_ASSOCIATION                VARCHAR(1),
    END_LATENCY_MANUAL              VARCHAR(1),
    START_LATENCY_MANUAL            VARCHAR(1),
    CREATED_AT                      TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 636 — ICSR_DRUG_REACTION_LABELLINGS
-- R2: B.4.k.17.1 / R3: G.k.9.i.1 — Labelling per country (third-level multi-context)
-- FK: RELATEDNESS_ID → ICSR_DRUG_REACTION_RELATEDNESS(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_DRUG_REACTION_LABELLINGS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    RELATEDNESS_ID          VARCHAR(36)     NOT NULL REFERENCES ICSR_DRUG_REACTION_RELATEDNESS(ID) ON DELETE CASCADE,
    COUNTRY                 VARCHAR(50),                                        -- COUNTRY
    LABELLING_STATUS               VARCHAR(50),                                        -- ICSR_LABELLING
    LABELLING_VERSION       VARCHAR(300),
    REASON_FOR_LISTEDNESS           VARCHAR(1000),
    SUSAR                   VARCHAR(1),
    LABELLING_MANUAL                  VARCHAR(1),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 640 — ICSR_LAB_TESTS
-- R2: B.3 / R3: F — Lab test results (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_LAB_TESTS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                 VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    TEST_NAME                VARCHAR(50),                                        -- R2:B.3.1.a / R3:F.r.1
    MEDICAL_EPISODE_LLT_CODE     VARCHAR(300),                                       -- MedDRA LLT
    TEST_PT_CODE            VARCHAR(300),                                       -- MedDRA PT
    TEST_DATE                VARCHAR(50),                                        -- R2:B.3.1.b / R3:F.r.2
    TEST_RESULT_VALUE       VARCHAR(300),                                       -- R2:B.3.1.c / R3:F.r.3
    TEST_UNIT                VARCHAR(50),                                        -- ICSR_LAB_UNIT
    TEST_RESULT_CODE        VARCHAR(50),                                        -- ICSR_LAB_RESULT_CODE
    TEST_RESULT_TEXT                VARCHAR(1000),                                        -- R2:B.3.1.f / R3:F.r.4
    LOW_TEST_RANGE            VARCHAR(50),                                        -- R2:B.3.1.g / R3:F.r.5.1
    HIGH_TEST_RANGE           VARCHAR(50),                                        -- R2:B.3.1.h / R3:F.r.5.2
    CODING_TYPE             VARCHAR(50),                                        -- ICSR_CODING_TYPE
    MORE_INFORMATION         VARCHAR(1),
    FOLLOW_UP               VARCHAR(1),
    LAB_COMMENTS                    VARCHAR(1000),
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Table 645 — ICSR_LITERATURE
-- R2: A.2.3 / R3: C.4 — Literature references (first-level multi-context)
-- FK: CASE_ID → ICSR_CASES(ID)
-- ============================================================
CREATE TABLE IF NOT EXISTS ICSR_LITERATURE (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID                     VARCHAR(36)     NOT NULL REFERENCES ICSR_CASES(ID) ON DELETE CASCADE,
    LITERATURE_REFERENCE        VARCHAR(1000),                                    -- R2:A.2.3.1 / R3:C.4.1
    ARTICLE_TITLE               VARCHAR(300),                                    -- R3:C.4.2
    JOURNAL_TITLE               VARCHAR(300),
    DOI          				VARCHAR(50),                                    -- R3:C.4.3 DOI
    DOCUMENT_NAME         		VARCHAR(300),
    PUBLICATION_DATE            VARCHAR(50),
    EDITION                     VARCHAR(50),
    ISSUE                       VARCHAR(50),
    PAGE_FROM                   VARCHAR(50),
    PAGE_TO                     VARCHAR(50),
    ADDITIONAL_LIT_INFO         VARCHAR(1000),
    RETAIN_LITERATURE_REF   	VARCHAR(1),
    FOLLOW_UP                   VARCHAR(1),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);
