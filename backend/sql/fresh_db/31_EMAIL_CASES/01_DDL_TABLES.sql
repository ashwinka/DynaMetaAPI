-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 01_SSL_TABLES.sql
-- Purpose : DDL for the module specific tables
--           
-- Run on  : Each child tenant schema on fresh provisioning
-- ============================================================

CREATE TABLE IF NOT EXISTS EMAIL_CASES (
    ID              	VARCHAR(36)     NOT NULL PRIMARY KEY,
    CASE_ID             VARCHAR(100)    NOT NULL UNIQUE,
    EMAIL_SUBJECT       VARCHAR(500),
    SENDER_NAME         VARCHAR(300),
    SENDER_EMAIL        VARCHAR(300),
    SENDER_COUNTRY      VARCHAR(10),
    RECEIVED_DATE       DATE,
    STATUS              VARCHAR(50),    -- NEW | IN_REVIEW | TRIAGED | CLOSED
    PRIORITY            VARCHAR(20),    -- HIGH | MEDIUM | LOW
    ASSIGNED_TO         VARCHAR(100),
    DUE_DATE            DATE,
    CASE_CREATED        CHAR(1)         DEFAULT 'N',
    LINKED_CASE_ID      VARCHAR(100),
    EMAIL_BODY          TEXT,
    PROCESSING_NOTES    TEXT,
    IS_SAFETY_RELATED   CHAR(1)         DEFAULT 'N',
    REPORTER_TYPE       VARCHAR(10),
    PRODUCT_MENTIONED   VARCHAR(300),
    EVENT_MENTIONED     VARCHAR(500),
    SERIOUS             CHAR(1)         DEFAULT 'N',
    TRIAGE_DECISION     VARCHAR(50),    -- CREATE_CASE | NON_SAFETY | PENDING_REVIEW
    TRIAGE_DATE         DATE,
    TRIAGE_BY           VARCHAR(100),
    CREATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW(),
    UPDATED_AT          TIMESTAMP       NOT NULL DEFAULT NOW()
);
