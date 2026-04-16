-- ============================================================
-- MetaDyna API — Child Tenant Schema
-- Script  : 06_TENANT_seed_menu_modules.sql
-- Purpose : Seed data for Child Tenant only —
--           MENU_GROUPS, MODULE
-- Run on  : Master tenant schema (META_DYNA_MASTER) only
-- ============================================================


-- Enable pgcrypto for UUID generation in seed scripts
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ── Menu Groups ──────────────────────────────────────────────
INSERT INTO MENU_GROUPS (ID, MENU_ID, LABEL, TRANSLATIONS, ICON, SEQUENCE) VALUES
(gen_random_uuid()::VARCHAR, 'safety',       'Safety Reporting', '{"fr":"Rapports de sécurité","ja":"安全性報告"}',
 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z', 1),
(gen_random_uuid()::VARCHAR, 'regulatory',   'Regulatory',       '{"fr":"Réglementaire","ja":"規制"}',
 'M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3', 2),
(gen_random_uuid()::VARCHAR, 'dictionaries', 'Dictionaries',     '{"fr":"Dictionnaires","ja":"辞書"}',
 'M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253', 3)
ON CONFLICT (MENU_ID) DO NOTHING;

-- ── Module Registry (from Menu_registry.json) ────────────────
INSERT INTO MODULE (ID, MODULE_ID, ITEM_ID, LABEL, TRANSLATIONS, DESCRIPTION, MENU_GROUP_ID, ICON, VIEW, DB_ROOT_TABLE, IS_DISABLED, SEQUENCE) VALUES
-- Safety Reporting
(gen_random_uuid()::VARCHAR, 'ICSR', 'icsr-cases', 'ICSR Cases',
 '{"fr":{"label":"Cas ICSR","description":"Rapports individuels de sécurité — compatibles ICH E2B(R2/R3)"},"ja":{"label":"ICSRケース","description":"個別症例安全性報告 — ICH E2B(R2/R3)対応"}}',
 'Individual Case Safety Reports — ICH E2B(R2/R3) dual-compatible, EMA/FDA submissions',
 'safety',
 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
 'listing', 'ICSR_CASES', 'N', 1),
(gen_random_uuid()::VARCHAR, 'CORRESPONDENCE', 'case-correspondence', 'Correspondence',
 '{"fr":{"label":"Correspondance","description":"Emails de correspondance par cas"},"ja":{"label":"通信","description":"ケースごとの通信メール"}}',
 'Correspondence emails per case between Patient, Investigators and Partners',
 'safety',
 'M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z',
 'listing', 'CORRESPONDENCE', 'N', 2),
(gen_random_uuid()::VARCHAR, 'EMAIL_CASES', 'email-cases', 'Email Cases',
 '{"fr":{"label":"Cas par email","description":"Cas reçus par email — triage et traitement en ICSR"},"ja":{"label":"メールケース","description":"メールで受信した有害事象ケース"}}',
 'Adverse event cases received via email — triage and process into ICSRs',
 'safety',
 'M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z',
 'listing', 'EMAIL_CASES', 'N', 3),
(gen_random_uuid()::VARCHAR, 'LITERATURE_CASES', 'literature-cases', 'Literature Cases',
 '{"fr":{"label":"Cas de littérature","description":"Événements indésirables identifiés dans la littérature scientifique"},"ja":{"label":"文献ケース","description":"発表された科学文献から特定された有害事象"}}',
 'Adverse events identified from published scientific literature',
 'safety',
 'M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253',
 'listing', 'LITERATURE_CASES', 'N', 4),
-- Regulatory
(gen_random_uuid()::VARCHAR, 'SUBMISSIONS', 'submissions', 'Regulatory Submissions',
 '{"fr":{"label":"Soumissions réglementaires","description":"Suivi des soumissions aux autorités de santé"},"ja":{"label":"規制当局への提出","description":"保健当局への規制提出の追跡"}}',
 'Track regulatory submissions to health authorities',
 'regulatory',
 'M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z',
 'listing', 'SUBMISSIONS', 'N', 1),
(gen_random_uuid()::VARCHAR, 'INV_DISTRIBUTIONS', 'investigator-distributions', 'Investigator Distributions',
 '{"fr":{"label":"Distributions aux investigateurs","description":"Rapports distribués aux investigateurs"},"ja":{"label":"治験責任医師への配布","description":"治験責任医師に配布されたレポート"}}',
 'Reports distributed to investigators',
 'regulatory',
 'M8 7v8a2 2 0 002 2h6M8 7V5a2 2 0 012-2h4.586a1 1 0 01.707.293l4.414 4.414a1 1 0 01.293.707V15a2 2 0 01-2 2h-2M8 7H6a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2v-2',
 'listing', 'INV_DISTRIBUTIONS', 'N', 2),
-- Dictionaries
(gen_random_uuid()::VARCHAR, 'ACCOUNTS', 'company-units', 'Accounts / Company Units',
 '{"fr":{"label":"Comptes / Unités d''entreprise","description":"Dictionnaire des unités d''entreprise et comptes partenaires"},"ja":{"label":"アカウント / 会社単位","description":"会社単位、子会社、パートナーアカウントの辞書"}}',
 'Dictionary of company units, subsidiaries and partner accounts',
 'dictionaries',
 'M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4',
 'listing', 'ACCOUNTS', 'N', 1),
(gen_random_uuid()::VARCHAR, 'PRODUCTS', 'product-library', 'Products',
 '{"fr":{"label":"Produits","description":"Bibliothèque de médicaments et produits médicinaux"},"ja":{"label":"製品","description":"医薬品および医療製品ライブラリ"}}',
 'Drug and medicinal product library',
 'dictionaries',
 'M9 3a4 4 0 00-4 4v10a4 4 0 008 0V7a4 4 0 00-4-4zm0 2a2 2 0 012 2v4H7V7a2 2 0 012-2zm0 8v4a2 2 0 01-4 0v-4h4zM17.5 3.5l3 3-7 7-1.5-1.5 7-7zM15 13l1.5 1.5-1 1L14 14l1-1zM20 2l2 2-1 1-2-2 1-1z',
 'listing', 'PRODUCTS', 'N', 2),
(gen_random_uuid()::VARCHAR, 'STUDY', 'study-library', 'Study',
 '{"fr":{"label":"Étude","description":"Bibliothèque d''études cliniques et détails d''enregistrement"},"ja":{"label":"試験","description":"臨床試験ライブラリと登録詳細"}}',
 'Clinical study library and registration details',
 'dictionaries',
 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2',
 'listing', 'STUDY', 'N', 3),
(gen_random_uuid()::VARCHAR, 'SUBSTANCE', 'substance-library', 'Substances',
 '{"fr":{"label":"Substances","description":"Substances actives, DCI et classification pharmacologique"},"ja":{"label":"物質","description":"有効成分、INN、薬理学的分類"}}',
 'Active substances, INNs and pharmacological classification',
 'dictionaries',
 'M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z',
 'listing', 'SUBSTANCE', 'N', 4),
(gen_random_uuid()::VARCHAR, 'DEPARTMENTS', 'departments', 'Departments',
 '{"fr":{"label":"Départements","description":"Répertoire des départements internes et partenaires"},"ja":{"label":"部門","description":"社内およびパートナー部門のディレクトリ"}}',
 'Internal and partner department directory',
 'dictionaries',
 'M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4',
 'listing', 'DEPARTMENTS', 'N', 5),
(gen_random_uuid()::VARCHAR, 'CONTACTS', 'contacts', 'Contacts',
 '{"fr":{"label":"Contacts","description":"Déclarants, investigateurs, régulateurs et contacts partenaires"},"ja":{"label":"連絡先","description":"報告者、治験責任医師、規制当局の連絡先"}}',
 'Reporters, investigators, regulators and partner contacts',
 'dictionaries',
 'M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z',
 'listing', 'CONTACTS', 'N', 6),
(gen_random_uuid()::VARCHAR, 'CORR_QUESTION_LIB', 'corr-question-library', 'Correspondence Question Library',
 '{"fr":{"label":"Bibliothèque de questions de correspondance","description":"Questions de suivi standard pour la correspondance de cas"},"ja":{"label":"通信質問ライブラリ","description":"ケース通信のための標準フォローアップ質問"}}',
 'Standard follow-up questions for case correspondence',
 'dictionaries',
 'M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z',
 'listing', 'CORR_QUESTION_LIB', 'N', 7)
ON CONFLICT (MODULE_ID) DO NOTHING;
