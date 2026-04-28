-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : STUDY
-- Purpose : DDL for Study Library tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS STUDY (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    PROJECT_NO                  VARCHAR(300)    NOT NULL UNIQUE,
    SPONSOR_STUDY_NO            VARCHAR(300),
    IS_ACTIVE                   CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    STUDY_DETAILS               VARCHAR(1000),
    STUDY_TITLE                 VARCHAR(300)    NOT NULL,
    STUDY_DESIGN                VARCHAR(50),                                -- codelist: STUDY_DESIGN
    PRIMARY_SOURCE              VARCHAR(50),                                -- codelist: STUDY_PRIMARY_SOURCE
    STUDY_PHASE                 VARCHAR(50),                                -- codelist: STUDY_PHASE
    BLINDED_STUDY               CHAR(1)         NOT NULL DEFAULT 'N' CHECK (BLINDED_STUDY IN ('Y','N')),
    BLINDING_TECHNIQUE          VARCHAR(50),                                -- codelist: BLINDING_TECHNIQUE
    EUDRACT_NO                  VARCHAR(200),
    CODE_STATUS                 VARCHAR(50),                                -- codelist: CODE_STATUS
    PRIMARY_TEST_COMPOUND       VARCHAR(300),
    CODE_BROKEN_ON              DATE,
    CLINICALTRIALS_GOV_ID       VARCHAR(200),
    STUDY_DESIGN_DESCRIPTION    VARCHAR(1000),
    PRIMARY_IND                 VARCHAR(200),
    PANDA                       VARCHAR(200),
    STUDY_TYPE                  VARCHAR(50),                                -- codelist: STUDY_TYPE
    PROTOCOL_DETAILS            VARCHAR(1000),
    STUDY_ACRONYM               VARCHAR(100),
    EU_CT_REGULATION_2019       CHAR(1)         NOT NULL DEFAULT 'N' CHECK (EU_CT_REGULATION_2019 IN ('Y','N')),
    CTD_TO_CTR_TRANSITION_DATE  DATE,
    SPONSOR_CODE                VARCHAR(100),                               -- readonly, auto-populated from lookup
    SPONSOR_NAME                VARCHAR(300),                               -- display value from ACCOUNTS lookup
    SPONSOR_ACCOUNT_ID          VARCHAR(36),                                -- FK to ACCOUNTS
    SPONSOR_TYPE                VARCHAR(50),                                -- codelist: SPONSOR_TYPE
    STUDY_START_DATE            DATE,
    STUDY_END_DATE              DATE,
    GLOBAL_ENROLLMENT_COUNT     VARCHAR(50),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── STUDY_PRODUCTS — studyProduct (multi-context) ────────────
CREATE TABLE IF NOT EXISTS STUDY_PRODUCTS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    STUDY_REC_ID        VARCHAR(36)     NOT NULL REFERENCES STUDY(ID) ON DELETE CASCADE,
    PRODUCT_CODE        VARCHAR(100),                                       -- readonly, auto-populated from lookup
    PRODUCT_NAME        VARCHAR(300),                                       -- display value from PRODUCTS lookup
    PRODUCT_ID          VARCHAR(36),                                        -- FK to PRODUCTS
    STUDY_PRODUCT_TYPE  VARCHAR(50),                                        -- codelist: STUDY_PRODUCT_TYPE
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── STUDY_REGISTRATIONS — studyRegistrationInformation (multi-context) ─
CREATE TABLE IF NOT EXISTS STUDY_REGISTRATIONS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    STUDY_REC_ID            VARCHAR(36)     NOT NULL REFERENCES STUDY(ID) ON DELETE CASCADE,
    REGISTRATION_NUMBER     VARCHAR(100)    NOT NULL,
    AUTHORITY               VARCHAR(50),                                    -- codelist: REG_AUTHORITY
    REGISTRATION_COUNTRY    VARCHAR(10),                                    -- codelist: COUNTRY
    TRIAL_STATUS            VARCHAR(50),                                    -- codelist: TRIAL_STATUS
    RESPONSIBLE_OPU_ID      VARCHAR(36),                                    -- FK to ACCOUNTS
    RESPONSIBLE_OPU_NAME    VARCHAR(300),                                   -- display value from ACCOUNTS lookup
    LOCAL_APPROVAL_NUMBER   VARCHAR(200),
    EC_REPORTING_FLAG       CHAR(1)         NOT NULL DEFAULT 'N' CHECK (EC_REPORTING_FLAG IN ('Y','N')),
    STUDY_REGISTRATION_DATE DATE,
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── STUDY_CROSS_REF_INDS — crossReferencedINDs (multi-context) ─
CREATE TABLE IF NOT EXISTS STUDY_CROSS_REF_INDS (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    STUDY_REC_ID            VARCHAR(36)     NOT NULL REFERENCES STUDY(ID) ON DELETE CASCADE,
    CROSS_REF_IND           VARCHAR(100)    NOT NULL,
    STUDY_TYPE              VARCHAR(50),                                    -- codelist: STUDY_TYPE
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);
