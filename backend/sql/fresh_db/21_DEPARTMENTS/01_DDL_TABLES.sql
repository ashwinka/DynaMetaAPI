-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_DDL_TABLES.sql
-- Module  : DEPARTMENTS
-- Purpose : DDL for Department tables
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS DEPARTMENTS (
    ID                  VARCHAR(36)     NOT NULL PRIMARY KEY,
    DEPARTMENT_CODE     VARCHAR(100)    NOT NULL UNIQUE,
    DEPARTMENT_NAME     VARCHAR(300)    NOT NULL,
    CONTACT_PERSON      VARCHAR(300),
    EMAIL_ID            VARCHAR(300),
    REPORT_NOTIFICATION CHAR(1)         NOT NULL DEFAULT 'N' CHECK (REPORT_NOTIFICATION IN ('Y','N')),
    IS_ACTIVE           CHAR(1)         NOT NULL DEFAULT 'Y' CHECK (IS_ACTIVE IN ('Y','N')),
    -- Contact Phone
    PHONE_COUNTRY_CODE  VARCHAR(10),
    PHONE_AREA_CODE     VARCHAR(10),
    PHONE_NUMBER        VARCHAR(50),
    -- Fax
    FAX_COUNTRY_CODE    VARCHAR(10),
    FAX_AREA_CODE       VARCHAR(10),
    FAX_NUMBER          VARCHAR(50),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);
