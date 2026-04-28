-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_SSL_TABLES.sql
-- Purpose : DDL for the module specific tables
--           
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS CORR_QUESTION_LIB (
    ID              	VARCHAR(36)     NOT NULL PRIMARY KEY,
    QUESTION_ID         VARCHAR(100)    NOT NULL UNIQUE,
    QUESTION_TITLE      VARCHAR(500)    NOT NULL,
    CATEGORY            VARCHAR(100),
    SUB_CATEGORY        VARCHAR(100),
    LANGUAGE            VARCHAR(10)     DEFAULT 'EN',
    PRIORITY            VARCHAR(20),    -- HIGH | MEDIUM | LOW
    IS_ACTIVE           CHAR(1)         NOT NULL DEFAULT 'Y',
    IS_MANDATORY        CHAR(1)         DEFAULT 'N',
    APPLICABLE_TO       VARCHAR(100),
    CREATED_BY          VARCHAR(100),
    CREATED_DATE        DATE,
    LAST_MODIFIED       DATE,
    QUESTION_TEXT       TEXT,
    HELP_TEXT           TEXT,
    RESPONSE_TYPE       VARCHAR(50),    -- DATE | FREE_TEXT | YES_NO | CODELIST
    EXPECTED_RESPONSE   VARCHAR(500),
    FOLLOW_UP_QUESTION_ID VARCHAR(100),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS CORR_QUESTION_TRANSLATIONS (
    ID              	VARCHAR(36)     NOT NULL PRIMARY KEY,
    QUESTION_ID  VARCHAR(36)     NOT NULL REFERENCES CORR_QUESTION_LIB(ID) ON DELETE CASCADE,
    LANGUAGE            VARCHAR(10),
    TRANSLATED_TITLE    VARCHAR(500),
    TRANSLATED_TEXT     TEXT
);

CREATE TABLE IF NOT EXISTS CORR_QUESTION_USAGE_HISTORY (
    ID              	VARCHAR(36)     NOT NULL PRIMARY KEY,
    QUESTION_ID  		VARCHAR(36)     NOT NULL REFERENCES CORR_QUESTION_LIB(ID) ON DELETE CASCADE,
    CASE_ID             VARCHAR(100),
    USED_DATE           DATE,
    USED_BY             VARCHAR(100),
    CHANNEL             VARCHAR(100)
);
