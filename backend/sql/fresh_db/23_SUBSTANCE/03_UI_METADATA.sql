-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : SUBSTANCE
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- SUBSTANCE — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'SUBSTANCE','SUBSTANCE_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Substance Library",
  "version": "2.0",
  "layout": {
    "recordTitleField": "substanceName",
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
	"sectionId": "250_001", "title": "lbl.sec_substanceDetails", "sequence": 1,
	"fields": [
	  { "fieldId": "250001" },
	  { "fieldId": "250003" },
	  { "fieldId": "250010" },
	  { "fieldId": "250002" },
	  { "fieldId": "250004" },
	  { "fieldId": "250005" },
	  { "fieldId": "250012" },
	  { "fieldId": "250011" }
	],
	"sections":[{
		"sectionId": "250_002", "title": "lbl.sec_strengthDetails", "sequence": 2,
		"fields": [
		  { "fieldId": "250006" },
		  { "fieldId": "250007" },
		  { "fieldId": "250008" },
		  { "fieldId": "250009" }
		]
    }]
  },
  {
	"sectionId": "255_001", "title": "lbl.sec_synonyms", "sequence": 3, "multiContext": true, "contextPath": "synonyms$",
	"dataGridConfig": {},
	"fields": [
	  { "fieldId": "255001" },
	  { "fieldId": "255002" }
	],
	"gridFields": [
	  { "fieldId": "255001" },
	  { "fieldId": "255002" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- SUBSTANCE — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'SUBSTANCE','SUBSTANCE_LISTING','LISTING','{
  "module": "SUBSTANCE",
  "title": "Substance Library",
  "FILTERS_FIELDS": [
    { "fieldId": "250001" },
    { "fieldId": "250002" },
    { "fieldId": "250003" },
    { "fieldId": "250005" },
    { "fieldId": "250012" },
    { "fieldId": "250004", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "250001" },
    { "fieldId": "250002" },
    { "fieldId": "250003" },
    { "fieldId": "250005" },
    { "fieldId": "250007" },
    { "fieldId": "250008" },
    { "fieldId": "250011" },
    { "fieldId": "250004" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalSubstances",  "label": "lbl.widget_totalSubstances",  "iconColor": "blue",   "icon": "M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z", "filters": [] },
    { "widgetId": "activeSubstances", "label": "lbl.widget_activeSubstances", "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] },
    { "widgetId": "activeRole",       "label": "lbl.widget_activeRole",       "iconColor": "purple", "icon": "M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z", "filters": [{ "field": "substanceRole", "operator": "eq", "value": "ACTIVE" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- SUBSTANCE — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'SUBSTANCE','SUBSTANCE_LOOKUP','LOOKUP','{
  "module": "SUBSTANCE",
  "title": "Substance Library",
  "lookupModule": "SUBSTANCE",
  "storeValField": "substanceId",
  "lkpStoreValField": "substanceId",
  "lkpDispValField": "substanceName",
  "FILTERS_FIELDS": [
    { "fieldId": "250001" },
    { "fieldId": "250002" },
    { "fieldId": "250005" },
    { "fieldId": "250004", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "250001" },
    { "fieldId": "250002" },
    { "fieldId": "250005" },
    { "fieldId": "250004" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- SUBSTANCE — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'SUBSTANCE','SUBSTANCE_I18N','I18N','{
  "en": {
    "lbl.substanceId":            "Substance ID",
    "lbl.substanceName":          "Substance Name",
    "lbl.genericSubstanceCode":   "Generic Substance Code",
    "lbl.active":                 "Active",
    "lbl.substanceRole":          "Substance Role",
    "lbl.isStructured":           "Is Structured Substance",
    "lbl.strength":               "Strength",
    "lbl.unit":                   "Unit",
    "lbl.unstructuredStrength":   "Unstructured Strength",
    "lbl.substanceTermId":        "Substance Term ID",
    "lbl.manufacturerName":       "Manufacturer Name",
    "lbl.classOfIngredient":      "Class of Ingredient",
    "lbl.synonymName":            "Synonym Name",
    "lbl.sec_substanceDetails":   "Substance Details",
    "lbl.sec_strengthDetails":    "Strength Details",
    "lbl.sec_synonyms":           "Synonyms",
    "lbl.widget_totalSubstances": "Total Substances",
    "lbl.widget_activeSubstances":"Active",
    "lbl.widget_activeRole":      "Active Substances"
  },
  "fr": {
    "lbl.substanceId":            "ID substance",
    "lbl.substanceName":          "Nom de la substance",
    "lbl.genericSubstanceCode":   "Code substance générique",
    "lbl.active":                 "Actif",
    "lbl.substanceRole":          "Rôle de la substance",
    "lbl.isStructured":           "Substance structurée",
    "lbl.strength":               "Concentration",
    "lbl.unit":                   "Unité",
    "lbl.unstructuredStrength":   "Concentration non structurée",
    "lbl.substanceTermId":        "ID terme substance",
    "lbl.manufacturerName":       "Nom du fabricant",
    "lbl.classOfIngredient":      "Classe d''ingrédient",
    "lbl.synonymName":            "Nom du synonyme",
    "lbl.sec_substanceDetails":   "Détails de la substance",
    "lbl.sec_strengthDetails":    "Détails de la concentration",
    "lbl.sec_synonyms":           "Synonymes",
    "lbl.widget_totalSubstances": "Total substances",
    "lbl.widget_activeSubstances":"Actif",
    "lbl.widget_activeRole":      "Substances actives"
  },
  "ja": {
    "lbl.substanceId":            "物質ID",
    "lbl.substanceName":          "物質名",
    "lbl.genericSubstanceCode":   "一般物質コード",
    "lbl.active":                 "有効",
    "lbl.substanceRole":          "物質の役割",
    "lbl.isStructured":           "構造化物質",
    "lbl.strength":               "含量",
    "lbl.unit":                   "単位",
    "lbl.unstructuredStrength":   "非構造化含量",
    "lbl.substanceTermId":        "物質TermID",
    "lbl.manufacturerName":       "製造業者名",
    "lbl.classOfIngredient":      "成分分類",
    "lbl.synonymName":            "同義語名",
    "lbl.sec_substanceDetails":   "物質詳細",
    "lbl.sec_strengthDetails":    "含量詳細",
    "lbl.sec_synonyms":           "同義語",
    "lbl.widget_totalSubstances": "物質合計",
    "lbl.widget_activeSubstances":"有効",
    "lbl.widget_activeRole":      "有効成分"
  }
}') ON CONFLICT (NAME) DO NOTHING;
