-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : DEPARTMENTS
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- DEPARTMENTS — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'DEPARTMENTS','DEPARTMENTS_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Departments",
  "version": "2.0",
  "layout": {
    "recordTitleField": "departmentName",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
    { "actionId": "save",   "label": "app.save",   "icon": "save",  "type": "standard" },
    { "actionId": "cancel", "label": "app.cancel", "icon": "close" }
  ],
  "sections": [{
	"sectionId": "240_001", "title": "lbl.sec_deptDetails", "sequence": 1, "multiContext": false,
	"fields": [
	  { "fieldId": "240001" },
	  { "fieldId": "240002" },
	  { "fieldId": "240003" },
	  { "fieldId": "240004" },
	  { "fieldId": "240005" },
	  { "fieldId": "240006" }
	]
  },
  {
	"sectionId": "240_002", "title": "lbl.sec_contactDetails", "sequence": 2, "multiContext": false,
	"fields": [
	  { "fieldId": "240007" },
	  { "fieldId": "240008" },
	  { "fieldId": "240009" },
	  { "fieldId": "240010" },
	  { "fieldId": "240011" },
	  { "fieldId": "240012" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- DEPARTMENTS — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'DEPARTMENTS','DEPARTMENTS_LISTING','LISTING','{
  "module": "DEPARTMENTS",
  "title": "Departments",
  "FILTERS_FIELDS": [
    { "fieldId": "240001" },
    { "fieldId": "240002" },
    { "fieldId": "240003" },
    { "fieldId": "240006", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "240001" },
    { "fieldId": "240002" },
    { "fieldId": "240003" },
    { "fieldId": "240004" },
    { "fieldId": "240005" },
    { "fieldId": "240006" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalDepts",  "label": "lbl.widget_totalDepts",  "iconColor": "blue",  "icon": "M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-2 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4", "filters": [] },
    { "widgetId": "activeDepts", "label": "lbl.widget_activeDepts", "iconColor": "green", "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- DEPARTMENTS — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'DEPARTMENTS','DEPARTMENTS_LOOKUP','LOOKUP','{
  "module": "DEPARTMENTS",
  "title": "Departments",
  "FILTERS_FIELDS": [
    { "fieldId": "240001" },
    { "fieldId": "240002" },
    { "fieldId": "240006", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "240001" },
    { "fieldId": "240002" },
    { "fieldId": "240003" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- DEPARTMENTS — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'DEPARTMENTS','DEPARTMENTS_I18N','I18N','{
  "en": {
    "lbl.departmentCode":       "Department Code",
    "lbl.departmentName":       "Department Name",
    "lbl.contactPerson":        "Contact Person",
    "lbl.emailId":              "Email ID",
    "lbl.reportNotification":   "Report Notification",
    "lbl.active":               "Active",
    "lbl.phoneCountryCode":     "Country Code",
    "lbl.phoneAreaCode":        "Area Code",
    "lbl.phoneNumber":          "Ph Number",
    "lbl.faxCountryCode":       "Country Code",
    "lbl.faxAreaCode":          "Area Code",
    "lbl.faxNumber":            "Number",
    "lbl.sec_deptDetails":      "Department Details",
    "lbl.sec_contactDetails":   "Contact Details",
    "lbl.widget_totalDepts":    "Total Departments",
    "lbl.widget_activeDepts":   "Active"
  },
  "fr": {
    "lbl.departmentCode":       "Code département",
    "lbl.departmentName":       "Nom du département",
    "lbl.contactPerson":        "Personne de contact",
    "lbl.emailId":              "Adresse e-mail",
    "lbl.reportNotification":   "Notification de rapport",
    "lbl.active":               "Actif",
    "lbl.phoneCountryCode":     "Indicatif pays",
    "lbl.phoneAreaCode":        "Indicatif régional",
    "lbl.phoneNumber":          "Numéro de téléphone",
    "lbl.faxCountryCode":       "Indicatif pays",
    "lbl.faxAreaCode":          "Indicatif régional",
    "lbl.faxNumber":            "Numéro de fax",
    "lbl.sec_deptDetails":      "Détails du département",
    "lbl.sec_contactDetails":   "Coordonnées",
    "lbl.widget_totalDepts":    "Total départements",
    "lbl.widget_activeDepts":   "Actif"
  },
  "ja": {
    "lbl.departmentCode":       "部門コード",
    "lbl.departmentName":       "部門名",
    "lbl.contactPerson":        "担当者",
    "lbl.emailId":              "メールアドレス",
    "lbl.reportNotification":   "レポート通知",
    "lbl.active":               "有効",
    "lbl.phoneCountryCode":     "国番号",
    "lbl.phoneAreaCode":        "市外局番",
    "lbl.phoneNumber":          "電話番号",
    "lbl.faxCountryCode":       "国番号",
    "lbl.faxAreaCode":          "市外局番",
    "lbl.faxNumber":            "ファックス番号",
    "lbl.sec_deptDetails":      "部門詳細",
    "lbl.sec_contactDetails":   "連絡先情報",
    "lbl.widget_totalDepts":    "部門合計",
    "lbl.widget_activeDepts":   "有効"
  }
}') ON CONFLICT (NAME) DO NOTHING;
