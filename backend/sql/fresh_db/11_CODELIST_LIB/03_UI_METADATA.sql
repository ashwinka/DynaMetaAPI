-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Purpose : UI_METADATA entries — FORM, LISTING, LOOKUP, I18N
-- ============================================================

-- CODELIST_LIB — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CODELIST_LIB','CODELIST_LIB_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Codelist Library",
  "version": "1.0",
  "layout": {
    "recordTitleField": "codeListId",
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
    "sectionId": "150", "title": "Codelist", "sequence": 1, "multiContext": false,
    "sections": [
      {
        "sectionId": "150_001", "title": "lbl.cl_details", "sequence": 1, "multiContext": false, "tabPanel": true,
        "fields": [
          { "fieldId": "150001"},
          { "fieldId": "150003"},
		  { "fieldId": "150002"}          
        ]
      },
      {
        "sectionId": "155_001", "title": "lbl.cl_vals", "sequence": 2, "multiContext": true,
        "contextPath": "values$", "tabPanel": true,
        "dataGridConfig": {"disableDelete":true},
        "fields": [
          { "fieldId": "155001"},
          { "fieldId": "155002"},
          { "fieldId": "155004"},
		  { "fieldId": "155005"},
          { "fieldId": "155003"}
          
        ],
        "gridFields": [
          { "fieldId": "155001"},
          { "fieldId": "155002"},
          { "fieldId": "155004"},
		  { "fieldId": "155005"}
        ]
      }
    ]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- CODELIST_LIB — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CODELIST_LIB','CODELIST_LIB_LISTING','LISTING','{
  "module": "CODELIST_LIB",
  "title": "Codelist Library",
  "FILTERS_FIELDS": [
    { "fieldId": "150001"},
    { "fieldId": "150002", "renderAs":"text"},
    { "fieldId": "150003", "renderAs":"combo", "dataValues":[{"code":"Y", "decode":"Yes"},{"code":"N", "decode":"No"}]}
  ],
  "GRID_FIELDS": [
    { "fieldId": "150001"},
    { "fieldId": "150003"},
    { "fieldId": "150002"}
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalCodelists",  "label": "Total Codelists", "iconColor": "blue",  "icon": "M4 6h16M4 10h16M4 14h16M4 18h16", "filters": [] },
    { "widgetId": "activeCodelists", "label": "Active",          "iconColor": "green", "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CODELIST_LIB — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CODELIST_LIB','CODELIST_LIB_LOOKUP','LOOKUP','{
  "module": "CODELIST_LIB",
  "title": "Codelist Library",
  "FILTERS_FIELDS": [
    { "fieldId": "150001"},
    { "fieldId": "150002", "renderAs":"text"},
    { "fieldId": "150003", "renderAs":"combo", "dataValues":[{"code":"Y", "decode":"Yes"},{"code":"N", "decode":"No"}]}
  ],
  "GRID_FIELDS": [
    { "fieldId": "150001"},
    { "fieldId": "150002"}
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- CODELIST_LIB — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'CODELIST_LIB','CODELIST_LIB_I18N','I18N','{
  "en": {
    "lbl.codeListId":   "Codelist ID",
    "lbl.description":  "Description",
    "lbl.active":       "Active",
	"lbl.cl_details":	"Codelist Details",
	"lbl.cl_vals":		"Codelist Values",
    "lbl.code":         "Code",
    "lbl.decode":       "Decode",
    "lbl.translations": "Translations (JSON)",
    "lbl.sequence":     "Sequence",
    "sec.details":      "Codelist Details",
    "sec.values":       "Codelist Values"
  }
}') ON CONFLICT (NAME) DO NOTHING;
