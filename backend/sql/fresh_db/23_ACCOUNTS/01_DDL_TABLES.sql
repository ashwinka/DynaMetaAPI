-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : ACCOUNTS
-- Purpose : DDL for Accounts / Company Units tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS ACCOUNTS (
    ID                          VARCHAR(36)     NOT NULL PRIMARY KEY,
    ACC_ID                      VARCHAR(100)    NOT NULL UNIQUE,
    ACC_NAME                    VARCHAR(300)    NOT NULL,
    IS_ACTIVE                   CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    ACCOUNT_TYPE                VARCHAR(50),                                -- codelist: ACCOUNT_TYPE
    HEALTH_AUTHORITY            VARCHAR(50),                                -- codelist: HEALTH_AUTHORITY
    SINGLE_REG_NUMBER           VARCHAR(300),
    DESCRIPTION                 VARCHAR(1000),
    -- Contact Details
    ADDRESS                     VARCHAR(1000),
    COUNTRY                     VARCHAR(10),                                -- codelist: COUNTRY
    CITY                        VARCHAR(150),
    STATE                       VARCHAR(150),
    POSTCODE                    VARCHAR(50),
    PHONE_COUNTRY_CODE          VARCHAR(10),
    PHONE_AREA_CODE             VARCHAR(10),
    PHONE_NUMBER                VARCHAR(50),
    WEBSITE                     VARCHAR(500),
    -- Fax
    FAX_COUNTRY_CODE            VARCHAR(10),
    FAX_AREA_CODE               VARCHAR(10),
    FAX_NUMBER                  VARCHAR(50),
    CREATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT                  TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ACCOUNT_REG_NUMBERS — registrationNumbers (multi-context) ─
CREATE TABLE IF NOT EXISTS ACCOUNT_REG_NUMBERS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    ACCOUNT_REC_ID      VARCHAR(36)     NOT NULL REFERENCES ACCOUNTS(ID) ON DELETE CASCADE,
    AUTHORITY_NAME      VARCHAR(50),                                        -- codelist: REG_AUTHORITY
    REGISTRATION_NUMBER VARCHAR(300),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ACCOUNT_CONTACTS — contacts (multi-context) ──────────────
CREATE TABLE IF NOT EXISTS ACCOUNT_CONTACTS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    ACCOUNT_REC_ID      VARCHAR(36)     NOT NULL REFERENCES ACCOUNTS(ID) ON DELETE CASCADE,
    IS_PRIMARY          CHAR(1)         NOT NULL DEFAULT 'N' CHECK (IS_PRIMARY IN ('Y','N')),
    CONTACT_ID          VARCHAR(100),                                       -- stores contactId from CONTACTS
    CONTACT_NAME        VARCHAR(300),                                       -- display value from lookup
    INTERCHANGE_ID      VARCHAR(200),
    E2B_CONTACT         CHAR(1)         NOT NULL DEFAULT 'N' CHECK (E2B_CONTACT IN ('Y','N')),
    CASE_DISTRIBUTION   CHAR(1)         NOT NULL DEFAULT 'N' CHECK (CASE_DISTRIBUTION IN ('Y','N')),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── ACCOUNT_CONTRACTS — contracts (multi-context) ────────────
CREATE TABLE IF NOT EXISTS ACCOUNT_CONTRACTS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    ACCOUNT_REC_ID      VARCHAR(36)     NOT NULL REFERENCES ACCOUNTS(ID) ON DELETE CASCADE,
    CONTRACT_NAME       VARCHAR(300)    NOT NULL,
    FILE_NAME           VARCHAR(300),
    DOCUMENT_ID         VARCHAR(200),
    CONTRACT_NUMBER     VARCHAR(200),
    IS_ACTIVE           CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    EFFECTIVE_START_DATE DATE,
    EXPIRY_DATE         DATE,
    DESCRIPTION         VARCHAR(1000),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);
