-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : STUDY
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- STUDY — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'STUDY','STUDY_FULL_FORM','FORM','{
  "formID": "FULL_FORM",
  "formName": "Study Library",
  "version": "1.0",
  "layout": {
    "recordTitleField": "studyTitle",
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
	"sectionId": "260_001", "title": "lbl.sec_studyDetails", "sequence": 1,
	"fields": [
	  { "fieldId": "260001" },
	  { "fieldId": "260002" },
	  { "fieldId": "260003" },
	  { "fieldId": "260004" },
	  { "fieldId": "260005" },
	  { "fieldId": "260021" },
	  { "fieldId": "260006" },
	  { "fieldId": "260007" },
	  { "fieldId": "260008" },
	  { "fieldId": "260009" },
	  { "fieldId": "260029" },
	  { "fieldId": "260027" },
	  { "fieldId": "260028" }
	],
	"sections":[{
		"sectionId": "260_002", "title": "lbl.sec_sponsorDetails", "sequence": 2,
		"fields": [
		  { "fieldId": "260024" },
		  { "fieldId": "260025" },
		  { "fieldId": "260026" }
		]
	  },
	  {
		"sectionId": "260_003", "title": "lbl.sec_blindingDetails", "sequence": 3,
		"fields": [
		  { "fieldId": "260010" },
		  { "fieldId": "260011" },
		  { "fieldId": "260013" },
		  { "fieldId": "260015" }
		]
	  }
    ]
  },
  {
	"sectionId": "260_004", "title": "lbl.sec_regulatoryIds", "sequence": 4,
	"fields": [
	  { "fieldId": "260012" },
	  { "fieldId": "260016" },
	  { "fieldId": "260018" },
	  { "fieldId": "260019" },
	  { "fieldId": "260022" },
	  { "fieldId": "260023" },
	  { "fieldId": "260014" },
	  { "fieldId": "260017" },
	  { "fieldId": "260020" }
	]
  },
  {
	"sectionId": "261_001", "title": "lbl.sec_studyProducts", "sequence": 5, "multiContext": true,
	"contextPath": "studyProducts$",
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10] },
	"fields": [
	  { "fieldId": "261001" },
	  { "fieldId": "261002" },
	  { "fieldId": "261003" }
	],
	"gridFields": [
	  { "fieldId": "261001" },
	  { "fieldId": "261002" },
	  { "fieldId": "261003" }
	]
  },
  {
	"sectionId": "262_001", "title": "lbl.sec_studyRegs", "sequence": 6, "multiContext": true,
	"contextPath": "studyRegs$",
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10] },
	"fields": [
	  { "fieldId": "262001" },
	  { "fieldId": "262002" },
	  { "fieldId": "262003" },
	  { "fieldId": "262004" },
	  { "fieldId": "262005" },
	  { "fieldId": "262006" },
	  { "fieldId": "262007" },
	  { "fieldId": "262008" }
	],
	"gridFields": [
	  { "fieldId": "262001" },
	  { "fieldId": "262002" },
	  { "fieldId": "262003" },
	  { "fieldId": "262004" },
	  { "fieldId": "262008" }
	]
  },
  {
	"sectionId": "263_001", "title": "lbl.sec_crossRefInds", "sequence": 7, "multiContext": true,
	"contextPath": "crossRefInds$",
	"dataGridConfig": { "allowAdd": true, "allowDelete": true, "allowCopy": false, "pagination": true, "pageSizeOptions": [5, 10] },
	"fields": [
	  { "fieldId": "263001" },
	  { "fieldId": "263002" }
	],
	"gridFields": [
	  { "fieldId": "263001" },
	  { "fieldId": "263002" }
	]
  }]
}') ON CONFLICT (NAME) DO NOTHING;

-- STUDY — LISTING
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'STUDY','STUDY_LISTING','LISTING','{
  "module": "STUDY",
  "title": "Study Library",
  "FILTERS_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260008" },
    { "fieldId": "260009" },
    { "fieldId": "260003", "renderAs":"combo", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260002" },
    { "fieldId": "260004" },
    { "fieldId": "260008" },
    { "fieldId": "260009" },
    { "fieldId": "260025" },
    { "fieldId": "260027" },
    { "fieldId": "260028" },
    { "fieldId": "260003" }
  ],
  "DASHBOARD_WIDGETS": [
    { "widgetId": "totalStudies",    "label": "lbl.widget_totalStudies",    "iconColor": "blue",   "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2", "filters": [] },
    { "widgetId": "activeStudies",   "label": "lbl.widget_activeStudies",   "iconColor": "green",  "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z", "filters": [{ "field": "isActive", "operator": "eq", "value": "Y" }] },
    { "widgetId": "clinicalTrials",  "label": "lbl.widget_clinicalTrials",  "iconColor": "purple", "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2", "filters": [{ "field": "studyType", "operator": "eq", "value": "CLINICAL_TRIAL" }] }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- STUDY — LOOKUP
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'STUDY','STUDY_LOOKUP','LOOKUP','{
  "module": "STUDY",
  "title": "Study Library",
  "lookupModule": "STUDY",
  "storeValField": "projectNo",
  "lkpStoreValField": "projectNo",
  "lkpDispValField": "studyTitle",
  "FILTERS_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260004" },
    { "fieldId": "260008" },
    { "fieldId": "260003", "dataValues": [{"code":"Y","decode":"Yes"},{"code":"N","decode":"No"}] }
  ],
  "GRID_FIELDS": [
    { "fieldId": "260001" },
    { "fieldId": "260004" },
    { "fieldId": "260008" },
    { "fieldId": "260003" }
  ]
}') ON CONFLICT (NAME) DO NOTHING;

-- STUDY — I18N
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'STUDY','STUDY_I18N','I18N','{
  "en": {
    "lbl.projectNo":              "Project No.",
    "lbl.sponsorStudyNo":         "Sponsor Study No.",
    "lbl.active":                 "Active",
    "lbl.studyTitle":             "Study Title",
    "lbl.studyDetails":           "Study Details",
    "lbl.studyDesign":            "Study Design",
    "lbl.primarySource":          "Primary Source",
    "lbl.studyPhase":             "Study Phase",
    "lbl.studyType":              "Study Type",
    "lbl.blindedStudy":           "Blinded Study",
    "lbl.blindingTechnique":      "Blinding Technique",
    "lbl.eudractNo":              "EudraCT No.",
    "lbl.codeStatus":             "Code Status",
    "lbl.primaryTestCompound":    "Primary Test Compound",
    "lbl.codeBrokenOn":           "Code Broken On",
    "lbl.clinicaltrialsGovId":    "ClinicalTrials.gov ID",
    "lbl.studyDesignDescription": "Study Design Description",
    "lbl.primaryInd":             "Primary IND#",
    "lbl.panda":                  "PANDA#",
    "lbl.protocolDetails":        "Protocol Details",
    "lbl.studyAcronym":           "Study Acronym",
    "lbl.euCtRegulation2019":     "EU CT Regulation 2019",
    "lbl.ctdToCtrTransitionDate": "CTD to CTR Transition Date",
    "lbl.sponsorCode":            "Sponsor Code",
    "lbl.sponsorName":            "Sponsor Name",
    "lbl.sponsorType":            "Sponsor Type",
    "lbl.studyStartDate":         "Study Start Date",
    "lbl.studyEndDate":           "Study End Date",
    "lbl.globalEnrollmentCount":  "Global Study Enrollment Count",
    "lbl.productCode":            "Product Code",
    "lbl.productName":            "Product Name",
    "lbl.studyProductType":       "Study Product Type",
    "lbl.registrationNumber":     "Registration Number",
    "lbl.authority":              "Authority",
    "lbl.registrationCountry":    "Registration Country",
    "lbl.trialStatus":            "Status of the Trial",
    "lbl.responsibleOpu":         "Responsible OPU",
    "lbl.localApprovalNumber":    "Local Approval Number",
    "lbl.ecReportingFlag":        "EC Reporting Flag",
    "lbl.studyRegistrationDate":  "Study Registration Date",
    "lbl.crossRefInd":            "Cross Referenced IND#",
    "lbl.sec_studyDetails":       "Study Details",
    "lbl.sec_sponsorDetails":     "Sponsor Details",
    "lbl.sec_blindingDetails":    "Blinding Details",
    "lbl.sec_regulatoryIds":      "Regulatory Identifiers",
    "lbl.sec_studyProducts":      "Study Products",
    "lbl.sec_studyRegs":          "Study Registration Information",
    "lbl.sec_crossRefInds":       "Cross Referenced INDs",
    "lbl.widget_totalStudies":    "Total Studies",
    "lbl.widget_activeStudies":   "Active",
    "lbl.widget_clinicalTrials":  "Clinical Trials"
  },
  "fr": {
    "lbl.projectNo":              "N° de projet",
    "lbl.sponsorStudyNo":         "N° d''étude promoteur",
    "lbl.active":                 "Actif",
    "lbl.studyTitle":             "Titre de l''étude",
    "lbl.studyDetails":           "Détails de l''étude",
    "lbl.studyDesign":            "Schéma de l''étude",
    "lbl.primarySource":          "Source primaire",
    "lbl.studyPhase":             "Phase de l''étude",
    "lbl.studyType":              "Type d''étude",
    "lbl.blindedStudy":           "Étude en aveugle",
    "lbl.blindingTechnique":      "Technique d''aveugle",
    "lbl.eudractNo":              "N° EudraCT",
    "lbl.codeStatus":             "Statut du code",
    "lbl.primaryTestCompound":    "Composé test principal",
    "lbl.codeBrokenOn":           "Code levé le",
    "lbl.clinicaltrialsGovId":    "ID ClinicalTrials.gov",
    "lbl.studyDesignDescription": "Description du schéma",
    "lbl.primaryInd":             "IND principal",
    "lbl.panda":                  "PANDA",
    "lbl.protocolDetails":        "Détails du protocole",
    "lbl.studyAcronym":           "Acronyme de l''étude",
    "lbl.euCtRegulation2019":     "Règlement UE CT 2019",
    "lbl.ctdToCtrTransitionDate": "Date de transition CTD vers CTR",
    "lbl.sponsorCode":            "Code promoteur",
    "lbl.sponsorName":            "Nom du promoteur",
    "lbl.sponsorType":            "Type de promoteur",
    "lbl.studyStartDate":         "Date de début",
    "lbl.studyEndDate":           "Date de fin",
    "lbl.globalEnrollmentCount":  "Effectif mondial",
    "lbl.productCode":            "Code produit",
    "lbl.productName":            "Nom du produit",
    "lbl.studyProductType":       "Type de produit d''étude",
    "lbl.registrationNumber":     "Numéro d''enregistrement",
    "lbl.authority":              "Autorité",
    "lbl.registrationCountry":    "Pays d''enregistrement",
    "lbl.trialStatus":            "Statut de l''essai",
    "lbl.responsibleOpu":         "OPU responsable",
    "lbl.localApprovalNumber":    "Numéro d''approbation local",
    "lbl.ecReportingFlag":        "Indicateur de rapport CE",
    "lbl.studyRegistrationDate":  "Date d''enregistrement",
    "lbl.crossRefInd":            "IND référencé croisé",
    "lbl.sec_studyDetails":       "Détails de l''étude",
    "lbl.sec_sponsorDetails":     "Détails du promoteur",
    "lbl.sec_blindingDetails":    "Détails de l''aveugle",
    "lbl.sec_regulatoryIds":      "Identifiants réglementaires",
    "lbl.sec_studyProducts":      "Produits de l''étude",
    "lbl.sec_studyRegs":          "Informations d''enregistrement",
    "lbl.sec_crossRefInds":       "IND référencés croisés",
    "lbl.widget_totalStudies":    "Total études",
    "lbl.widget_activeStudies":   "Actif",
    "lbl.widget_clinicalTrials":  "Essais cliniques"
  },
  "ja": {
    "lbl.projectNo":              "プロジェクト番号",
    "lbl.sponsorStudyNo":         "スポンサー試験番号",
    "lbl.active":                 "有効",
    "lbl.studyTitle":             "試験タイトル",
    "lbl.studyDetails":           "試験詳細",
    "lbl.studyDesign":            "試験デザイン",
    "lbl.primarySource":          "一次情報源",
    "lbl.studyPhase":             "試験フェーズ",
    "lbl.studyType":              "試験種別",
    "lbl.blindedStudy":           "盲検試験",
    "lbl.blindingTechnique":      "盲検化手法",
    "lbl.eudractNo":              "EudraCT番号",
    "lbl.codeStatus":             "コードステータス",
    "lbl.primaryTestCompound":    "主要被験薬",
    "lbl.codeBrokenOn":           "コード開封日",
    "lbl.clinicaltrialsGovId":    "ClinicalTrials.gov ID",
    "lbl.studyDesignDescription": "試験デザイン説明",
    "lbl.primaryInd":             "主要IND番号",
    "lbl.panda":                  "PANDA番号",
    "lbl.protocolDetails":        "プロトコル詳細",
    "lbl.studyAcronym":           "試験略称",
    "lbl.euCtRegulation2019":     "EU CT規則2019",
    "lbl.ctdToCtrTransitionDate": "CTDからCTRへの移行日",
    "lbl.sponsorCode":            "スポンサーコード",
    "lbl.sponsorName":            "スポンサー名",
    "lbl.sponsorType":            "スポンサー種別",
    "lbl.studyStartDate":         "試験開始日",
    "lbl.studyEndDate":           "試験終了日",
    "lbl.globalEnrollmentCount":  "グローバル登録数",
    "lbl.productCode":            "製品コード",
    "lbl.productName":            "製品名",
    "lbl.studyProductType":       "試験製品種別",
    "lbl.registrationNumber":     "登録番号",
    "lbl.authority":              "当局",
    "lbl.registrationCountry":    "登録国",
    "lbl.trialStatus":            "試験ステータス",
    "lbl.responsibleOpu":         "担当OPU",
    "lbl.localApprovalNumber":    "現地承認番号",
    "lbl.ecReportingFlag":        "EC報告フラグ",
    "lbl.studyRegistrationDate":  "試験登録日",
    "lbl.crossRefInd":            "相互参照IND番号",
    "lbl.sec_studyDetails":       "試験詳細",
    "lbl.sec_sponsorDetails":     "スポンサー詳細",
    "lbl.sec_blindingDetails":    "盲検詳細",
    "lbl.sec_regulatoryIds":      "規制識別子",
    "lbl.sec_studyProducts":      "試験製品",
    "lbl.sec_studyRegs":          "試験登録情報",
    "lbl.sec_crossRefInds":       "相互参照IND",
    "lbl.widget_totalStudies":    "試験合計",
    "lbl.widget_activeStudies":   "有効",
    "lbl.widget_clinicalTrials":  "臨床試験"
  }
}') ON CONFLICT (NAME) DO NOTHING;
