-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : APP_USERS
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- APP_USERS — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_USERS','USERS_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "User Management",
  "version": "2.0",
  "layout": {
    "recordTitleField": "fullName",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
    { "actionId": "save",         "label": "app.save",         "icon": "save",     "type": "standard" },
    { "actionId": "resetPassword","label": "app.resetPassword","icon": "key",      "type": "moreAction" },
    { "actionId": "cancel",       "label": "app.cancel",       "icon": "close" }
  ],
  "sections": [{
	"sectionId": "130", "title": "lbl.sec_userDetails", "sequence": 1, "multiContext": false,
	"fields": [
	  { "fieldId": "130001" },
	  { "fieldId": "130002" },
	  { "fieldId": "130003" },
	  { "fieldId": "130007" },
	  { "fieldId": "130005" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_USERS — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_USERS','USERS_LISTING','LISTING','{
  "module": "APP_USERS",
  "title": "User Management",
  "FILTERS_FIELDS": [
    { "fieldId": "130001" },
    { "fieldId": "130002" },
    { "fieldId": "130003" },
    { "fieldId": "130007", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "130001" },
    { "fieldId": "130002" },
    { "fieldId": "130003" },
    { "fieldId": "130005" },
    { "fieldId": "130006" },
    { "fieldId": "130007" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalUsers",  "label": "lbl.widget_totalUsers",  "iconColor": "blue",  "icon": "M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z", "filters": [] },
    { "widgetId": "activeUsers", "label": "lbl.widget_activeUsers", "iconColor": "green", "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_USERS — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_USERS','USERS_LOOKUP','LOOKUP','{
  "module": "APP_USERS",
  "title": "Users",
  "FILTERS_FIELDS": [
    { "fieldId": "130001" },
    { "fieldId": "130002" }
  ],
  "GRID_FIELDS": [
    { "fieldId": "130001" },
    { "fieldId": "130002" },
    { "fieldId": "130003" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- APP_USERS — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'APP_USERS','USERS_I18N','I18N','{
  "en": {
    "lbl.userName":             "Username",
    "lbl.fullName":             "Full Name",
    "lbl.emailId":              "Email",
    "lbl.passwordHash":         "Password",
    "lbl.roles":                "Roles",
    "lbl.lastLogin":            "Last Login",
    "lbl.active":               "Active",
    "lbl.sec_userDetails":      "User Details",
    "lbl.widget_totalUsers":    "Total Users",
    "lbl.widget_activeUsers":   "Active"
  },
  "fr": {
    "lbl.userName":             "Nom d''utilisateur",
    "lbl.fullName":             "Nom complet",
    "lbl.emailId":              "Email",
    "lbl.passwordHash":         "Mot de passe",
    "lbl.roles":                "Rôles",
    "lbl.lastLogin":            "Dernière connexion",
    "lbl.active":               "Actif",
    "lbl.sec_userDetails":      "Détails de l''utilisateur",
    "lbl.widget_totalUsers":    "Total utilisateurs",
    "lbl.widget_activeUsers":   "Actif"
  },
  "ja": {
    "lbl.userName":             "ユーザー名",
    "lbl.fullName":             "氏名",
    "lbl.emailId":              "メールアドレス",
    "lbl.passwordHash":         "パスワード",
    "lbl.roles":                "ロール",
    "lbl.lastLogin":            "最終ログイン",
    "lbl.active":               "有効",
    "lbl.sec_userDetails":      "ユーザー詳細",
    "lbl.widget_totalUsers":    "ユーザー合計",
    "lbl.widget_activeUsers":   "有効"
  }
}') ON CONFLICT (NAME) DO NOTHING;
