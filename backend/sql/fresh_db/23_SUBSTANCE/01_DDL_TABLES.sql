-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : SUBSTANCE
-- Purpose : DDL for Substance Library tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS SUBSTANCE (
    ID                      VARCHAR(36)     NOT NULL PRIMARY KEY,
    SUBSTANCE_ID            VARCHAR(100)    NOT NULL UNIQUE,
    SUBSTANCE_NAME          VARCHAR(300)    NOT NULL,
    GENERIC_SUBSTANCE_CODE  VARCHAR(100),
    IS_ACTIVE               CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    SUBSTANCE_ROLE          VARCHAR(50),                                    -- codelist: SUBSTANCE_ROLE
    IS_STRUCTURED           CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_STRUCTURED IN ('Y','N')),
    STRENGTH                VARCHAR(10),
    UNIT                    VARCHAR(50),                                    -- codelist: SUBSTANCE_UNIT
    UNSTRUCTURED_STRENGTH   VARCHAR(100),
    SUBSTANCE_TERM_ID       VARCHAR(300),
    MANUFACTURER_NAME       VARCHAR(300),
    CLASS_OF_INGREDIENT     VARCHAR(50),                                    -- codelist: INGREDIENT_CLASS
    CREATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT              TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── SUBSTANCE_SYNONYMS — synonyms (multi-context) ────────────
CREATE TABLE IF NOT EXISTS SUBSTANCE_SYNONYMS (
    ID              VARCHAR(36)     NOT NULL PRIMARY KEY,
    SUBSTANCE_REC_ID VARCHAR(36)    NOT NULL REFERENCES SUBSTANCE(ID) ON DELETE CASCADE,
    SYNONYM_NAME    VARCHAR(100)    NOT NULL,
    IS_ACTIVE       CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    CREATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT      TIMESTAMP       NOT NULL DEFAULT NOW()
);
