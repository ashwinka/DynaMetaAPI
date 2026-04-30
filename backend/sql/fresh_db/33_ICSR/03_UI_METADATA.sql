-- ============================================================
-- MetaDyna API — Common Tenant Schema
-- Script  : 03_UI_METADATA.sql
-- Module  : ICSR Cases
-- Purpose : FORM, LISTING, LOOKUP, I18N metadata
--           Form sections reference fieldId only — all render
--           config lives in TABLE_COLUMN_METADATA.UI_METADATA.
-- ============================================================

-- ICSR FULL — FORM
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ICSR' AND TYPE='FORM';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ICSR','ICSR_FULL_FORM','FORM','
{
  "formID": "ICSR_FULL_FORM",
  "formName": "ICSR Cases Details",
  "version": "2.0",
  "layout": {
    "recordTitleField": "receiptNo",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
	{ "actionId": "switchForm", "label": "app.switchForm",  "icon": "swap",  "type": "standard" },
    { "actionId": "save",   	"label": "app.save",   		"icon": "save",  "type": "standard" },
    { "actionId": "cancel", 	"label": "app.cancel", 		"icon": "close" }
  ],
  "sections":[{
	  "sectionId": "500",
	  "title": "lbl.sec_caseHeader",
	  "sequence": 1,
	  "sections": [

		{
		  "sectionId": "500_001",
		  "title": "lbl.sec_caseIdentification",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "500001" },
			{ "fieldId": "500002" },
			{ "fieldId": "500003" },
			{ "fieldId": "500031" },
			{ "fieldId": "500032" },
			{ "fieldId": "500033" },
			{ "fieldId": "500072" },
			{ "fieldId": "500073" },
			{ "fieldId": "500017" },
			{ "fieldId": "500018" }
		  ]
		},

		{
		  "sectionId": "500_002",
		  "title": "lbl.sec_reportClassification",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "500011" },
			{ "fieldId": "500041" },
			{ "fieldId": "500015" },
			{ "fieldId": "500016" },
			{ "fieldId": "500036" },
			{ "fieldId": "500037" },
			{ "fieldId": "500038" },
			{ "fieldId": "500039" },
			{ "fieldId": "500040" },
			{ "fieldId": "500042" },
			{ "fieldId": "500034" },
			{ "fieldId": "500035" },
			{ "fieldId": "500088" }
		  ]
		},

		{
		  "sectionId": "500_003",
		  "title": "lbl.sec_caseDates",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "500007" },
			{ "fieldId": "500008" },
			{ "fieldId": "500009" },
			{ "fieldId": "500010" },
			{ "fieldId": "500052" },
			{ "fieldId": "500053" },
			{ "fieldId": "500050" },
			{ "fieldId": "500051" },
			{ "fieldId": "500048" },
			{ "fieldId": "500049" },
			{ "fieldId": "500102" }
		  ]
		},

		{
		  "sectionId": "500_004",
		  "title": "lbl.sec_seriousness",
		  "sequence": 4,
		  "fields": [
			{ "fieldId": "500021" },
			{ "fieldId": "500022" },
			{ "fieldId": "500023" },
			{ "fieldId": "500024" },
			{ "fieldId": "500025" },
			{ "fieldId": "500026" },
			{ "fieldId": "500027" },
			{ "fieldId": "500028" }
		  ]
		},

		{
		  "sectionId": "500_005",
		  "title": "lbl.sec_caseFlags",
		  "sequence": 5,
		  "fields": [
			{ "fieldId": "500012" },
			{ "fieldId": "500013" },
			{ "fieldId": "500014" },
			{ "fieldId": "500043" },
			{ "fieldId": "500044" },
			{ "fieldId": "500045" },
			{ "fieldId": "500095" },
			{ "fieldId": "500103" },
			{ "fieldId": "500104" },
			{ "fieldId": "500054" },
			{ "fieldId": "500046" }
		  ]
		},

		{
		  "sectionId": "500_006",
		  "title": "lbl.sec_assignmentOrg",
		  "sequence": 6,
		  "fields": [
			{ "fieldId": "500065" },
			{ "fieldId": "500066" },
			{ "fieldId": "500067" },
			{ "fieldId": "500068" },
			{ "fieldId": "500069" },
			{ "fieldId": "500063" },
			{ "fieldId": "500064" },
			{ "fieldId": "500062" },
			{ "fieldId": "500061" },
			{ "fieldId": "500070" },
			{ "fieldId": "500071" },
			{ "fieldId": "500074" }
		  ]
		},

		{
		  "sectionId": "500_007",
		  "title": "lbl.sec_followUp",
		  "sequence": 7,
		  "fields": [
			{ "fieldId": "500055" },
			{ "fieldId": "500056" },
			{ "fieldId": "500057" },
			{ "fieldId": "500105" },
			{ "fieldId": "500058" },
			{ "fieldId": "500059" }
		  ]
		},

		{
		  "sectionId": "500_008",
		  "title": "lbl.sec_nonCase",
		  "sequence": 8,
		  "renderCondition": "RULE_ICSR_NON_CASE_SECTION",
		  "fields": [
			{ "fieldId": "500083" },
			{ "fieldId": "500084" },
			{ "fieldId": "500085" },
			{ "fieldId": "500086" },
			{ "fieldId": "500087" }
		  ]
		},

		{
		  "sectionId": "500_009",
		  "title": "lbl.sec_codingStatus",
		  "sequence": 9,
		  "fields": [
			{ "fieldId": "500076" },
			{ "fieldId": "500077" },
			{ "fieldId": "500078" },
			{ "fieldId": "500079" },
			{ "fieldId": "500080" },
			{ "fieldId": "500081" },
			{ "fieldId": "500082" }
		  ]
		},

		{
		  "sectionId": "500_010",
		  "title": "lbl.sec_adminAudit",
		  "sequence": 10,
		  "fields": [
			{ "fieldId": "500047" },
			{ "fieldId": "500099" },
			{ "fieldId": "500100" },
			{ "fieldId": "500101" },
			{ "fieldId": "500102" },
			{ "fieldId": "500096" },
			{ "fieldId": "500097" },
			{ "fieldId": "500098" },
			{ "fieldId": "500089" },
			{ "fieldId": "500090" },
			{ "fieldId": "500091" },
			{ "fieldId": "500092" },
			{ "fieldId": "500093" },
			{ "fieldId": "500094" },
			{ "fieldId": "500106" },
			{ "fieldId": "500107" },
			{ "fieldId": "500108" }
		  ]
		},
		{
			  "sectionId": "510_001",
			  "title": "lbl.sec_caseDocuments",
			  "tabPanel": true,
			  "sequence": 1,
			  "multiContext": true,
			  "contextPath": "caseDocuments$",
			  "renderCondition": "RULE_ICSR_DOCS_SECTION",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": true,
				"pageSizeOptions": [5, 10]
			  },
			  "fields": [
				{ "fieldId": "510001" },
				{ "fieldId": "510002" },
				{ "fieldId": "510003" }
			  ],
			  "gridFields": [
				{ "fieldId": "510001" },
				{ "fieldId": "510002" }
			  ]
			}

	  ]
	},
	{
	  "sectionId": "515",
	  "title": "lbl.sec_reporterInformations",
	  "sequence": 3,
	  "sections": [
		{
		  "sectionId": "515_001",
		  "title": "lbl.sec_reporterInformations",
		  "tabPanel": true,
		  "sequence": 1,
		  "multiContext": true,
		  "contextPath": "reporterInformations$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "sections": [
			{
			  "sectionId": "515_001_A",
			  "title": "lbl.sec_reporterCore",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "515001" },
				{ "fieldId": "515002" },
				{ "fieldId": "515003" },
				{ "fieldId": "515004" },
				{ "fieldId": "515005" }
			  ]
			},
			{
			  "sectionId": "515_001_B",
			  "title": "lbl.sec_reporterIdentity",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "515006" },
				{ "fieldId": "515007" },
				{ "fieldId": "515008" },
				{ "fieldId": "515009" },
				{ "fieldId": "515010" },
				{ "fieldId": "515011" },
				{ "fieldId": "515012" }
			  ]
			},
			{
			  "sectionId": "515_001_C",
			  "title": "lbl.sec_reporterProfessional",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "515013" },
				{ "fieldId": "515014" },
				{ "fieldId": "515015" },
				{ "fieldId": "515016" },
				{ "fieldId": "515017" },
				{ "fieldId": "515018" },
				{ "fieldId": "515019" },
				{ "fieldId": "515020" },
				{ "fieldId": "515021" }
			  ]
			},
			{
			  "sectionId": "515_001_D",
			  "title": "lbl.sec_reporterContact",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "515022" },
				{ "fieldId": "515023" },
				{ "fieldId": "515024" },
				{ "fieldId": "515025" },
				{ "fieldId": "515026" },
				{ "fieldId": "515027" },
				{ "fieldId": "515028" },
				{ "fieldId": "515029" },
				{ "fieldId": "515030" },
				{ "fieldId": "515031" },
				{ "fieldId": "515032" },
				{ "fieldId": "515033" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "515009" },
			{ "fieldId": "515007" },
			{ "fieldId": "515004" },
			{ "fieldId": "515018" },
			{ "fieldId": "515028" },
			{ "fieldId": "515001" }
		  ]
		}
	  ]
	},
	{
	  "sectionId": "520",
	  "title": "lbl.sec_sourceInformations",
	  "sequence": 4,
	  "sections": [
		{
		  "sectionId": "520_001",
		  "title": "lbl.sec_sourceInformations",
		  "tabPanel": true,
		  "sequence": 1,
		  "multiContext": true,
		  "contextPath": "sourceInformations$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "sections": [
			{
			  "sectionId": "520_001_A",
			  "title": "lbl.sec_sourceCore",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "520001" },
				{ "fieldId": "520002" },
				{ "fieldId": "520003" },
				{ "fieldId": "520004" },
				{ "fieldId": "520010" },
				{ "fieldId": "520008" }
			  ]
			},
			{
			  "sectionId": "520_001_B",
			  "title": "lbl.sec_sourceReference",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "520005" },
				{ "fieldId": "520006" },
				{ "fieldId": "520007" },
				{ "fieldId": "520009" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "520002" },
			{ "fieldId": "520003" },
			{ "fieldId": "520004" },
			{ "fieldId": "520005" },
			{ "fieldId": "520001" }
		  ]
		}
	  ]
	},
	{
	  "sectionId": "530",
	  "title": "lbl.sec_patient",
	  "sequence": 5,
	  "sections": [
		{
		  "sectionId": "530_001",
		  "title": "lbl.sec_patientCore",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "530001" },
			{ "fieldId": "530009" },
			{ "fieldId": "530010" },
			{ "fieldId": "530002" },
			{ "fieldId": "530003" },
			{ "fieldId": "530004" },
			{ "fieldId": "530005" },
			{ "fieldId": "530006" },
			{ "fieldId": "530007" },
			{ "fieldId": "530008" }
		  ]
		},
		{
		  "sectionId": "530_002",
		  "title": "lbl.sec_patientDemographics",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "530011" },
			{ "fieldId": "530012" },
			{ "fieldId": "530013" },
			{ "fieldId": "530014" },
			{ "fieldId": "530015" },
			{ "fieldId": "530016" },
			{ "fieldId": "530017" },
			{ "fieldId": "530018" },
			{ "fieldId": "530019" },
			{ "fieldId": "530020" }
		  ]
		},
		{
		  "sectionId": "530_003",
		  "title": "lbl.sec_patientPhysical",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "530021" },
			{ "fieldId": "530022" },
			{ "fieldId": "530023" },
			{ "fieldId": "530024" },
			{ "fieldId": "530025" },
			{ "fieldId": "530026" },
			{ "fieldId": "530027" },
			{ "fieldId": "530028" },
			{ "fieldId": "530029" },
			{ "fieldId": "530030" },
			{ "fieldId": "530031" },
			{ "fieldId": "530032" }
		  ]
		},
		{
		  "sectionId": "530_004",
		  "title": "lbl.sec_patientMedical",
		  "sequence": 4,
		  "fields": [
			{ "fieldId": "530033" },
			{ "fieldId": "530034" },
			{ "fieldId": "530035" },
			{ "fieldId": "530036" }
		  ]
		},
		{
		  "sectionId": "530_005",
		  "title": "lbl.sec_patientDeath",
		  "sequence": 5,
		  "renderCondition": "RULE_ICSR_PAT_DEATH_SECTION",
		  "fields": [
			{ "fieldId": "530037" },
			{ "fieldId": "530038" },
			{ "fieldId": "530039" }
		  ]
		},
		{
		  "sectionId": "530_006",
		  "title": "lbl.sec_patientContact",
		  "sequence": 6,
		  "renderCondition": "RULE_ICSR_PAT_CONTACT_SECTION",
		  "fields": [
			{ "fieldId": "530040" },
			{ "fieldId": "530041" },
			{ "fieldId": "530042" },
			{ "fieldId": "530043" },
			{ "fieldId": "530044" },
			{ "fieldId": "530045" },
			{ "fieldId": "530046" },
			{ "fieldId": "530047" },
			{ "fieldId": "530048" }
		  ]
		},
		{
		  "sectionId": "530_007",
		  "title": "lbl.sec_patientRecords",
		  "sequence": 7,
		  "fields": [
			{ "fieldId": "530049" },
			{ "fieldId": "530050" },
			{ "fieldId": "530051" },
			{ "fieldId": "530052" },
			{ "fieldId": "530053" }
		  ]
		},
		{
		  "sectionId": "530_008",
		  "title": "lbl.sec_patientVaccine",
		  "sequence": 8,
		  "renderCondition": "RULE_ICSR_PAT_VACCINE_SECTION",
		  "fields": [
			{ "fieldId": "530054" },
			{ "fieldId": "530055" },
			{ "fieldId": "530056" },
			{ "fieldId": "530057" },
			{ "fieldId": "530058" },
			{ "fieldId": "530059" }
		  ]
		},
		{
		  "sectionId": "530_009",
		  "title": "lbl.sec_biologicalFather",
		  "sequence": 9,
		  "renderCondition": "RULE_ICSR_PAT_BIO_FATHER_SECTION",
		  "fields": [
			{ "fieldId": "530060" },
			{ "fieldId": "530061" },
			{ "fieldId": "530062" },
			{ "fieldId": "530063" },
			{ "fieldId": "530064" }
		  ]
		},
		{
		  "sectionId": "530_010",
		  "title": "lbl.sec_patientAdmin",
		  "sequence": 10,
		  "fields": [
			{ "fieldId": "530065" },
			{ "fieldId": "530066" }
		  ]
		},
		{
		  "sectionId": "535",
		  "title": "lbl.sec_patientSummary",
		  "tabPanel":true,
		  "sequence": 6,
		  "sections": [
			{
			  "sectionId": "535_001",
			  "title": "lbl.sec_caseNarrative",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "535001" },
				{ "fieldId": "535002" },
				{ "fieldId": "535003" },
				{ "fieldId": "535004" }
			  ]
			},
			{
			  "sectionId": "535_002",
			  "title": "lbl.sec_medicalAssessment",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "535005" },
				{ "fieldId": "535006" },
				{ "fieldId": "535007" },
				{ "fieldId": "535008" },
				{ "fieldId": "535009" }
			  ]
			},
			{
			  "sectionId": "535_003",
			  "title": "lbl.sec_clinicalNarrative",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "535010" },
				{ "fieldId": "535011" },
				{ "fieldId": "535012" },
				{ "fieldId": "535013" }
			  ]
			},
			{
			  "sectionId": "535_004",
			  "title": "lbl.sec_correctiveActions",
			  "sequence": 4,
			  "renderCondition": "RULE_ICSR_SUMMARY_CORRECTIVE_SECTION",
			  "fields": [
				{ "fieldId": "535014" },
				{ "fieldId": "535015" },
				{ "fieldId": "535016" },
				{ "fieldId": "535017" },
				{ "fieldId": "535018" },
				{ "fieldId": "535019" },
				{ "fieldId": "535020" }
			  ]
			}
		  ]
		},
		{
		  "sectionId": "540_001",
		  "title": "lbl.sec_medicalHistory",
		  "tabPanel": true,
		  "sequence": 7,
		  "multiContext": true,
		  "contextPath": "patient.patientMedicalHistory$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": true,
			"pagination": true,
			"pageSizeOptions": [5, 10, 25]
		  },
		  "sections": [
			{
			  "sectionId": "540_001_A",
			  "title": "lbl.sec_medHistCore",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "540001" },
				{ "fieldId": "540002" },
				{ "fieldId": "540003" },
				{ "fieldId": "540004" },
				{ "fieldId": "540005" },
				{ "fieldId": "540006" }
			  ]
			},
			{
			  "sectionId": "540_001_B",
			  "title": "lbl.sec_medHistClassification",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "540007" },
				{ "fieldId": "540008" },
				{ "fieldId": "540009" },
				{ "fieldId": "540010" }
			  ]
			},
			{
			  "sectionId": "540_001_C",
			  "title": "lbl.sec_medHistDuration",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "540011" },
				{ "fieldId": "540012" }
			  ]
			},
			{
			  "sectionId": "540_001_D",
			  "title": "lbl.sec_medHistAdmin",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "540013" },
				{ "fieldId": "540014" },
				{ "fieldId": "540015" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "540001" },
			{ "fieldId": "540002" },
			{ "fieldId": "540004" },
			{ "fieldId": "540005" },
			{ "fieldId": "540006" },
			{ "fieldId": "540007" }
		  ]
		},
		{
		  "sectionId": "545_001",
		  "title": "lbl.sec_pastDrugTherapies",
		  "tabPanel": true,
		  "sequence": 8,
		  "multiContext": true,
		  "contextPath": "patient.patientPastDrugTherapies$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": true,
			"pagination": true,
			"pageSizeOptions": [5, 10, 25]
		  },
		  "sections": [
			{
			  "sectionId": "545_001_A",
			  "title": "lbl.sec_pastDrugProduct",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "545001" },
				{ "fieldId": "545002" },
				{ "fieldId": "545003" },
				{ "fieldId": "545004" },
				{ "fieldId": "545005" },
				{ "fieldId": "545006" },
				{ "fieldId": "545007" },
				{ "fieldId": "545008" }
			  ]
			},
			{
			  "sectionId": "545_001_B",
			  "title": "lbl.sec_pastDrugCoding",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "545009" },
				{ "fieldId": "545010" },
				{ "fieldId": "545011" },
				{ "fieldId": "545012" },
				{ "fieldId": "545013" },
				{ "fieldId": "545014" },
				{ "fieldId": "545015" },
				{ "fieldId": "545016" },
				{ "fieldId": "545017" },
				{ "fieldId": "545018" },
				{ "fieldId": "545019" }
			  ]
			},
			{
			  "sectionId": "545_001_C",
			  "title": "lbl.sec_pastDrugDates",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "545020" },
				{ "fieldId": "545021" },
				{ "fieldId": "545022" },
				{ "fieldId": "545023" }
			  ]
			},
			{
			  "sectionId": "545_001_D",
			  "title": "lbl.sec_pastDrugDetails",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "545024" },
				{ "fieldId": "545025" },
				{ "fieldId": "545026" },
				{ "fieldId": "545027" },
				{ "fieldId": "545028" }
			  ]
			},
			{
			  "sectionId": "546_001",
			  "title": "lbl.sec_pastDrugSubstances",
			  "sequence": 5,
			  "multiContext": true,
			  "contextPath": "patient.patientPastDrugTherapies$.patientPastDrugSubstanceCollection$",
			  "renderCondition": "RULE_ICSR_PAST_DRUG_SUBSTANCE_R3",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "546001" },
				{ "fieldId": "546002" },
				{ "fieldId": "546003" },
				{ "fieldId": "546004" },
				{ "fieldId": "546005" }
			  ],
			  "gridFields": [
				{ "fieldId": "546001" },
				{ "fieldId": "546002" },
				{ "fieldId": "546004" },
				{ "fieldId": "546005" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "545001" },
			{ "fieldId": "545009" },
			{ "fieldId": "545012" },
			{ "fieldId": "545020" },
			{ "fieldId": "545021" }
		  ]
		},
		{
		  "sectionId": "550",
		  "title": "lbl.sec_pregnancy",
		  "tabPanel": true,
		  "sequence": 9,
		  "renderCondition": "RULE_ICSR_PREGNANCY_SECTION",
		  "sections": [
			{
			  "sectionId": "550_001",
			  "title": "lbl.sec_pregnancyDetails",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "550001" },
				{ "fieldId": "550002" },
				{ "fieldId": "550003" },
				{ "fieldId": "550004" },
				{ "fieldId": "550005" },
				{ "fieldId": "550006" },
				{ "fieldId": "550007" },
				{ "fieldId": "550008" },
				{ "fieldId": "550009" },
				{ "fieldId": "550010" },
				{ "fieldId": "550011" }
			  ]
			},
			{
			  "sectionId": "550_002",
			  "title": "lbl.sec_pregnancyPhysical",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "550012" },
				{ "fieldId": "550013" },
				{ "fieldId": "550014" },
				{ "fieldId": "550015" }
			  ]
			},
			{
			  "sectionId": "550_003",
			  "title": "lbl.sec_pregnancyAdmin",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "550016" },
				{ "fieldId": "550017" }
			  ]
			},
			{
			  "sectionId": "552_001",
			  "title": "lbl.sec_pregnancyOutcomes",
			  "tabPanel": true,
			  "sequence": 4,
			  "multiContext": true,
			  "contextPath": "patient.pregnancy.pregnancyOutcomes$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": true,
				"pageSizeOptions": [5, 10]
			  },
			  "sections": [
				{
				  "sectionId": "552_001_A",
				  "title": "lbl.sec_outcomeCore",
				  "sequence": 1,
				  "fields": [
					{ "fieldId": "552001" },
					{ "fieldId": "552002" },
					{ "fieldId": "552003" },
					{ "fieldId": "552004" },
					{ "fieldId": "552005" },
					{ "fieldId": "552006" }
				  ]
				},
				{
				  "sectionId": "553_001",
				  "title": "lbl.sec_prevPregnancyOutcomes",
				  "sequence": 2,
				  "multiContext": true,
				  "contextPath": "patient.pregnancy.pregnancyOutcomes$.previousPregnancyOutcomes$",
				  "dataGridConfig": {
					"allowAdd": true,
					"allowDelete": true,
					"allowCopy": false,
					"pagination": false
				  },
				  "fields": [
					{ "fieldId": "553001" },
					{ "fieldId": "553002" },
					{ "fieldId": "553003" },
					{ "fieldId": "553004" }
				  ],
				  "gridFields": [
					{ "fieldId": "553001" },
					{ "fieldId": "553003" },
					{ "fieldId": "553004" }
				  ]
				},
				{
				  "sectionId": "555_001",
				  "title": "lbl.sec_neonates",
				  "sequence": 3,
				  "multiContext": true,
				  "contextPath": "patient.pregnancy.pregnancyOutcomes$.neonates$",
				  "dataGridConfig": {
					"allowAdd": true,
					"allowDelete": true,
					"allowCopy": false,
					"pagination": false
				  },
				  "sections": [
					{
					  "sectionId": "555_001_A",
					  "title": "lbl.sec_neonateCore",
					  "sequence": 1,
					  "fields": [
						{ "fieldId": "555001" },
						{ "fieldId": "555002" },
						{ "fieldId": "555003" },
						{ "fieldId": "555004" },
						{ "fieldId": "555005" },
						{ "fieldId": "555006" },
						{ "fieldId": "555007" }
					  ]
					},
					{
					  "sectionId": "555_001_B",
					  "title": "lbl.sec_neonateAnomaly",
					  "sequence": 2,
					  "renderCondition": "RULE_ICSR_NEONATE_ANOMALY_SECTION",
					  "fields": [
						{ "fieldId": "555008" },
						{ "fieldId": "555009" }
					  ]
					},
					{
					  "sectionId": "555_001_C",
					  "title": "lbl.sec_neonateApgar",
					  "sequence": 3,
					  "fields": [
						{ "fieldId": "555010" },
						{ "fieldId": "555011" },
						{ "fieldId": "555012" }
					  ]
					},
					{
					  "sectionId": "555_001_D",
					  "title": "lbl.sec_neonateNicu",
					  "sequence": 4,
					  "renderCondition": "RULE_ICSR_NEONATE_NICU_SECTION",
					  "fields": [
						{ "fieldId": "555013" },
						{ "fieldId": "555014" },
						{ "fieldId": "555015" },
						{ "fieldId": "555016" }
					  ]
					},
					{
					  "sectionId": "555_001_E",
					  "title": "lbl.sec_neonateOther",
					  "sequence": 5,
					  "fields": [
						{ "fieldId": "555017" },
						{ "fieldId": "555018" }
					  ]
					},
					{
					  "sectionId": "556_001",
					  "title": "lbl.sec_neonateChildren",
					  "sequence": 6,
					  "multiContext": true,
					  "contextPath": "patient.pregnancy.pregnancyOutcomes$.neonates$.childCollection$",
					  "dataGridConfig": {
						"allowAdd": true,
						"allowDelete": true,
						"allowCopy": false,
						"pagination": false
					  },
					  "fields": [
						{ "fieldId": "556001" },
						{ "fieldId": "556002" },
						{ "fieldId": "556003" },
						{ "fieldId": "556004" },
						{ "fieldId": "556005" },
						{ "fieldId": "556006" },
						{ "fieldId": "556007" },
						{ "fieldId": "556008" }
					  ],
					  "gridFields": [
						{ "fieldId": "556001" },
						{ "fieldId": "556002" },
						{ "fieldId": "556007" },
						{ "fieldId": "556008" }
					  ]
					}
				  ],
				  "gridFields": [
					{ "fieldId": "555001" },
					{ "fieldId": "555002" },
					{ "fieldId": "555004" },
					{ "fieldId": "555008" }
				  ]
				}
			  ],
			  "gridFields": [
				{ "fieldId": "552001" },
				{ "fieldId": "552002" },
				{ "fieldId": "552004" },
				{ "fieldId": "552005" }
			  ]
			}
		  ]
		},
		{
		  "sectionId": "560",
		  "title": "lbl.sec_deathCauses",
		  "sequence": 10,
		  "renderCondition": "RULE_ICSR_PAT_DEATH_SECTION",
		  "sections": [
			{
			  "sectionId": "560_001",
			  "title": "lbl.sec_reportedDeathCauses",
			  "tabPanel": true,
			  "sequence": 1,
			  "multiContext": true,
			  "contextPath": "patient.deathCauseCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "560104" },
				{ "fieldId": "560102" },
				{ "fieldId": "560103" }
			  ],
			  "gridFields": [
				{ "fieldId": "560104" },
				{ "fieldId": "560102" },
				{ "fieldId": "560103" }
			  ]
			},
			{
			  "sectionId": "561_001",
			  "title": "lbl.sec_autopsyCauses",
			  "tabPanel": true,
			  "sequence": 2,
			  "renderCondition": "RULE_ICSR_PAT_AUTOPSY_DATE",
			  "multiContext": true,
			  "contextPath": "patient.patientAutopsyCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "561002" },
				{ "fieldId": "561003" },
				{ "fieldId": "561004" }
			  ],
			  "gridFields": [
				{ "fieldId": "561002" },
				{ "fieldId": "561003" },
				{ "fieldId": "561004" }
			  ]
			}
		  ]
		}
		
	  ]
	},
	{
	  "sectionId": "565",
	  "title": "lbl.sec_parent",
	  "sequence": 11,
	  "renderCondition": "RULE_ICSR_PARENT_SECTION",
	  "sections": [
		{
		  "sectionId": "565_001",
		  "title": "lbl.sec_parentCore",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "565013" },
			{ "fieldId": "565010" },
			{ "fieldId": "565009" },
			{ "fieldId": "565005" },
			{ "fieldId": "565008" },
			{ "fieldId": "565002" },
			{ "fieldId": "565004" }
		  ]
		},
		{
		  "sectionId": "565_002",
		  "title": "lbl.sec_parentPhysical",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "565015" },
			{ "fieldId": "565016" },
			{ "fieldId": "565011" },
			{ "fieldId": "565012" }
		  ]
		},
		{
		  "sectionId": "565_003",
		  "title": "lbl.sec_parentMedical",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "565014" }
		  ]
		},
		{
		  "sectionId": "565_004",
		  "title": "lbl.sec_parentVaccine",
		  "sequence": 4,
		  "renderCondition": "RULE_ICSR_PARENT_VACCINE_SECTION",
		  "fields": [
			{ "fieldId": "565006" },
			{ "fieldId": "565007" }
		  ]
		},
		{
		  "sectionId": "565_005",
		  "title": "lbl.sec_parentAdmin",
		  "sequence": 5,
		  "fields": [
			{ "fieldId": "565001" },
			{ "fieldId": "565003" }
		  ]
		},
		{
		  "sectionId": "570_001",
		  "title": "lbl.sec_parentPastDrugs",
		  "tabPanel": true,
		  "sequence": 6,
		  "multiContext": true,
		  "contextPath": "patient.parent.parentPastDrugTherapyCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": true,
			"pagination": true,
			"pageSizeOptions": [5, 10, 25]
		  },
		  "sections": [
			{
			  "sectionId": "570_001_A",
			  "title": "lbl.sec_parDrugProduct",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "570019" },
				{ "fieldId": "570018" },
				{ "fieldId": "570007" },
				{ "fieldId": "570021" },
				{ "fieldId": "570024" }
			  ]
			},
			{
			  "sectionId": "570_001_B",
			  "title": "lbl.sec_parDrugIdentifiers",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "570013" },
				{ "fieldId": "570014" },
				{ "fieldId": "570015" },
				{ "fieldId": "570016" },
				{ "fieldId": "570017" },
				{ "fieldId": "570025" },
				{ "fieldId": "570026" },
				{ "fieldId": "570008" }
			  ]
			},
			{
			  "sectionId": "570_001_C",
			  "title": "lbl.sec_parDrugTherapy",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "570022" },
				{ "fieldId": "570003" },
				{ "fieldId": "570005" },
				{ "fieldId": "570009" },
				{ "fieldId": "570011" },
				{ "fieldId": "570020" },
				{ "fieldId": "570010" },
				{ "fieldId": "570012" }
			  ]
			},
			{
			  "sectionId": "570_001_D",
			  "title": "lbl.sec_parDrugForm",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "570004" },
				{ "fieldId": "570023" },
				{ "fieldId": "570001" },
				{ "fieldId": "570002" },
				{ "fieldId": "570006" }
			  ]
			},
			{
			  "sectionId": "571_001",
			  "title": "lbl.sec_parDrugSubstances",
			  "sequence": 5,
			  "multiContext": true,
			  "contextPath": "patient.parent.parentPastDrugTherapyCollection$.parentPastDrugSubstanceCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "571003" },
				{ "fieldId": "571005" },
				{ "fieldId": "571004" },
				{ "fieldId": "571001" },
				{ "fieldId": "571002" }
			  ],
			  "gridFields": [
				{ "fieldId": "571003" },
				{ "fieldId": "571001" },
				{ "fieldId": "571002" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "570019" },
			{ "fieldId": "570022" },
			{ "fieldId": "570003" },
			{ "fieldId": "570005" },
			{ "fieldId": "570020" }
		  ]
		},
		{
		  "sectionId": "575_001",
		  "title": "lbl.sec_parentMedHistory",
		  "tabPanel": true,
		  "sequence": 7,
		  "multiContext": true,
		  "contextPath": "patient.parent.parentMedHistEpisodeCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": true,
			"pagination": true,
			"pageSizeOptions": [5, 10, 25]
		  },
		  "sections": [
			{
			  "sectionId": "575_001_A",
			  "title": "lbl.sec_parMedHistCore",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "575010" },
				{ "fieldId": "575008" },
				{ "fieldId": "575009" },
				{ "fieldId": "575011" },
				{ "fieldId": "575007" },
				{ "fieldId": "575003" },
				{ "fieldId": "575004" }
			  ]
			},
			{
			  "sectionId": "575_001_B",
			  "title": "lbl.sec_parMedHistDuration",
			  "sequence": 2,
			  "renderCondition": "RULE_ICSR_PAR_MED_HIST_END_DATE",
			  "fields": [
				{ "fieldId": "575005" },
				{ "fieldId": "575006" }
			  ]
			},
			{
			  "sectionId": "575_001_C",
			  "title": "lbl.sec_parMedHistAdmin",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "575001" },
				{ "fieldId": "575002" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "575010" },
			{ "fieldId": "575008" },
			{ "fieldId": "575011" },
			{ "fieldId": "575003" },
			{ "fieldId": "575004" }
		  ]
		}
	  ]
	},
	{
	  "sectionId": "580",
	  "title": "lbl.sec_study",
	  "sequence": 12,
	  "renderCondition": "RULE_ICSR_STUDY_SECTION",
	  "sections": [
		{
		  "sectionId": "580_001",
		  "title": "lbl.sec_studyIdentification",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "580026" },
			{ "fieldId": "580034" },
			{ "fieldId": "580037" },
			{ "fieldId": "580027" },
			{ "fieldId": "580033" }
		  ]
		},
		{
		  "sectionId": "580_002",
		  "title": "lbl.sec_studyDesign",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "580038" },
			{ "fieldId": "580030" },
			{ "fieldId": "580035" },
			{ "fieldId": "580001" }
		  ]
		},
		{
		  "sectionId": "580_003",
		  "title": "lbl.sec_studySubject",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "580039" },
			{ "fieldId": "580023" },
			{ "fieldId": "580006" },
			{ "fieldId": "580007" },
			{ "fieldId": "580011" },
			{ "fieldId": "580040" },
			{ "fieldId": "580029" },
			{ "fieldId": "580031" }
		  ]
		},
		{
		  "sectionId": "580_004",
		  "title": "lbl.sec_studySite",
		  "sequence": 4,
		  "fields": [
			{ "fieldId": "580004" },
			{ "fieldId": "580014" },
			{ "fieldId": "580012" },
			{ "fieldId": "580013" }
		  ]
		},
		{
		  "sectionId": "580_005",
		  "title": "lbl.sec_studyRegulatoryIds",
		  "sequence": 5,
		  "fields": [
			{ "fieldId": "580009" },
			{ "fieldId": "580019" },
			{ "fieldId": "580024" },
			{ "fieldId": "580018" },
			{ "fieldId": "580020" },
			{ "fieldId": "580015" }
		  ]
		},
		{
		  "sectionId": "580_006",
		  "title": "lbl.sec_studyBlinding",
		  "sequence": 6,
		  "fields": [
			{ "fieldId": "580002" },
			{ "fieldId": "580003" },
			{ "fieldId": "580028" },
			{ "fieldId": "580041" }
		  ]
		},
		{
		  "sectionId": "580_007",
		  "title": "lbl.sec_studyDates",
		  "sequence": 7,
		  "fields": [
			{ "fieldId": "580036" },
			{ "fieldId": "580032" },
			{ "fieldId": "580008" },
			{ "fieldId": "580005" }
		  ]
		},
		{
		  "sectionId": "580_008",
		  "title": "lbl.sec_studyAdmin",
		  "sequence": 8,
		  "fields": [
			{ "fieldId": "580025" },
			{ "fieldId": "580016" },
			{ "fieldId": "580017" },
			{ "fieldId": "580021" },
			{ "fieldId": "580022" },
			{ "fieldId": "580010" }
		  ]
		},
		{
		  "sectionId": "582_001",
		  "title": "lbl.sec_studyRegistrations",
		  "tabPanel": true,
		  "sequence": 9,
		  "multiContext": true,
		  "contextPath": "study.studyRegistrationCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "fields": [
			{ "fieldId": "582004" },
			{ "fieldId": "582003" },
			{ "fieldId": "582005" },
			{ "fieldId": "582002" },
			{ "fieldId": "582001" }
		  ],
		  "gridFields": [
			{ "fieldId": "582004" },
			{ "fieldId": "582003" },
			{ "fieldId": "582005" },
			{ "fieldId": "582002" }
		  ]
		},
		{
		  "sectionId": "583_001",
		  "title": "lbl.sec_studyCrossRefInds",
		  "tabPanel": true,
		  "sequence": 10,
		  "multiContext": true,
		  "contextPath": "study.studyCrossReferenceINDsCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": false
		  },
		  "fields": [
			{ "fieldId": "583001" },
			{ "fieldId": "583002" },
			{ "fieldId": "583003" },
			{ "fieldId": "583004" }
		  ],
		  "gridFields": [
			{ "fieldId": "583001" },
			{ "fieldId": "583002" },
			{ "fieldId": "583003" }
		  ]
		}
	  ]
	},
	{
	  "sectionId": "600",
	  "title": "lbl.sec_eventReactions",
	  "sequence": 13,
	  "multiContext": true,
	  "contextPath": "eventReactions$",
	  "dataGridConfig": {
		"allowAdd": true,
		"allowDelete": true,
		"allowCopy": true,
		"pagination": true,
		"pageSizeOptions": [5, 10, 25]
	  },
	  "sections": [
		{
		  "sectionId": "600_001",
		  "title": "lbl.sec_reactionTerm",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "600029" },
			{ "fieldId": "600015" },
			{ "fieldId": "600016" },
			{ "fieldId": "600032" },
			{ "fieldId": "600030" },
			{ "fieldId": "600023" }
		  ]
		},
		{
		  "sectionId": "600_002",
		  "title": "lbl.sec_reactionDates",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "600024" },
			{ "fieldId": "600008" },
			{ "fieldId": "600013" },
			{ "fieldId": "600014" },
			{ "fieldId": "600046" },
			{ "fieldId": "600047" },
			{ "fieldId": "600044" },
			{ "fieldId": "600045" }
		  ]
		},
		{
		  "sectionId": "600_003",
		  "title": "lbl.sec_seriousness",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "600043" },
			{ "fieldId": "600035" },
			{ "fieldId": "600039" },
			{ "fieldId": "600033" },
			{ "fieldId": "600036" },
			{ "fieldId": "600034" },
			{ "fieldId": "600040" },
			{ "fieldId": "600041" },
			{ "fieldId": "600042" }
		  ]
		},
		{
		  "sectionId": "600_004",
		  "title": "lbl.sec_hospitalization",
		  "sequence": 4,
		  "renderCondition": "RULE_ICSR_REACT_HOSPITALIZATION",
		  "fields": [
			{ "fieldId": "600037" },
			{ "fieldId": "600038" }
		  ]
		},
		{
		  "sectionId": "600_005",
		  "title": "lbl.sec_reactionOutcome",
		  "sequence": 5,
		  "fields": [
			{ "fieldId": "600026" },
			{ "fieldId": "600031" },
			{ "fieldId": "600018" },
			{ "fieldId": "600050" }
		  ]
		},
		{
		  "sectionId": "600_006",
		  "title": "lbl.sec_reactionCause",
		  "sequence": 6,
		  "fields": [
			{ "fieldId": "600005" },
			{ "fieldId": "600006" },
			{ "fieldId": "600007" },
			{ "fieldId": "600025" }
		  ]
		},
		{
		  "sectionId": "600_007",
		  "title": "lbl.sec_reactionTreatment",
		  "sequence": 7,
		  "fields": [
			{ "fieldId": "600049" },
			{ "fieldId": "600048" }
		  ]
		},
		{
		  "sectionId": "600_008",
		  "title": "lbl.sec_reactionLocation",
		  "sequence": 8,
		  "fields": [
			{ "fieldId": "600010" },
			{ "fieldId": "600011" },
			{ "fieldId": "600059" },
			{ "fieldId": "600053" },
			{ "fieldId": "600028" },
			{ "fieldId": "600001" }
		  ]
		},
		{
		  "sectionId": "600_009",
		  "title": "lbl.sec_reactionClassification",
		  "sequence": 9,
		  "fields": [
			{ "fieldId": "600009" },
			{ "fieldId": "600027" },
			{ "fieldId": "600003" },
			{ "fieldId": "600021" },
			{ "fieldId": "600012" },
			{ "fieldId": "600004" },
			{ "fieldId": "600019" },
			{ "fieldId": "600022" }
		  ]
		},
		{
		  "sectionId": "602_001",
		  "title": "lbl.sec_vaccineReaction",
		  "sequence": 10,
		  "renderCondition": "RULE_ICSR_REACT_VACCINE_SECTION",
		  "fields": [
			{ "fieldId": "602007" },
			{ "fieldId": "602001" },
			{ "fieldId": "602008" },
			{ "fieldId": "602002" },
			{ "fieldId": "602004" },
			{ "fieldId": "602005" },
			{ "fieldId": "602006" },
			{ "fieldId": "602003" },
			{ "fieldId": "602009" }
		  ]
		},
		{
		  "sectionId": "600_010",
		  "title": "lbl.sec_deviceReaction",
		  "sequence": 11,
		  "renderCondition": "RULE_ICSR_REACT_DEVICE_SECTION",
		  "fields": [
			{ "fieldId": "600051" },
			{ "fieldId": "600052" },
			{ "fieldId": "600057" },
			{ "fieldId": "600058" },
			{ "fieldId": "600060" },
			{ "fieldId": "600061" },
			{ "fieldId": "600056" },
			{ "fieldId": "600054" },
			{ "fieldId": "600062" },
			{ "fieldId": "600063" },
			{ "fieldId": "600065" },
			{ "fieldId": "600064" }
		  ]
		},
		{
		  "sectionId": "600_011",
		  "title": "lbl.sec_similarIncidents",
		  "sequence": 12,
		  "renderCondition": "RULE_ICSR_REACT_DEVICE_SECTION",
		  "fields": [
			{ "fieldId": "600074" },
			{ "fieldId": "600068" },
			{ "fieldId": "600075" },
			{ "fieldId": "600067" },
			{ "fieldId": "600069" },
			{ "fieldId": "600070" },
			{ "fieldId": "600066" },
			{ "fieldId": "600071" },
			{ "fieldId": "600072" },
			{ "fieldId": "600077" },
			{ "fieldId": "600078" },
			{ "fieldId": "600079" },
			{ "fieldId": "600080" },
			{ "fieldId": "600081" },
			{ "fieldId": "600076" }
		  ]
		},
		{
		  "sectionId": "603_001",
		  "title": "lbl.sec_similarIncidentData",
		  "tabPanel": true,
		  "sequence": 13,
		  "renderCondition": "RULE_ICSR_REACT_DEVICE_SECTION",
		  "multiContext": true,
		  "contextPath": "eventReactions$.similarIncidentAndDeviceCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": false
		  },
		  "fields": [
			{ "fieldId": "603006" },
			{ "fieldId": "603003" },
			{ "fieldId": "603001" },
			{ "fieldId": "603002" },
			{ "fieldId": "603004" },
			{ "fieldId": "603005" },
			{ "fieldId": "603007" },
			{ "fieldId": "603008" }
		  ],
		  "gridFields": [
			{ "fieldId": "603006" },
			{ "fieldId": "603003" },
			{ "fieldId": "603001" },
			{ "fieldId": "603002" }
		  ]
		},
		{
		  "sectionId": "600_012",
		  "title": "lbl.sec_reactionAdmin",
		  "sequence": 14,
		  "fields": [
			{ "fieldId": "600017" },
			{ "fieldId": "600020" },
			{ "fieldId": "600002" },
			{ "fieldId": "600073" },
			{ "fieldId": "600055" }
		  ]
		}
	  ],
	  "gridFields": [
		{ "fieldId": "600029" },
		{ "fieldId": "600015" },
		{ "fieldId": "600024" },
		{ "fieldId": "600026" },
		{ "fieldId": "600043" },
		{ "fieldId": "600031" },
		{ "fieldId": "600032" }
	  ]
	},
	{
	  "sectionId": "610",
	  "title": "lbl.sec_drugProducts",
	  "sequence": 14,
	  "multiContext": true,
	  "contextPath": "drugProducts$",
	  "dataGridConfig": {
		"allowAdd": true,
		"allowDelete": true,
		"allowCopy": true,
		"pagination": true,
		"pageSizeOptions": [5, 10, 25]
	  },
	  "sections": [
		{
		  "sectionId": "610_001",
		  "title": "lbl.sec_productIdentification",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "610052" },
			{ "fieldId": "610034" },
			{ "fieldId": "610035" },
			{ "fieldId": "610027" },
			{ "fieldId": "610063" },
			{ "fieldId": "610069" },
			{ "fieldId": "610057" },
			{ "fieldId": "610048" }
		  ]
		},
		{
		  "sectionId": "610_002",
		  "title": "lbl.sec_productIdentifiers",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "610032" },
			{ "fieldId": "610033" },
			{ "fieldId": "610036" },
			{ "fieldId": "610040" },
			{ "fieldId": "610041" },
			{ "fieldId": "610074" },
			{ "fieldId": "610029" },
			{ "fieldId": "610038" },
			{ "fieldId": "610037" },
			{ "fieldId": "610026" },
			{ "fieldId": "610054" }
		  ]
		},
		{
		  "sectionId": "610_003",
		  "title": "lbl.sec_productClassification",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "610050" },
			{ "fieldId": "610051" },
			{ "fieldId": "610067" },
			{ "fieldId": "610062" },
			{ "fieldId": "610006" },
			{ "fieldId": "610031" }
		  ]
		},
		{
		  "sectionId": "610_004",
		  "title": "lbl.sec_productDosage",
		  "sequence": 4,
		  "fields": [
			{ "fieldId": "610065" },
			{ "fieldId": "610066" },
			{ "fieldId": "610024" },
			{ "fieldId": "610009" },
			{ "fieldId": "610014" },
			{ "fieldId": "610025" },
			{ "fieldId": "610011" },
			{ "fieldId": "610012" },
			{ "fieldId": "610019" },
			{ "fieldId": "610010" }
		  ]
		},
		{
		  "sectionId": "610_005",
		  "title": "lbl.sec_productDechallenge",
		  "sequence": 5,
		  "fields": [
			{ "fieldId": "610001" },
			{ "fieldId": "610017" },
			{ "fieldId": "610018" }
		  ]
		},
		{
		  "sectionId": "610_006",
		  "title": "lbl.sec_productFlags",
		  "sequence": 6,
		  "fields": [
			{ "fieldId": "610028" },
			{ "fieldId": "610046" },
			{ "fieldId": "610047" },
			{ "fieldId": "610030" },
			{ "fieldId": "610004" },
			{ "fieldId": "610049" },
			{ "fieldId": "610059" },
			{ "fieldId": "610060" },
			{ "fieldId": "610061" },
			{ "fieldId": "610008" },
			{ "fieldId": "610013" },
			{ "fieldId": "610055" },
			{ "fieldId": "610056" }
		  ]
		},
		{
		  "sectionId": "612_001",
		  "title": "lbl.sec_activeSubstances",
		  "tabPanel": true,
		  "sequence": 7,
		  "multiContext": true,
		  "contextPath": "drugProducts$.activeSubstances$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": false
		  },
		  "fields": [
			{ "fieldId": "612003" },
			{ "fieldId": "612009" },
			{ "fieldId": "612008" },
			{ "fieldId": "612006" },
			{ "fieldId": "612007" },
			{ "fieldId": "612004" },
			{ "fieldId": "612005" },
			{ "fieldId": "612001" },
			{ "fieldId": "612002" }
		  ],
		  "gridFields": [
			{ "fieldId": "612003" },
			{ "fieldId": "612006" },
			{ "fieldId": "612007" }
		  ]
		},
		{
		  "sectionId": "620_001",
		  "title": "lbl.sec_drugIndications",
		  "tabPanel": true,
		  "sequence": 8,
		  "multiContext": true,
		  "contextPath": "drugProducts$.drugIndications$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": false
		  },
		  "fields": [
			{ "fieldId": "620001" },
			{ "fieldId": "620002" },
			{ "fieldId": "620003" }
		  ],
		  "gridFields": [
			{ "fieldId": "620001" },
			{ "fieldId": "620002" }
		  ]
		},
		{
		  "sectionId": "615_001",
		  "title": "lbl.sec_drugTherapies",
		  "tabPanel": true,
		  "sequence": 9,
		  "multiContext": true,
		  "contextPath": "drugProducts$.drugTherapies$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": true,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "sections": [
			{
			  "sectionId": "615_001_A",
			  "title": "lbl.sec_therapyDates",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "615031" },
				{ "fieldId": "615032" },
				{ "fieldId": "615027" },
				{ "fieldId": "615028" },
				{ "fieldId": "615029" },
				{ "fieldId": "615026" },
				{ "fieldId": "615007" },
				{ "fieldId": "615008" }
			  ]
			},
			{
			  "sectionId": "615_001_B",
			  "title": "lbl.sec_therapyDose",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "615035" },
				{ "fieldId": "615036" },
				{ "fieldId": "615003" },
				{ "fieldId": "615004" },
				{ "fieldId": "615033" },
				{ "fieldId": "615034" },
				{ "fieldId": "615001" },
				{ "fieldId": "615002" },
				{ "fieldId": "615005" }
			  ]
			},
			{
			  "sectionId": "615_001_C",
			  "title": "lbl.sec_therapyFrequency",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "615012" },
				{ "fieldId": "615013" },
				{ "fieldId": "615014" },
				{ "fieldId": "615006" }
			  ]
			},
			{
			  "sectionId": "615_001_D",
			  "title": "lbl.sec_therapyRoute",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "615023" },
				{ "fieldId": "615025" },
				{ "fieldId": "615024" },
				{ "fieldId": "615020" },
				{ "fieldId": "615009" },
				{ "fieldId": "615022" },
				{ "fieldId": "615021" },
				{ "fieldId": "615010" },
				{ "fieldId": "615011" }
			  ]
			},
			{
			  "sectionId": "615_001_E",
			  "title": "lbl.sec_therapyLot",
			  "sequence": 5,
			  "fields": [
				{ "fieldId": "615017" },
				{ "fieldId": "615016" },
				{ "fieldId": "615030" },
				{ "fieldId": "615037" },
				{ "fieldId": "615015" }
			  ]
			},
			{
			  "sectionId": "615_001_F",
			  "title": "lbl.sec_therapyDoctor",
			  "sequence": 6,
			  "fields": [
				{ "fieldId": "615043" },
				{ "fieldId": "615039" },
				{ "fieldId": "615041" },
				{ "fieldId": "615040" },
				{ "fieldId": "615042" },
				{ "fieldId": "615038" }
			  ]
			},
			{
			  "sectionId": "617_001",
			  "title": "lbl.sec_vaccFacility",
			  "sequence": 7,
			  "renderCondition": "RULE_ICSR_DRUG_VACCINE_SECTION",
			  "multiContext": true,
			  "contextPath": "drugProducts$.drugTherapies$.drugTherapyVaccineCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "617007" },
				{ "fieldId": "617011" },
				{ "fieldId": "617001" },
				{ "fieldId": "617002" },
				{ "fieldId": "617003" },
				{ "fieldId": "617009" },
				{ "fieldId": "617008" },
				{ "fieldId": "617004" },
				{ "fieldId": "617010" },
				{ "fieldId": "617005" },
				{ "fieldId": "617006" }
			  ],
			  "gridFields": [
				{ "fieldId": "617007" },
				{ "fieldId": "617011" },
				{ "fieldId": "617004" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "615031" },
			{ "fieldId": "615027" },
			{ "fieldId": "615035" },
			{ "fieldId": "615036" },
			{ "fieldId": "615023" }
		  ]
		},
		{
		  "sectionId": "630_001",
		  "title": "lbl.sec_drugApprovals",
		  "tabPanel": true,
		  "sequence": 10,
		  "multiContext": true,
		  "contextPath": "drugProducts$.drugApprovalCollection$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "fields": [
			{ "fieldId": "630006" },
			{ "fieldId": "630004" },
			{ "fieldId": "630005" },
			{ "fieldId": "630026" },
			{ "fieldId": "630019" },
			{ "fieldId": "630018" },
			{ "fieldId": "630025" },
			{ "fieldId": "630024" },
			{ "fieldId": "630029" },
			{ "fieldId": "630007" },
			{ "fieldId": "630011" },
			{ "fieldId": "630013" },
			{ "fieldId": "630015" },
			{ "fieldId": "630022" },
			{ "fieldId": "630014" },
			{ "fieldId": "630021" },
			{ "fieldId": "630030" }
		  ],
		  "gridFields": [
			{ "fieldId": "630006" },
			{ "fieldId": "630004" },
			{ "fieldId": "630005" },
			{ "fieldId": "630026" }
		  ]
		},
		{
		  "sectionId": "625_001",
		  "title": "lbl.sec_productDevices",
		  "tabPanel": true,
		  "sequence": 11,
		  "renderCondition": "RULE_ICSR_DRUG_DEVICE_SECTION",
		  "multiContext": true,
		  "contextPath": "drugProducts$.productDevices$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "sections": [
			{
			  "sectionId": "625_001_A",
			  "title": "lbl.sec_deviceIdentification",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "625005" },
				{ "fieldId": "625008" },
				{ "fieldId": "625038" },
				{ "fieldId": "625039" },
				{ "fieldId": "625064" },
				{ "fieldId": "625063" },
				{ "fieldId": "625076" },
				{ "fieldId": "625006" },
				{ "fieldId": "625047" },
				{ "fieldId": "625073" },
				{ "fieldId": "625018" },
				{ "fieldId": "625007" },
				{ "fieldId": "625002" },
				{ "fieldId": "625035" },
				{ "fieldId": "625003" }
			  ]
			},
			{
			  "sectionId": "625_001_B",
			  "title": "lbl.sec_deviceDates",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "625025" },
				{ "fieldId": "625024" },
				{ "fieldId": "625014" },
				{ "fieldId": "625013" },
				{ "fieldId": "625027" },
				{ "fieldId": "625026" },
				{ "fieldId": "625016" },
				{ "fieldId": "625017" },
				{ "fieldId": "625066" },
				{ "fieldId": "625028" }
			  ]
			},
			{
			  "sectionId": "625_001_C",
			  "title": "lbl.sec_deviceEvaluation",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "625022" },
				{ "fieldId": "625067" },
				{ "fieldId": "625012" },
				{ "fieldId": "625068" },
				{ "fieldId": "625015" },
				{ "fieldId": "625011" },
				{ "fieldId": "625077" },
				{ "fieldId": "625055" },
				{ "fieldId": "625042" },
				{ "fieldId": "625043" },
				{ "fieldId": "625044" },
				{ "fieldId": "625057" },
				{ "fieldId": "625060" },
				{ "fieldId": "625062" },
				{ "fieldId": "625074" },
				{ "fieldId": "625085" },
				{ "fieldId": "625086" },
				{ "fieldId": "625087" }
			  ]
			},
			{
			  "sectionId": "625_001_D",
			  "title": "lbl.sec_deviceNomenclature",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "625052" },
				{ "fieldId": "625053" },
				{ "fieldId": "625054" },
				{ "fieldId": "625019" },
				{ "fieldId": "625020" },
				{ "fieldId": "625021" }
			  ]
			},
			{
			  "sectionId": "625_001_E",
			  "title": "lbl.sec_deviceReporting",
			  "sequence": 5,
			  "fields": [
				{ "fieldId": "625009" },
				{ "fieldId": "625048" },
				{ "fieldId": "625049" },
				{ "fieldId": "625046" },
				{ "fieldId": "625069" },
				{ "fieldId": "625034" },
				{ "fieldId": "625070" },
				{ "fieldId": "625045" },
				{ "fieldId": "625072" },
				{ "fieldId": "625078" },
				{ "fieldId": "625079" },
				{ "fieldId": "625041" },
				{ "fieldId": "625071" },
				{ "fieldId": "625082" },
				{ "fieldId": "625081" },
				{ "fieldId": "625051" },
				{ "fieldId": "625001" },
				{ "fieldId": "625010" },
				{ "fieldId": "625023" }
			  ]
			},
			{
			  "sectionId": "627_001",
			  "title": "lbl.sec_deviceManufacturers",
			  "sequence": 6,
			  "multiContext": true,
			  "contextPath": "drugProducts$.productDevices$.deviceManufacturerers$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "627005" },
				{ "fieldId": "627004" },
				{ "fieldId": "627003" },
				{ "fieldId": "627001" },
				{ "fieldId": "627006" },
				{ "fieldId": "627002" }
			  ],
			  "gridFields": [
				{ "fieldId": "627005" },
				{ "fieldId": "627002" }
			  ]
			},
			{
			  "sectionId": "628_001",
			  "title": "lbl.sec_deviceProblemEval",
			  "sequence": 7,
			  "multiContext": true,
			  "contextPath": "drugProducts$.productDevices$.deviceProblemEvaluationCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "628001" },
				{ "fieldId": "629002" }
			  ],
			  "gridFields": [
				{ "fieldId": "628001" },
				{ "fieldId": "629002" }
			  ]
			},
			{
			  "sectionId": "629_001",
			  "title": "lbl.sec_deviceImdrfEval",
			  "sequence": 8,
			  "multiContext": true,
			  "contextPath": "drugProducts$.productDevices$.deviceProblemEvaluationIMDRFCollection$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "629005" },
				{ "fieldId": "629006" },
				{ "fieldId": "629007" },
				{ "fieldId": "629008" },
				{ "fieldId": "629009" }
			  ],
			  "gridFields": [
				{ "fieldId": "629005" },
				{ "fieldId": "629006" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "625005" },
			{ "fieldId": "625076" },
			{ "fieldId": "625047" },
			{ "fieldId": "625018" }
		  ]
		},
		{
		  "sectionId": "635_001",
		  "title": "lbl.sec_drugRelatedness",
		  "tabPanel": true,
		  "sequence": 12,
		  "multiContext": true,
		  "contextPath": "drugProducts$.drugReactionRelatednes$",
		  "dataGridConfig": {
			"allowAdd": true,
			"allowDelete": true,
			"allowCopy": false,
			"pagination": true,
			"pageSizeOptions": [5, 10]
		  },
		  "sections": [
			{
			  "sectionId": "635_001_A",
			  "title": "lbl.sec_relatednessCore",
			  "sequence": 1,
			  "fields": [
				{ "fieldId": "635004" },
				{ "fieldId": "635002" },
				{ "fieldId": "635018" },
				{ "fieldId": "635005" },
				{ "fieldId": "635010" },
				{ "fieldId": "635017" },
				{ "fieldId": "635015" }
			  ]
			},
			{
			  "sectionId": "635_001_B",
			  "title": "lbl.sec_causality",
			  "sequence": 2,
			  "fields": [
				{ "fieldId": "635008" },
				{ "fieldId": "635019" },
				{ "fieldId": "635009" },
				{ "fieldId": "635020" },
				{ "fieldId": "635016" }
			  ]
			},
			{
			  "sectionId": "635_001_C",
			  "title": "lbl.sec_latency",
			  "sequence": 3,
			  "fields": [
				{ "fieldId": "635022" },
				{ "fieldId": "635023" },
				{ "fieldId": "635012" },
				{ "fieldId": "635013" }
			  ]
			},
			{
			  "sectionId": "635_001_D",
			  "title": "lbl.sec_relatednessFlags",
			  "sequence": 4,
			  "fields": [
				{ "fieldId": "635006" },
				{ "fieldId": "635007" },
				{ "fieldId": "635001" },
				{ "fieldId": "635003" },
				{ "fieldId": "635014" },
				{ "fieldId": "635024" },
				{ "fieldId": "635011" },
				{ "fieldId": "635021" }
			  ]
			},
			{
			  "sectionId": "636_001",
			  "title": "lbl.sec_reactionLabellings",
			  "sequence": 5,
			  "multiContext": true,
			  "contextPath": "drugProducts$.drugReactionRelatednes$.drugReactionLabellings$",
			  "dataGridConfig": {
				"allowAdd": true,
				"allowDelete": true,
				"allowCopy": false,
				"pagination": false
			  },
			  "fields": [
				{ "fieldId": "636002" },
				{ "fieldId": "636003" },
				{ "fieldId": "636004" },
				{ "fieldId": "636005" },
				{ "fieldId": "636006" },
				{ "fieldId": "636001" }
			  ],
			  "gridFields": [
				{ "fieldId": "636002" },
				{ "fieldId": "636003" },
				{ "fieldId": "636006" }
			  ]
			}
		  ],
		  "gridFields": [
			{ "fieldId": "635004" },
			{ "fieldId": "635008" },
			{ "fieldId": "635019" },
			{ "fieldId": "635010" },
			{ "fieldId": "635017" }
		  ]
		}
	  ],
	  "gridFields": [
		{ "fieldId": "610052" },
		{ "fieldId": "610050" },
		{ "fieldId": "610001" },
		{ "fieldId": "610017" },
		{ "fieldId": "610018" }
	  ]
	},
	{
	  "sectionId": "640",
	  "title": "lbl.sec_labTests",
	  "sequence": 15,
	  "multiContext": true,
	  "contextPath": "labTests$",
	  "dataGridConfig": {
		"allowAdd": true,
		"allowDelete": true,
		"allowCopy": true,
		"pagination": true,
		"pageSizeOptions": [5, 10, 25]
	  },
	  "sections": [
		{
		  "sectionId": "640_001",
		  "title": "lbl.sec_labTestCore",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "640009" },
			{ "fieldId": "640010" },
			{ "fieldId": "640011" },
			{ "fieldId": "640008" }
		  ]
		},
		{
		  "sectionId": "640_002",
		  "title": "lbl.sec_labTestResult",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "640013" },
			{ "fieldId": "640012" },
			{ "fieldId": "640014" },
			{ "fieldId": "640007" },
			{ "fieldId": "640006" },
			{ "fieldId": "640005" }
		  ]
		},
		{
		  "sectionId": "640_003",
		  "title": "lbl.sec_labTestAdmin",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "640001" },
			{ "fieldId": "640004" },
			{ "fieldId": "640002" },
			{ "fieldId": "640003" }
		  ]
		}
	  ],
	  "gridFields": [
		{ "fieldId": "640009" },
		{ "fieldId": "640008" },
		{ "fieldId": "640013" },
		{ "fieldId": "640012" },
		{ "fieldId": "640014" }
	  ]
	},
	{
	  "sectionId": "645",
	  "title": "lbl.sec_literature",
	  "sequence": 16,
	  "multiContext": true,
	  "contextPath": "literatureCollection$",
	  "dataGridConfig": {
		"allowAdd": true,
		"allowDelete": true,
		"allowCopy": false,
		"pagination": true,
		"pageSizeOptions": [5, 10]
	  },
	  "sections": [
		{
		  "sectionId": "645_001",
		  "title": "lbl.sec_literatureCore",
		  "sequence": 1,
		  "fields": [
			{ "fieldId": "645009" },
			{ "fieldId": "645002" },
			{ "fieldId": "645007" },
			{ "fieldId": "645003" },
			{ "fieldId": "645008" }
		  ]
		},
		{
		  "sectionId": "645_002",
		  "title": "lbl.sec_publicationDetails",
		  "sequence": 2,
		  "fields": [
			{ "fieldId": "645012" },
			{ "fieldId": "645004" },
			{ "fieldId": "645006" },
			{ "fieldId": "645010" },
			{ "fieldId": "645011" }
		  ]
		},
		{
		  "sectionId": "645_003",
		  "title": "lbl.sec_literatureAdmin",
		  "sequence": 3,
		  "fields": [
			{ "fieldId": "645001" },
			{ "fieldId": "645013" },
			{ "fieldId": "645005" }
		  ]
		}
	  ],
	  "gridFields": [
		{ "fieldId": "645009" },
		{ "fieldId": "645002" },
		{ "fieldId": "645007" },
		{ "fieldId": "645012" }
	  ]
	}

  ]
}
') ON CONFLICT (NAME) DO NOTHING;


-- ICSR TRIAGE — FORM
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON) VALUES (gen_random_uuid()::VARCHAR,'ICSR','ICSR_TRIAGE','FORM','{
  "formID": "ICSR_TRIAGE",
  "formName": "ICSR Cases — Triage",
  "version": "1.0",
  "description": "Intake / triage form. Covers the ~40 fields needed to register, classify and route a new case. Full data entry is done via the Full Form after triage.",
  "layout": {
    "recordTitleField": "receiptNo",
    "enableFilterSection": false,
    "navigationWidth": "260px",
    "formPanelWidth": "75%",
    "responsive": { "webFieldsPerRow": 3, "tabletFieldsPerRow": 2, "mobileFieldsPerRow": 1 }
  },
  "formHeaderActions": [
    { "actionId": "switchForm", "label": "app.switchForm", "icon": "swap",  "type": "standard" },
    { "actionId": "save",       "label": "app.save",       "icon": "save",  "type": "standard" },
    { "actionId": "cancel",     "label": "app.cancel",     "icon": "close" }
  ],
  "sections": [
    {
      "sectionId": "500",
      "title": "lbl.sec_caseHeader",
      "sequence": 1,
      "sections": [
        {
          "sectionId": "500_001",
          "title": "lbl.sec_caseIdentification",
          "sequence": 1,
          "fields": [
            { "fieldId": "500001" },
            { "fieldId": "500033" },
            { "fieldId": "500031" },
            { "fieldId": "500007" },
            { "fieldId": "500008" },
            { "fieldId": "500005" },
            { "fieldId": "500006" }
          ]
        },
        {
          "sectionId": "500_002",
          "title": "lbl.sec_reportClassification",
          "sequence": 2,
          "fields": [
            { "fieldId": "500011" },
            { "fieldId": "500041" },
            { "fieldId": "500036" },
            { "fieldId": "500037" },
            { "fieldId": "500042" },
            { "fieldId": "500015" },
            { "fieldId": "500016" }
          ]
        },
        {
          "sectionId": "500_003",
          "title": "lbl.sec_seriousness",
          "sequence": 3,
          "fields": [
            { "fieldId": "500021" },
            { "fieldId": "500022" },
            { "fieldId": "500023" },
            { "fieldId": "500024" },
            { "fieldId": "500025" },
            { "fieldId": "500026" },
            { "fieldId": "500027" },
            { "fieldId": "500028" }
          ]
        },
        {
          "sectionId": "500_004",
          "title": "lbl.sec_assignmentOrg",
          "sequence": 4,
          "fields": [
            { "fieldId": "500065" },
            { "fieldId": "500066" },
            { "fieldId": "500070" },
            { "fieldId": "500071" },
            { "fieldId": "500062" }
          ]
        }
      ]
    },
    {
      "sectionId": "515",
      "title": "lbl.sec_reporterInformations",
      "sequence": 2,
      "sections": [
        {
          "sectionId": "515_001",
          "title": "lbl.sec_reporterInformations",
          "tabPanel": true,
          "sequence": 1,
          "multiContext": true,
          "contextPath": "reporterInformations$",
          "dataGridConfig": {
            "allowAdd": true,
            "allowDelete": true,
            "allowCopy": false,
            "pagination": true,
            "pageSizeOptions": [5, 10]
          },
          "sections": [
            {
              "sectionId": "515_001_A",
              "title": "lbl.sec_reporterCore",
              "sequence": 1,
              "fields": [
                { "fieldId": "515001" },
                { "fieldId": "515004" },
                { "fieldId": "515005" }
              ]
            },
            {
              "sectionId": "515_001_B",
              "title": "lbl.sec_reporterIdentity",
              "sequence": 2,
              "fields": [
                { "fieldId": "515007" },
                { "fieldId": "515008" },
                { "fieldId": "515009" }
              ]
            },
            {
              "sectionId": "515_001_C",
              "title": "lbl.sec_reporterProfessional",
              "sequence": 3,
              "fields": [
                { "fieldId": "515018" },
                { "fieldId": "515013" }
              ]
            },
            {
              "sectionId": "515_001_D",
              "title": "lbl.sec_reporterContact",
              "sequence": 4,
              "fields": [
                { "fieldId": "515028" },
                { "fieldId": "515030" },
                { "fieldId": "515031" }
              ]
            }
          ],
          "gridFields": [
            { "fieldId": "515009" },
            { "fieldId": "515004" },
            { "fieldId": "515018" },
            { "fieldId": "515028" },
            { "fieldId": "515001" }
          ]
        }
      ]
    },
    {
      "sectionId": "530",
      "title": "lbl.sec_patient",
      "sequence": 3,
      "sections": [
        {
          "sectionId": "530_001",
          "title": "lbl.sec_patientCore",
          "sequence": 1,
          "fields": [
            { "fieldId": "530001" },
            { "fieldId": "530009" },
            { "fieldId": "530002" },
            { "fieldId": "530004" },
            { "fieldId": "530005" },
            { "fieldId": "530006" },
            { "fieldId": "530007" }
          ]
        },
        {
          "sectionId": "530_002",
          "title": "lbl.sec_patientDeath",
          "sequence": 2,
          "renderCondition": "RULE_ICSR_PAT_DEATH_SECTION",
          "fields": [
            { "fieldId": "530037" }
          ]
        }
      ]
    },
    {
      "sectionId": "610",
      "title": "lbl.sec_drugProducts",
      "sequence": 4,
      "multiContext": true,
      "contextPath": "drugProducts$",
      "dataGridConfig": {
        "allowAdd": true,
        "allowDelete": true,
        "allowCopy": false,
        "pagination": true,
        "pageSizeOptions": [5, 10]
      },
      "sections": [
        {
          "sectionId": "610_001",
          "title": "lbl.sec_productIdentification",
          "sequence": 1,
          "fields": [
            { "fieldId": "610052" },
            { "fieldId": "610034" },
            { "fieldId": "610050" },
            { "fieldId": "610001" },
            { "fieldId": "610028" }
          ]
        }
      ],
      "gridFields": [
        { "fieldId": "610052" },
        { "fieldId": "610050" },
        { "fieldId": "610001" }
      ]
    },
    {
      "sectionId": "600",
      "title": "lbl.sec_eventReactions",
      "sequence": 5,
      "multiContext": true,
      "contextPath": "eventReactions$",
      "dataGridConfig": {
        "allowAdd": true,
        "allowDelete": true,
        "allowCopy": false,
        "pagination": true,
        "pageSizeOptions": [5, 10]
      },
      "sections": [
        {
          "sectionId": "600_001",
          "title": "lbl.sec_reactionTerm",
          "sequence": 1,
          "fields": [
            { "fieldId": "600029" },
            { "fieldId": "600015" },
            { "fieldId": "600016" }
          ]
        },
        {
          "sectionId": "600_002",
          "title": "lbl.sec_reactionDates",
          "sequence": 2,
          "fields": [
            { "fieldId": "600024" },
            { "fieldId": "600013" },
            { "fieldId": "600014" }
          ]
        },
        {
          "sectionId": "600_003",
          "title": "lbl.sec_reactionOutcome",
          "sequence": 3,
          "fields": [
            { "fieldId": "600026" },
            { "fieldId": "600043" }
          ]
        }
      ],
      "gridFields": [
        { "fieldId": "600029" },
        { "fieldId": "600015" },
        { "fieldId": "600024" },
        { "fieldId": "600026" },
        { "fieldId": "600043" }
      ]
    }
  ]
}
') ON CONFLICT (NAME) DO NOTHING;


-- ICSR LISTING METADATA
DELETE FROM UI_METADATA WHERE MODULE_ID = 'ICSR' AND TYPE = 'LISTING';
INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON)
VALUES (gen_random_uuid()::VARCHAR, 'ICSR', 'ICSR_LISTING', 'LISTING', '{
  "module": "ICSR",
  "title": "ICSR Cases",
  "defaultSort": { "fieldId": "500007", "direction": "desc" },
  "FILTERS_FIELDS": [
    { "fieldId": "500001" },
    { "fieldId": "500011" },
    { "fieldId": "500021" },
    { "fieldId": "500005" },
    { "fieldId": "500007" },
    { "fieldId": "500008" },
    { "fieldId": "500042" },
    { "fieldId": "500065" },
    { "fieldId": "530002" },
    { "fieldId": "600026" }
  ],
  "GRID_FIELDS": [
    { "fieldId": "500001" },
    { "fieldId": "500002" },
    { "fieldId": "500031" },
    { "fieldId": "500011" },
    { "fieldId": "500041" },
    { "fieldId": "500005" },
    { "fieldId": "500007" },
    { "fieldId": "500008" },
    { "fieldId": "500021" },
    { "fieldId": "500022" },
    { "fieldId": "500023" },
    { "fieldId": "500024" },
    { "fieldId": "500037" },
    { "fieldId": "500043" },
    { "fieldId": "500042" },
    { "fieldId": "500065" },
    { "fieldId": "500066" },
    { "fieldId": "530001" },
    { "fieldId": "530002" },
    { "fieldId": "530005" },
    { "fieldId": "530006" },
    { "fieldId": "530007" },
    { "fieldId": "600029" },
    { "fieldId": "600026" },
    { "fieldId": "600031" }
  ],
  "DASHBOARD_WIDGETS": [
    {
      "widgetId": "totalCases",
      "label": "lbl.widget_totalCases",
      "iconColor": "blue",
      "icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2",
      "filters": []
    },
    {
      "widgetId": "seriousCases",
      "label": "lbl.widget_seriousCases",
      "iconColor": "red",
      "icon": "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z",
      "filters": [{ "field": "seriousness", "operator": "eq", "value": "Y" }]
    },
    {
      "widgetId": "susarCases",
      "label": "lbl.widget_susarCases",
      "iconColor": "orange",
      "icon": "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z",
      "filters": [{ "field": "susar", "operator": "eq", "value": "Y" }]
    },
    {
      "widgetId": "openCases",
      "label": "lbl.widget_openCases",
      "iconColor": "green",
      "icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z",
      "filters": [{ "field": "aerApprovalStatus", "operator": "eq", "value": "OPEN" }]
    },
    {
      "widgetId": "overdueCases",
      "label": "lbl.widget_overdueCases",
      "iconColor": "red",
      "icon": "M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z",
      "filters": [{ "field": "caseDueDate", "operator": "lt", "value": "TODAY" }]
    }
  ]
}
')ON CONFLICT (NAME) DO NOTHING;


-- ICSR I18N LABELS

DELETE FROM UI_METADATA WHERE MODULE_ID = 'ICSR' AND TYPE = 'I18N';

INSERT INTO UI_METADATA (ID, MODULE_ID, NAME, TYPE, METADATA_JSON)
VALUES (gen_random_uuid()::VARCHAR, 'ICSR', 'ICSR_LABELS', 'I18N', '{
    "en": {
        "lbl.sec_caseHeader": "Case Header",
        "lbl.sec_caseIdentification": "Case Identification",
        "lbl.sec_reportClassification": "Report Classification",
        "lbl.sec_caseDates": "Case Dates",
        "lbl.sec_seriousness": "Seriousness Criteria",
        "lbl.sec_caseFlags": "Case Flags",
        "lbl.sec_assignmentOrg": "Assignment & Organisation",
        "lbl.sec_followUp": "Follow-Up",
        "lbl.sec_nonCase": "Non-Case / Removal",
        "lbl.sec_codingStatus": "Coding Status",
        "lbl.sec_adminAudit": "Admin & Audit",
        "lbl.safetyReportId": "Safety Report ID",
        "lbl.safetyReportVersion": "Version",
        "lbl.authorityNumb": "Authority / Company Number",
        "lbl.aerNo": "AER Number",
        "lbl.aerVersionNo": "AER Version",
        "lbl.receiptNo": "Receipt No.",
        "lbl.lrn": "LRN",
        "lbl.mappedAerNo": "Mapped AER Number",
        "lbl.otherSafetyRef": "Other Safety Ref#",
        "lbl.otherSafetyRefVer": "Other Safety Ref# Ver.",
        "lbl.reportType": "Report Type",
        "lbl.initialOrFollowup": "Initial / Follow-Up",
        "lbl.caseNullification": "Nullification / Amendment",
        "lbl.nullificationReason": "Reason for Nullification / Amendment",
        "lbl.reportClassification": "Report Category",
        "lbl.reportClassificationCategory": "Report Classification",
        "lbl.safetyReportType": "Safety Report Type",
        "lbl.safetyClassification": "Safety / Efficacy Classification",
        "lbl.caseType": "Case Type",
        "lbl.icsrFlag": "ICSR Flag",
        "lbl.casePriority": "Local Criteria Report Type",
        "lbl.priority": "Report Priority",
        "lbl.classificationType": "Classification Type",
        "lbl.receiveDate": "Initial Received Date",
        "lbl.receiptDate": "Latest Received Date",
        "lbl.regulatoryStartDate": "Regulatory Clock Start Date",
        "lbl.regClockStartDateComment": "Comment on Regulatory Clock Start Date",
        "lbl.companyInitialReceivedDate": "Company Initial Received Date",
        "lbl.companyReceivedDate": "Company Received Date",
        "lbl.caseDueDate": "Case Due Date",
        "lbl.submissionDueDate": "Submission Due Date",
        "lbl.aerApprovalDate": "Case Approval Date",
        "lbl.initialCaseApprovalDate": "Case Initial Approval Date",
        "lbl.aerCloseDate": "AER Close Date",
        "lbl.seriousness": "Serious?",
        "lbl.death": "Death?",
        "lbl.lifethreatening": "Life Threatening?",
        "lbl.hospitalization": "Caused/Prolonged Hospitalization?",
        "lbl.disabling": "Disability / Permanent Damage?",
        "lbl.congenitalAnomaly": "Congenital Anomaly",
        "lbl.otherSerious": "Other Medically Important Condition?",
        "lbl.requiredIntervention": "Required Intervention?",
        "lbl.fulfillExpediteCriteria": "Locally Expedited",
        "lbl.medicallyConfirm": "Medically Confirmed",
        "lbl.additionalDoc": "Additional Documents Available",
        "lbl.susar": "SUSAR",
        "lbl.isCaseAesi": "AESI?",
        "lbl.batchUnblinding": "Batch Unblinding?",
        "lbl.combinationProductReport": "Combination Product Report",
        "lbl.noProduct": "No Product",
        "lbl.noSuspectProduct": "No Suspect Product",
        "lbl.followUp": "Follow Up",
        "lbl.caseVersionSignificance": "Case Significance",
        "lbl.assignedTo": "Assigned To",
        "lbl.caseOwner": "Case Owner",
        "lbl.assessor": "Assessor",
        "lbl.safetyManager": "Safety Manager",
        "lbl.safetyManagerApprovalDate": "Safety Manager Approval Date",
        "lbl.companyUnit": "Company Unit",
        "lbl.processingUnit": "Processing Unit",
        "lbl.accountName": "Sender Organisation (Coded)",
        "lbl.reportedSender": "Sender Organisation (Reported)",
        "lbl.mediumCode": "Report Receiving Medium",
        "lbl.sourceAeFormType": "Report Receiving Format",
        "lbl.mahIdentification": "MAH Identification",
        "lbl.followUpRef": "Follow-Up Ref#",
        "lbl.followUpStatement": "Follow-Up Statement",
        "lbl.followUpStatementWithData": "Follow-Up Statement with Data",
        "lbl.followUpStatementChangeNarrative": "Follow-Up Statement — Changes to Initial Narrative",
        "lbl.followUpNotified": "Follow-Up Notified",
        "lbl.followUpReceived": "Follow-Up Received",
        "lbl.nonCaseReason": "Non-Case Assessment Reason",
        "lbl.nonCaseComments": "Non-Case Comments",
        "lbl.publishReportReason": "Publish Report Assessment Reason",
        "lbl.removeReasonCode": "Remove Reason Code",
        "lbl.removeReasonComment": "Remove Reason Comment",
        "lbl.drugCoded": "Drug Coded",
        "lbl.eventCoded": "Event Coded",
        "lbl.drugIndicationCoded": "Drug Indication Coded",
        "lbl.partiallyCoded": "Partially Coded",
        "lbl.completionFlag": "Completion Flag",
        "lbl.latestAer": "Latest AER",
        "lbl.latestApproved": "Latest Approved",
        "lbl.aerApprovalStatus": "Is Case Approved?",
        "lbl.caseQualityScore": "Case Quality Score",
        "lbl.archivedDate": "Archived Date",
        "lbl.caseMigratedFrom": "Case Migrated From",
        "lbl.compoundOutsourcing503b": "Compounding Outsourcing Facility 503B?",
        "lbl.exemptionNumber": "Exemption Number",
        "lbl.formCode": "Form Code",
        "lbl.customFormName": "Form Name",
        "lbl.stoppedOutWf": "Stopped Out of Workflow",
        "lbl.stoppedWfTasks": "Stopped Workflow Tasks",
        "lbl.linkedReason": "Linked Case Reason",
        "lbl.deviceProblemLabeling": "Device Problem Labeling",
        "lbl.deviceProblemReportOutcome": "Device Problem Report Outcome",
        "lbl.overallLatenessReason": "Delays Identified",
        "lbl.latenessComments": "Inbound Lateness Comments",
        "lbl.inboundLatenessReason": "Inbound Lateness Reason",
        "lbl.correctiveActionCategory": "Corrective Action Category",
        "lbl.sec_caseDocuments": "Case Documents",
        "lbl.fileName": "File Name",
        "lbl.isDocumentIncluded": "Document Included?",
        "lbl.fileS3Path": "File Path",
        "lbl.sec_reporterInformations": "Reporter Information",
        "lbl.sec_reporterCore": "Regulatory Details",
        "lbl.sec_reporterIdentity": "Reporter Identity",
        "lbl.sec_reporterProfessional": "Professional Details",
        "lbl.sec_reporterContact": "Contact Details",
        "lbl.primaryReporter": "Primary Reporter",
        "lbl.e2bRegulatoryPurpose": "Primary Source for Regulatory Purposes",
        "lbl.doNotReportName": "Protect Confidentiality",
        "lbl.reporterQualification": "Qualification",
        "lbl.reporterSentToFDA": "Reporter Informed Authority Directly",
        "lbl.reporterTitle": "Title",
        "lbl.reporterGivenName": "First Name",
        "lbl.reporterMiddleName": "Middle Name",
        "lbl.reporterFamilyName": "Last Name",
        "lbl.reporterOrContact": "Person Type",
        "lbl.consentToContacts": "Consent to Contact",
        "lbl.canFollowUp": "Can Follow Up",
        "lbl.isHealthProf": "Health Professional",
        "lbl.occupation": "Occupation",
        "lbl.speciality": "Specialization",
        "lbl.hcpClassification": "HCP Detailed Classification",
        "lbl.otherHCP": "Other Healthcare Professional",
        "lbl.reporterOrganization": "Hospital / Organisation Name",
        "lbl.reporterDepartment": "Department",
        "lbl.physicianCode": "Physician / HCP Code",
        "lbl.literatureReference": "Literature Reference",
        "lbl.reporterStreet": "Street",
        "lbl.streetAddress": "Street Address",
        "lbl.poBox": "P.O. Box",
        "lbl.reporterCity": "City",
        "lbl.reporterState": "State",
        "lbl.reporterPostCode": "Postal Code",
        "lbl.reporterCountry": "Country",
        "lbl.reporterPhone": "Telephone",
        "lbl.reporterPhoneResidence": "Telephone (Residence)",
        "lbl.reporterFax": "Fax",
        "lbl.reporterEmail": "Email",
        "lbl.reporterCountryPractice": "Country of Practice",
        "lbl.sec_sourceInformations": "Source Information",
        "lbl.sec_sourceCore": "Source Details",
        "lbl.sec_sourceReference": "Reference Details",
        "lbl.primarySource": "Primary Source",
        "lbl.source": "Source",
        "lbl.dateReceived": "Date Received",
        "lbl.originatingAccount": "Sender Organisation",
        "lbl.senderOrganisationType": "Sender Organisation Type",
        "lbl.sourceFollowUp": "Follow Up",
        "lbl.identificationNo": "Reference Number",
        "lbl.referenceType": "Reference Type",
        "lbl.sourceAerNumber": "Source AER Version",
        "lbl.sourceDescription": "Description",
        "lbl.sec_patient": "Patient",
        "lbl.sec_patientCore": "Patient Identification",
        "lbl.sec_patientDemographics": "Demographics",
        "lbl.sec_patientPhysical": "Physical Characteristics",
        "lbl.sec_patientMedical": "Medical Background",
        "lbl.sec_patientDeath": "Death / Autopsy",
        "lbl.sec_patientContact": "Contact Details",
        "lbl.sec_patientRecords": "Record Numbers",
        "lbl.sec_patientVaccine": "Vaccine Information",
        "lbl.sec_biologicalFather": "Biological Father",
        "lbl.sec_patientAdmin": "Administrative",
        "lbl.patientInitial": "Patient ID / Initials",
        "lbl.patDoNotReportName": "Protect Confidentiality",
        "lbl.patientIdentify": "Identifiable Patient",
        "lbl.patSex": "Sex",
        "lbl.patGender": "Gender Identity",
        "lbl.patDob": "Date of Birth",
        "lbl.patOnsetAge": "Age at Time of Event",
        "lbl.patOnsetAgeUnit": "Age Unit",
        "lbl.patAgeGroup": "Age Group",
        "lbl.patientAgeInYears": "Age (Years)",
        "lbl.patTitle": "Title",
        "lbl.patFirstName": "First Name",
        "lbl.patMiddleName": "Middle Name",
        "lbl.patLastName": "Last Name",
        "lbl.patGenderOther": "Specify Other Gender",
        "lbl.race": "Race",
        "lbl.ethnicity": "Ethnicity",
        "lbl.consentToContact": "Consent to Contact Patient",
        "lbl.patFollowUp": "Can Follow Up",
        "lbl.militaryStatus": "Military Status",
        "lbl.patWeight": "Weight",
        "lbl.patWeightUnit": "Weight Unit",
        "lbl.patHeight": "Height",
        "lbl.patHeightUnit": "Height Unit",
        "lbl.birthWeight": "Birth Weight",
        "lbl.birthWeightUnit": "Birth Weight Unit",
        "lbl.bodyMassIndex": "Body Mass Index",
        "lbl.bodySurfaceIndex": "Body Surface Index",
        "lbl.patLMP": "Last Menstrual Period Date",
        "lbl.patientPregnant": "Pregnant?",
        "lbl.gestationalAge": "Gestational Age at Event",
        "lbl.gestationalAgeUnit": "Gestational Age Unit",
        "lbl.patMedicalHistoryText": "Medical History and Concurrent Conditions",
        "lbl.resultsTestsProcedures": "Results of Tests and Procedures",
        "lbl.concomitantTherapies": "Concomitant Therapies",
        "lbl.healthDamageType": "Health Damage",
        "lbl.patDeathDate": "Date of Death",
        "lbl.patAutopsyYesNo": "Autopsy Done?",
        "lbl.patAutopsyDate": "Date of Autopsy",
        "lbl.patAddress1": "Street",
        "lbl.patAddress2": "Street Address",
        "lbl.patCity": "City",
        "lbl.patState": "State",
        "lbl.patZipCode": "Postal Code",
        "lbl.patCountry": "Country",
        "lbl.patCounty": "County",
        "lbl.patPhone": "Telephone",
        "lbl.patEmail": "Email",
        "lbl.patHospitalRecordNumb": "Hospital Record Number",
        "lbl.patMedicalRecordNumb": "GP Medical Record Number",
        "lbl.patSpecialistRecordNumb": "Specialist Record Number",
        "lbl.patInvestigationNumb": "Investigation Number",
        "lbl.patRegistrationNo": "Registration Number",
        "lbl.ageAtVaccine": "Age at Time of Vaccination",
        "lbl.ageAtVaccineUnit": "Age at Vaccination Unit",
        "lbl.illnessAtVaccine": "Illness at Time of Vaccination",
        "lbl.vaccineMeddraPT": "MedDRA PT — Illness at Vaccination",
        "lbl.vaccineMeddraLLT": "MedDRA LLT — Illness at Vaccination",
        "lbl.pregnantAtVaccine": "Pregnant at Time of Vaccination",
        "lbl.partnerName": "Biological Father Name",
        "lbl.partnerDOB": "Biological Father Date of Birth",
        "lbl.biologicalFatherAge": "Biological Father Age",
        "lbl.biologicalFatherAgeUnit": "Biological Father Age Unit",
        "lbl.partnerContactDtls": "Biological Father Contact Details",
        "lbl.eventStartDate": "Date of Event",
        "lbl.userIntendedRecepient": "User is Not Intended Recipient",
        "lbl.sec_patientSummary": "Case Summary",
        "lbl.sec_caseNarrative": "Case Narrative",
        "lbl.sec_medicalAssessment": "Medical Assessment",
        "lbl.sec_clinicalNarrative": "Clinical Narrative",
        "lbl.sec_correctiveActions": "Corrective / Preventive Actions",
        "lbl.companyNarrative": "Event Description (Company Narrative)",
        "lbl.reporterComment": "Reaction Description as per Reporter",
        "lbl.senderComment": "Company Remarks (Sender''s Comments)",
        "lbl.summaryDescription": "Summary Description",
        "lbl.evaluationComments": "Pharmacovigilance Comments",
        "lbl.evaluationSummary": "Evaluation Summary",
        "lbl.additionalInformation": "Additional Information",
        "lbl.additionalComments": "Additional Comments",
        "lbl.whatFurtherInvestigations": "Further Investigations Planned",
        "lbl.patientDuringEvent": "Description of Patient During Event",
        "lbl.treatmentFollowingEvent": "Treatment Following Event",
        "lbl.manufacturerNarrative": "Final Comments from Manufacturer",
        "lbl.additionalManufacturerNarrative": "Additional Manufacturer Narrative",
        "lbl.correctiveActions": "Corrective Actions",
        "lbl.correctivePreventionNarrative": "Corrective / Preventive Action Narrative",
        "lbl.identifiedActionsNarrative": "Identified Actions Narrative",
        "lbl.correctedData": "Corrected Data",
        "lbl.productComplaintDetails": "Product Complaint Details",
        "lbl.initialManufacturerAnalysis": "Initial Manufacturer Analysis",
        "lbl.summaryFollowUp": "Follow Up",
        "lbl.sec_medicalHistory": "Medical History",
        "lbl.sec_medHistCore": "Episode Details",
        "lbl.sec_medHistClassification": "Classification",
        "lbl.sec_medHistDuration": "Duration",
        "lbl.sec_medHistAdmin": "Coding & Admin",
        "lbl.medicalEpisodeName": "Disease / Condition Term",
        "lbl.medicalEpisodeLLT": "MedDRA LLT Code",
        "lbl.medicalHistoryPT": "MedDRA PT Code",
        "lbl.medicalStartDate": "Start Date",
        "lbl.medicalEndDate": "End Date",
        "lbl.medicalContinue": "Continuing?",
        "lbl.diseaseType": "Disease Type",
        "lbl.conditionTreated": "Condition Treated",
        "lbl.familyHistory": "Family History",
        "lbl.illnessAtVaccination": "Illness at Time of Vaccination",
        "lbl.medHistDuration": "Duration",
        "lbl.medHistDurationUnit": "Duration Unit",
        "lbl.codingType": "Coding Type",
        "lbl.medicalComment": "Comments",
        "lbl.sec_pastDrugTherapies": "Past Drug Therapies",
        "lbl.sec_pastDrugProduct": "Product Identification",
        "lbl.sec_pastDrugCoding": "MedDRA Coding & Product IDs",
        "lbl.sec_pastDrugDates": "Dates & Vaccination",
        "lbl.sec_pastDrugDetails": "Additional Details",
        "lbl.sec_pastDrugSubstances": "Substances",
        "lbl.pastDrugName": "Product Name As Reported",
        "lbl.pastProductDescription": "Product Description",
        "lbl.inventedName": "Invented Name",
        "lbl.tradeMarkName": "Trademark Name",
        "lbl.scientificName": "Scientific Name",
        "lbl.whoddCode": "WHO DD Code",
        "lbl.whoddMPID": "WHO DD MPID",
        "lbl.kddCode": "KDD Drug Code",
        "lbl.pastDrugIndication": "Indication Term",
        "lbl.pastDrugIndicationLLT": "MedDRA LLT — Indication",
        "lbl.pastDrugIndicationPT": "MedDRA PT — Indication",
        "lbl.pastDrugReaction": "Reaction Term",
        "lbl.pastDrugReactionLLT": "MedDRA LLT — Reaction",
        "lbl.pastDrugReactionPT": "MedDRA PT — Reaction",
        "lbl.mpid": "MPID",
        "lbl.mpidVersion": "MPID Version",
        "lbl.phpid": "PhPID",
        "lbl.phpidVersion": "PhPID Version",
        "lbl.medProductId": "Medicinal Product ID",
        "lbl.pastDrugStartDate": "Start Date",
        "lbl.pastDrugEndDate": "End Date",
        "lbl.pastDrugAgeAtVaccine": "Patient Age at Vaccination",
        "lbl.pastDrugAgeAtVaccineUnit": "Age at Vaccination Unit",
        "lbl.pastDrugFormName": "Form Name",
        "lbl.pastDrugStrengthName": "Strength Name",
        "lbl.containerName": "Container Name",
        "lbl.deviceName": "Device Name",
        "lbl.intendedUseName": "Intended Use",
        "lbl.substanceName": "Substance Name",
        "lbl.substanceTermId": "Substance TermID",
        "lbl.substanceTermIdVersion": "Substance TermID Version",
        "lbl.substanceStrengthNumber": "Strength (Number)",
        "lbl.substanceStrengthUnit": "Strength Unit",
        "lbl.sec_pregnancy": "Pregnancy",
        "lbl.sec_pregnancyDetails": "Pregnancy Details",
        "lbl.sec_pregnancyPhysical": "Physical / Delivery",
        "lbl.sec_pregnancyAdmin": "Follow-up & Comments",
        "lbl.sec_pregnancyOutcomes": "Pregnancy Outcomes",
        "lbl.sec_outcomeCore": "Outcome Details",
        "lbl.sec_prevPregnancyOutcomes": "Previous Pregnancy Outcomes",
        "lbl.sec_neonates": "Neonates",
        "lbl.sec_neonateCore": "Neonate Details",
        "lbl.sec_neonateAnomaly": "Congenital Anomaly",
        "lbl.sec_neonateApgar": "APGAR Scores",
        "lbl.sec_neonateNicu": "NICU Admission",
        "lbl.sec_neonateOther": "Other Details",
        "lbl.sec_neonateChildren": "Child Follow-up",
        "lbl.pregnancyType": "Pregnancy Type",
        "lbl.trimesterOfExposure": "Trimester of Exposure",
        "lbl.pregnancyConfirmDate": "Pregnancy Confirmation Date",
        "lbl.pregnancyConfirmMode": "Confirmation Mode",
        "lbl.expectedDueDate": "Expected Due Date",
        "lbl.gravidity": "Gravidity",
        "lbl.para": "Para",
        "lbl.plannedPregnancy": "Planned Pregnancy",
        "lbl.contraceptivesUsed": "Contraceptives Used",
        "lbl.contraceptiveFailure": "Contraceptive Failure",
        "lbl.typesOfContraceptives": "Types of Contraceptives",
        "lbl.prePregnancyWeight": "Pre-Pregnancy Weight",
        "lbl.prePregnancyWeightUnit": "Weight Unit",
        "lbl.deliveryMethod": "Method of Delivery",
        "lbl.familyHistoryBirthDefects": "Family History of Birth Defects",
        "lbl.pregnancyFollowUp": "Follow-up Expected",
        "lbl.pregnancyComments": "Comments",
        "lbl.pregnancyOutcome": "Pregnancy Outcome",
        "lbl.pregnancyOutcomeDate": "Outcome Date",
        "lbl.pregnancyEndDate": "Pregnancy End Date",
        "lbl.noOfFoetus": "Number of Foetuses",
        "lbl.liveBirthComplications": "Live Birth Complications",
        "lbl.pastPregnancyOutcome": "Past Pregnancy Outcome",
        "lbl.pastPregnancyOutcomeDetails": "Past Outcome Details",
        "lbl.noOfChildren": "Number of Children",
        "lbl.numberOfAbortions": "Number of Abortions",
        "lbl.birthOutcome": "Birth Outcome",
        "lbl.childSex": "Child Sex",
        "lbl.whichPregnancy": "Which Pregnancy",
        "lbl.currentPregnancy": "Current Pregnancy",
        "lbl.gestationalAgeBirth": "Gestational Age at Birth",
        "lbl.gestationalAgeBirthUnit": "Gestational Age Unit",
        "lbl.congenitalAnomalyType": "Anomaly Type",
        "lbl.apgarScore1": "APGAR Score (1 min)",
        "lbl.apgarScore5": "APGAR Score (5 min)",
        "lbl.apgarScore10": "APGAR Score (10 min)",
        "lbl.nicuAdmission": "NICU Admission",
        "lbl.admissionDuration": "Admission Duration",
        "lbl.admissionDurationUnit": "Duration Unit",
        "lbl.resuscitated": "Resuscitated",
        "lbl.otherNeonateDetails": "Other Neonate Details",
        "lbl.otherOutcomeDetails": "Other Outcome Details",
        "lbl.childAge": "Child Age",
        "lbl.childAgeUnit": "Child Age Unit",
        "lbl.headCircumBirth": "Head Circumference at Birth",
        "lbl.headCircumBirthUnit": "Head Circumference Unit",
        "lbl.neonBirthLength": "Birth Length",
        "lbl.neonBirthLengthUnit": "Birth Length Unit",
        "lbl.neonWeight": "Birth Weight",
        "lbl.neonWeightUnit": "Birth Weight Unit",
        "lbl.sec_deathCauses": "Death Causes",
        "lbl.sec_reportedDeathCauses": "Reported Causes of Death",
        "lbl.sec_autopsyCauses": "Autopsy Determined Causes of Death",
        "lbl.patDeathReport": "Reported Cause of Death",
        "lbl.patDeathReportMeddraCode": "MedDRA LLT Code (Reported Cause)",
        "lbl.patDeathReportMeddraPtCode": "MedDRA PT Code (Reported Cause)",
        "lbl.patDetAutopsy": "Autopsy Determined Cause of Death",
        "lbl.patDetAutopsyMeddraCode": "MedDRA LLT Code (Autopsy Cause)",
        "lbl.patDetAutopsyMeddraPtCode": "MedDRA PT Code (Autopsy Cause)",
        "lbl.sec_parent": "Parent Information",
        "lbl.sec_parentCore": "Parent Identification",
        "lbl.sec_parentPhysical": "Physical Characteristics",
        "lbl.sec_parentMedical": "Medical History",
        "lbl.sec_parentVaccine": "Vaccine Information",
        "lbl.sec_parentAdmin": "Follow-up & Consent",
        "lbl.sec_parentPastDrugs": "Parent Past Drug Therapies",
        "lbl.sec_parDrugProduct": "Product Details",
        "lbl.sec_parDrugIdentifiers": "Product Identifiers",
        "lbl.sec_parDrugTherapy": "Therapy & Indication",
        "lbl.sec_parDrugForm": "Form & Container",
        "lbl.sec_parDrugSubstances": "Active Substances",
        "lbl.sec_parentMedHistory": "Parent Medical History",
        "lbl.sec_parMedHistCore": "Episode Details",
        "lbl.sec_parMedHistDuration": "Duration",
        "lbl.sec_parMedHistAdmin": "Coding & Comments",
        "lbl.parentId": "Parent ID / Initials",
        "lbl.parentSex": "Parent Sex",
        "lbl.parentDob": "Parent Date of Birth",
        "lbl.parentAge": "Parent Age",
        "lbl.parentAgeUnit": "Parent Age Unit",
        "lbl.parentEthnicity": "Ethnic Origin",
        "lbl.parentLMP": "Last Menstrual Period",
        "lbl.parentWeight": "Parent Weight",
        "lbl.parentWeightUnit": "Weight Unit",
        "lbl.parentHeight": "Parent Height",
        "lbl.parentHeightUnit": "Height Unit",
        "lbl.parentMedHistory": "Medical History Text",
        "lbl.parentAgeAtVaccine": "Age at Vaccination",
        "lbl.parentAgeAtVaccineUnit": "Age at Vaccination Unit",
        "lbl.parentConsentToContact": "Consent to Contact",
        "lbl.parentFollowUp": "Can Follow Up",
        "lbl.parDrugName": "Product Name As Reported",
        "lbl.parProductDescription": "Product Description",
        "lbl.parInventedName": "Invented Name",
        "lbl.parScientificName": "Scientific Name",
        "lbl.parTrademarkName": "Trademark Name",
        "lbl.parMedProductId": "Medicinal Product ID",
        "lbl.parMpid": "MPID",
        "lbl.parMpidVersion": "MPID Version Date/Number",
        "lbl.parPhpid": "PhPID",
        "lbl.parPhpidVersion": "PhPID Version Date/Number",
        "lbl.parWhoddCode": "WHO DD Code",
        "lbl.parWhoddMpid": "WHO DD MPID",
        "lbl.parKddCode": "KDD Drug Code",
        "lbl.parDrugStartDate": "Start Date",
        "lbl.parDrugEndDate": "End Date",
        "lbl.parDrugIndication": "Indication Term",
        "lbl.parDrugIndicationLLT": "MedDRA LLT (Indication)",
        "lbl.parDrugIndicationPT": "MedDRA PT (Indication)",
        "lbl.parDrugReaction": "Reaction Term",
        "lbl.parDrugReactionLLT": "MedDRA LLT (Reaction)",
        "lbl.parDrugReactionPT": "MedDRA PT (Reaction)",
        "lbl.parFormName": "Form Name",
        "lbl.parStrengthName": "Strength Name",
        "lbl.parContainerName": "Container Name",
        "lbl.parDeviceName": "Device Name",
        "lbl.parIntendedUseName": "Intended Use",
        "lbl.substanceStrength": "Strength (Number)",
        "lbl.parMedEpisodeName": "Disease / Condition Term",
        "lbl.parMedEpisodeLLT": "MedDRA LLT Code",
        "lbl.parMedEpisodePT": "MedDRA PT Code",
        "lbl.parMedStartDate": "Start Date",
        "lbl.parMedEndDate": "End Date",
        "lbl.parMedContinue": "Continuing?",
        "lbl.parDiseaseType": "Disease Type",
        "lbl.parMedDuration": "Duration",
        "lbl.parMedDurationUnit": "Duration Unit",
        "lbl.parCodingType": "Coding Type",
        "lbl.parMedComment": "Comments",
        "lbl.sec_study": "Study Information",
        "lbl.sec_studyIdentification": "Study Identification",
        "lbl.sec_studyDesign": "Study Design",
        "lbl.sec_studySubject": "Subject / Enrollment",
        "lbl.sec_studySite": "Site & Investigator",
        "lbl.sec_studyRegulatoryIds": "Regulatory Identifiers",
        "lbl.sec_studyBlinding": "Blinding / Code",
        "lbl.sec_studyDates": "Study Dates",
        "lbl.sec_studyAdmin": "Safety Reporting & Admin",
        "lbl.sec_studyRegistrations": "Study Registrations",
        "lbl.sec_studyCrossRefInds": "Cross-Referenced INDs",
        "lbl.studySponsorStudyNo": "Sponsor Study No. / Protocol No.",
        "lbl.studyName": "Study Name",
        "lbl.studyTitle": "Study Title",
        "lbl.studyAcronym": "Study Acronym",
        "lbl.studyLibraryRecordId": "Study Library Record ID",
        "lbl.studyType": "Study Type",
        "lbl.studyDesign": "Study Design",
        "lbl.studyPhase": "Study Phase",
        "lbl.blindingTechnique": "Blinding Technique",
        "lbl.subjectId": "Subject ID",
        "lbl.randomizationNumber": "Randomization Number",
        "lbl.enrolDate": "Enrollment Date",
        "lbl.enrollStatus": "Enrollment Status",
        "lbl.globalStudyEnrollmentCount": "Global Study Enrollment Count",
        "lbl.withdrawnDate": "Withdrawn Date",
        "lbl.studyCompletionStatus": "Study Completion Status",
        "lbl.studyDiscontReason": "Discontinuation Reason",
        "lbl.siteNumber": "Center / Site Number",
        "lbl.investigatorNo": "Investigator Number",
        "lbl.investigationSite": "Investigation Site",
        "lbl.investigationSiteRecordId": "Site Record ID",
        "lbl.eudractNo": "EudraCT Number",
        "lbl.primaryInd": "Primary IND#",
        "lbl.reportedPrimaryInd": "Reported IND / Pre-ANDA#",
        "lbl.panda": "PANDA#",
        "lbl.projectNo": "Project No.",
        "lbl.studySerialNumber": "Study Serial Number",
        "lbl.codeBroken": "Case Code Broken",
        "lbl.dateCodeBroken": "Code Broken Date",
        "lbl.studyCodeBroken": "Study Code Broken",
        "lbl.unblindedInformation": "Unblinded Information",
        "lbl.euctRegulation": "EU CT Regulation 2019",
        "lbl.ctdctrDate": "CTD to CTR Transition Date",
        "lbl.studyStartDate": "Study Start Date",
        "lbl.studyEndDate": "Study End Date",
        "lbl.safetyReporting": "Safety Reporting Responsibility",
        "lbl.medicalDeviceSafetyReporting": "Medical Device Safety Reporting",
        "lbl.otherStudy": "Other Examination Details",
        "lbl.protocolDetails": "Protocol Details",
        "lbl.queryContact": "Query Contact",
        "lbl.studyFollowUp": "Follow-up Expected",
        "lbl.studyRegNumber": "Registration Number",
        "lbl.studyRegCountry": "Registration Country",
        "lbl.studyRegDate": "Registration Date",
        "lbl.noOfPatientsEnrolled": "No. of Patients Enrolled",
        "lbl.noOfMedicinalProduct": "No. of Medicinal Products",
        "lbl.crossRefInd": "Cross-Referenced IND Number",
        "lbl.parentInd": "Parent IND",
        "lbl.reportedSponsorStudyNo": "Reported Sponsor Study No.",
        "lbl.crossRefStudyName": "Study Name",
        "lbl.sec_eventReactions": "Event / Reactions",
        "lbl.sec_reactionTerm": "Reaction Term",
        "lbl.sec_reactionDates": "Dates & Duration",
        "lbl.sec_hospitalization": "Hospitalization Details",
        "lbl.sec_reactionOutcome": "Outcome & Classification",
        "lbl.sec_reactionCause": "Cause of Adverse Event",
        "lbl.sec_reactionTreatment": "Treatment",
        "lbl.sec_reactionLocation": "Location & Detection",
        "lbl.sec_reactionClassification": "Classification & Flags",
        "lbl.sec_vaccineReaction": "Vaccine Reaction Details",
        "lbl.sec_deviceReaction": "Device Incident Details",
        "lbl.sec_similarIncidents": "Similar Incident Analysis",
        "lbl.sec_similarIncidentData": "Similar Incident Data",
        "lbl.sec_reactionAdmin": "Administrative",
        "lbl.reactionTerm": "Reported Reaction Term",
        "lbl.reactMeddraLlt": "MedDRA LLT Code",
        "lbl.reactMeddraPt": "MedDRA PT Code",
        "lbl.termHighlighted": "Term Highlighted",
        "lbl.reactionNativeLang": "Reported Term (Native Language)",
        "lbl.nativeLanguage": "Native Language",
        "lbl.reactStartDate": "Onset Date",
        "lbl.reactEndDate": "Cessation Date",
        "lbl.reactDuration": "Duration",
        "lbl.reactDurationUnit": "Duration Unit",
        "lbl.reactFirstTime": "Start Latency",
        "lbl.reactFirstTimeUnit": "Start Latency Unit",
        "lbl.reactLastTime": "End Latency",
        "lbl.reactLastTimeUnit": "End Latency Unit",
        "lbl.reactOutcome": "Outcome",
        "lbl.severity": "Severity",
        "lbl.lifeThreatening": "Life Threatening?",
        "lbl.disability": "Disability/Permanent Damage?",
        "lbl.congenitalAnomalyEvent": "Congenital Anomaly/Birth Defect?",
        "lbl.otherMedImportant": "Other Medically Important Condition?",
        "lbl.otherMedImportantInfo": "Other Condition Details",
        "lbl.interventionRequired": "Required Intervention?",
        "lbl.hospitalisationDate": "Hospitalization From",
        "lbl.hospitalDischargeDate": "Hospitalization To",
        "lbl.eventType": "Event Type",
        "lbl.reactCondition": "Condition",
        "lbl.rankOrder": "Rank Order",
        "lbl.alwaysSeriousEvent": "Always Serious Event",
        "lbl.isIme": "IME",
        "lbl.isDme": "DME",
        "lbl.anticipatedEvents": "Anticipated Event",
        "lbl.exemptedEvents": "Exempted Event",
        "lbl.medicallyConfirmed": "Medically Confirmed",
        "lbl.causeOfAe": "Cause of Adverse Event",
        "lbl.drugInteraction": "Caused by Drug Interaction",
        "lbl.causedByLackOfEffect": "Caused by Lack of Effect",
        "lbl.otherCauseAeDetails": "Other Cause Details",
        "lbl.treatmentPerformed": "Treatment Performed",
        "lbl.treatmentDescription": "Treatment Description",
        "lbl.countryOfDetection": "Country of Detection",
        "lbl.countryDetectionManual": "Country of Detection (Manual)",
        "lbl.eventOccurLocation": "Location Where Event Occurred",
        "lbl.otherEventLocation": "Other Location Details",
        "lbl.reactionSite": "Reaction Site",
        "lbl.reactionSiteText": "Reaction Site (Text)",
        "lbl.deviceEventSeverity": "Device Event Severity",
        "lbl.eudamedRefNumber": "EUDAMED Reference Number",
        "lbl.incidentOccurredDuring": "Incident Occurred During",
        "lbl.location": "Location",
        "lbl.municipality": "Municipality",
        "lbl.hcfName": "Healthcare Facility Name",
        "lbl.hcfNumber": "Healthcare Facility Report No.",
        "lbl.eventsDuringIncident": "Events During Incident",
        "lbl.nearIncident": "Near Incident",
        "lbl.seriousPublicHealthThreat": "Serious Public Health Threat",
        "lbl.unanticipatedStateHealth": "Unanticipated Deterioration in Health",
        "lbl.totalIncidentsReported": "Total Incidents Reported to Date",
        "lbl.similarIncidentBasis": "Basis of Similar Incident Identification",
        "lbl.similarIncidentIdDesc": "Explanation of Basis",
        "lbl.deviceMarketCriteria": "Criteria for Devices in Market",
        "lbl.deviceCriteriaDesc": "Other Criteria Description",
        "lbl.imdrfSimilarCodes": "IMDRF Codes for Similar Incidents",
        "lbl.imdrfSimilarDesc": "IMDRF Similar Incident Description",
        "lbl.commentsSimilarIncident": "Comments on Similar Incidents",
        "lbl.investigationFinding": "Investigation Finding (Annex C)",
        "lbl.medicalDeviceProblem": "Medical Device Problem (Annex A)",
        "lbl.problemCode": "Most Relevant Problem Code",
        "lbl.problemTerm": "Most Relevant Problem Term",
        "lbl.rootCauseCode": "Root Cause Evaluation Code",
        "lbl.rootCauseTerm": "Root Cause Evaluation Term",
        "lbl.otherInHouseCode": "Other In-house Code",
        "lbl.otherInHouseCodeDesc": "Other In-house Code Description",
        "lbl.eventReceivedDate": "Event Received Date",
        "lbl.eventFollowUp": "Follow-up Expected",
        "lbl.aeAdditionalInfo": "Additional Information",
        "lbl.other": "Other",
        "lbl.failedReasonOtherInfo": "Failed Reason / Other Information",
        "lbl.vacHospRequired": "Hospitalization Required",
        "lbl.vacDaysHospitalized": "Days Hospitalized",
        "lbl.vacProlongHospital": "Prolongation of Hospitalization",
        "lbl.vacAeOutcomeNone": "AE Outcome â€” None of the Above",
        "lbl.vacHcpOffice": "Doctor/HCP Office",
        "lbl.vacEmergencyDept": "Emergency Room/Urgent Care",
        "lbl.vacHospitalName": "Hospital Name",
        "lbl.vacCity": "City",
        "lbl.vacState": "State",
        "lbl.simIncidentStartDate": "Period Start Date",
        "lbl.simIncidentEndDate": "Period End Date",
        "lbl.eeaNoDeviceMarket": "EEA+CH+TR Devices on Market",
        "lbl.eeaNoSimilarEvents": "EEA+CH+TR Similar Incidents",
        "lbl.coiNoDeviceMarket": "Incident Country Devices on Market",
        "lbl.coiNoSimilarEvents": "Incident Country Similar Incidents",
        "lbl.worldNoDeviceMarket": "World Devices on Market",
        "lbl.worldNoSimilarEvents": "World Similar Incidents",
        "lbl.sec_drugProducts": "Drug / Products",
        "lbl.sec_productIdentification": "Product Identification",
        "lbl.sec_productIdentifiers": "Product Identifiers",
        "lbl.sec_productClassification": "Classification",
        "lbl.sec_productDosage": "Dosage & Form",
        "lbl.sec_productDechallenge": "Action / Dechallenge / Rechallenge",
        "lbl.sec_productFlags": "Product Flags",
        "lbl.sec_activeSubstances": "Active Substances",
        "lbl.sec_drugIndications": "Drug Indications",
        "lbl.sec_drugTherapies": "Drug Therapies",
        "lbl.sec_therapyDates": "Therapy Dates",
        "lbl.sec_therapyDose": "Dose",
        "lbl.sec_therapyFrequency": "Frequency",
        "lbl.sec_therapyRoute": "Route & Form",
        "lbl.sec_therapyLot": "Lot & Site",
        "lbl.sec_therapyDoctor": "Prescribing Doctor",
        "lbl.sec_vaccFacility": "Vaccination Facility",
        "lbl.sec_drugApprovals": "Drug Approvals",
        "lbl.sec_productDevices": "Product Devices",
        "lbl.sec_deviceIdentification": "Device Identification",
        "lbl.sec_deviceDates": "Device Dates",
        "lbl.sec_deviceEvaluation": "Evaluation & Remedial Action",
        "lbl.sec_deviceNomenclature": "Nomenclature & Component",
        "lbl.sec_deviceReporting": "Reporting & Facility",
        "lbl.sec_deviceManufacturers": "Device Manufacturers",
        "lbl.sec_deviceProblemEval": "Device Problem Evaluation",
        "lbl.sec_deviceImdrfEval": "IMDRF Evaluation",
        "lbl.sec_drugRelatedness": "Drug-Reaction Relatedness",
        "lbl.sec_relatednessCore": "Relatedness Details",
        "lbl.sec_causality": "Causality Assessment",
        "lbl.sec_latency": "Latency",
        "lbl.sec_relatednessFlags": "Flags",
        "lbl.sec_reactionLabellings": "Reaction Labellings",
        "lbl.productNameAsReported": "Product Name As Reported",
        "lbl.productDescription": "Product Description",
        "lbl.preferredProductDesc": "Preferred Product Description",
        "lbl.trademarkName": "Trademark Name",
        "lbl.productSynonym": "Product Synonym",
        "lbl.activeIngredient": "Active Ingredient",
        "lbl.ndcNumber": "NDC Number",
        "lbl.ndcCodeVersion": "NDC Code Version",
        "lbl.internalDrugCode": "Internal Drug Code",
        "lbl.productRecordId": "Product Record ID",
        "lbl.drugCharacterization": "Product Characterization",
        "lbl.productFlag": "Product Flag",
        "lbl.productType": "Product Type",
        "lbl.studyProductType": "Study Product Type",
        "lbl.companyProduct": "Company Product",
        "lbl.manufacturerName": "Manufacturer Name",
        "lbl.strengthName": "Strength Name",
        "lbl.strengthUnit": "Strength Unit",
        "lbl.formName": "Form Name",
        "lbl.cumulativeDose": "Cumulative Dose",
        "lbl.cumulativeDoseUnit": "Cumulative Dose Unit",
        "lbl.expirationDate": "Expiration Date",
        "lbl.countryObtained": "Country Obtained",
        "lbl.actionDrug": "Action Taken With Drug",
        "lbl.dechallenge": "Dechallenge",
        "lbl.rechallenge": "Rechallenge",
        "lbl.blindedProduct": "Blinded Product",
        "lbl.priorUse": "Prior Use",
        "lbl.priorUseEquivalent": "Prior Use of Equivalent Drug",
        "lbl.lackOfEffect": "Lack of Effect",
        "lbl.bioFatherDrug": "Biological Father Exposed to Drug",
        "lbl.productAvailable": "Product Available for Evaluation",
        "lbl.seriousPublicHealth": "Serious Public Health Threat",
        "lbl.biosimilar": "Biosimilar",
        "lbl.generic": "Generic",
        "lbl.otc": "OTC",
        "lbl.productCompounded": "Compounded",
        "lbl.returnedToMfrDate": "Date Returned to Manufacturer",
        "lbl.drugAdditionalInfo": "Additional Drug Information",
        "lbl.productReferralComments": "Product Referral Comments",
        "lbl.productReferralRequired": "Product Referral Required",
        "lbl.activeSubstanceName": "Active Substance Name",
        "lbl.casNumber": "CAS Number",
        "lbl.clinicalDrugCode": "Clinical Drug Code",
        "lbl.primaryActive": "Primary Active",
        "lbl.indicationTerm": "Indication Term",
        "lbl.indicationLltCode": "MedDRA LLT Code",
        "lbl.indicationPtCode": "MedDRA PT Code",
        "lbl.therapyStartDate": "Start Date",
        "lbl.therapyStartDateText": "Start Date Text",
        "lbl.therapyEndDate": "End Date",
        "lbl.therapyEndDateText": "End Date Text",
        "lbl.therapyOngoing": "Therapy Ongoing",
        "lbl.doseReducedDate": "Dose Reduced Date",
        "lbl.adminDuration": "Duration of Administration",
        "lbl.adminDurationUnit": "Duration Unit",
        "lbl.unitDose": "Unit Dose",
        "lbl.unitDoseUnit": "Unit Dose Unit",
        "lbl.dailyDose": "Daily Dose",
        "lbl.dailyDoseUnit": "Daily Dose Unit",
        "lbl.totalDose": "Total Dose",
        "lbl.totalDoseUnit": "Total Dose Unit",
        "lbl.dosageText": "Dosage Text",
        "lbl.frequency": "Frequency",
        "lbl.frequencyTime": "Frequency Time",
        "lbl.frequencyTimeUnit": "Frequency Time Unit",
        "lbl.doseNumberInSeries": "Dose Number in Series",
        "lbl.routeOfAdmin": "Route of Administration",
        "lbl.routeTermId": "Route TermID",
        "lbl.routeTermIdVersion": "Route TermID Version",
        "lbl.parentRouteAdmin": "Parent Route of Administration",
        "lbl.dosageForm": "Pharmaceutical Dose Form",
        "lbl.pharmaTermId": "Pharmaceutical Dose Form TermID",
        "lbl.pharmaTermIdVersion": "Pharmaceutical Dose Form TermID Version",
        "lbl.formStrength": "Form Strength",
        "lbl.formStrengthUnit": "Form Strength Unit",
        "lbl.lotNumber": "Lot/Batch Number",
        "lbl.lotExpirationDate": "Lot Expiration Date",
        "lbl.therapySite": "Therapy Site",
        "lbl.vaccineAnatomicalSite": "Vaccine Anatomical Site",
        "lbl.sampleAvailable": "Sample Available",
        "lbl.docTitle": "Title",
        "lbl.docFirstName": "First Name",
        "lbl.docMiddleName": "Middle Name",
        "lbl.docLastName": "Last Name",
        "lbl.docTelephone": "Telephone",
        "lbl.docEmail": "Email",
        "lbl.vaccFacilityName": "Facility Name",
        "lbl.vaccFacilityType": "Facility Type",
        "lbl.vaccAddress1": "Address Line 1",
        "lbl.vaccAddress2": "Address Line 2",
        "lbl.vaccCity": "City",
        "lbl.vaccState": "State",
        "lbl.vaccPostalCode": "Postal Code",
        "lbl.vaccCountry": "Country",
        "lbl.vaccTelephone": "Telephone",
        "lbl.vaccFax": "Fax",
        "lbl.vaccMilitaryFlag": "Military Flag",
        "lbl.authorizationNumber": "Authorization Number",
        "lbl.authorizationType": "Authorization Type",
        "lbl.authorizationCountry": "Authorization Country",
        "lbl.tradeBrandName": "Trade/Brand Name",
        "lbl.mahAsReported": "MAH As Reported",
        "lbl.mahAsCoded": "MAH As Coded",
        "lbl.substanceNameApproval": "Substance Name",
        "lbl.productFlagApproval": "Product Flag",
        "lbl.whoddMpid": "WHO DD MPID",
        "lbl.deviceClass": "Device Class",
        "lbl.deviceDemographic": "Demographic",
        "lbl.deviceMarketedBefore": "Marketed Before MDD/AIMDD/IVDD",
        "lbl.notifiedBodyIdentNo": "Notified Body ID Number",
        "lbl.notifiedCertificateNo": "Notified Body Certificate No.",
        "lbl.hcIdNumber": "Health Canada ID Number",
        "lbl.devMarketMonths": "Market Months",
        "lbl.devMarketYears": "Market Years",
        "lbl.deviceBrandName": "Brand Name",
        "lbl.commonDeviceName": "Common Device Name",
        "lbl.generalName": "General Name",
        "lbl.generalNameCode": "General Name Code",
        "lbl.deviceProductDesc": "Product Description",
        "lbl.deviceProductCode": "Product Code",
        "lbl.udiNumber": "UDI / EUDAMED ID",
        "lbl.catalogueNumber": "Catalogue Number",
        "lbl.modelNumber": "Model Number",
        "lbl.serialNumber": "Serial Number",
        "lbl.deviceLotNumber": "Lot Number",
        "lbl.ceNumber": "CE Number",
        "lbl.deviceApprovalNo": "Approval Number",
        "lbl.fdaRegNumber": "FDA Registration Number",
        "lbl.artgNumber": "ARTG Number",
        "lbl.deviceManufactureDate": "Manufacture Date",
        "lbl.deviceExpirationDate": "Expiration Date",
        "lbl.implantedDate": "Date Implanted",
        "lbl.explantedDate": "Date Explanted",
        "lbl.durationImplantation": "Duration of Implantation",
        "lbl.durationImplantationUnit": "Duration Unit",
        "lbl.deviceAge": "Device Age",
        "lbl.deviceAgeUnit": "Device Age Unit",
        "lbl.productReturnDate": "Product Return Date",
        "lbl.expectedNextReportDate": "Expected Next Report Date",
        "lbl.evaluatedByManufacturer": "Evaluated by Manufacturer",
        "lbl.reasonEvalNotProvided": "Reason Not Evaluated",
        "lbl.currentDevLocation": "Current Device Location",
        "lbl.remedialAction": "Remedial Action",
        "lbl.remedialActionOther": "Other Remedial Action",
        "lbl.correctionRemovalNo": "Correction/Removal Reporting No.",
        "lbl.deviceUsage": "Device Usage",
        "lbl.deviceOperator": "Operator of Device",
        "lbl.deviceReprocessed": "Device Reprocessed and Reused",
        "lbl.labelledSingleUse": "Labeled Single Use",
        "lbl.malfunction": "Malfunction",
        "lbl.partOfCombination": "Part of Combination Product",
        "lbl.primaryCausalDevice": "Primary Causal Device",
        "lbl.productCharacterisation": "Product Characterization",
        "lbl.summaryReport": "Summary Report",
        "lbl.riskAssessmentReviewed": "Risk Assessment Reviewed",
        "lbl.riskAssessmentAdequate": "Risk Assessment Still Adequate",
        "lbl.rootCauseConfirmed": "Root Cause Confirmed",
        "lbl.nomenclatureCode": "Nomenclature Code",
        "lbl.nomenclatureSystem": "Nomenclature System",
        "lbl.nomenclatureText": "Nomenclature Text",
        "lbl.deviceComponentName": "Component Name",
        "lbl.deviceComponentTermId": "Component TermID",
        "lbl.deviceComponentTermIdVer": "Component TermID Version",
        "lbl.competentAuthority": "Competent Authority",
        "lbl.ncaLocalRefNum": "NCA Local FSCA Reference No.",
        "lbl.ncaFscaRefNum": "NCA Local Reference No.",
        "lbl.mfrNumber": "MFR Number",
        "lbl.reportSentToFda": "Report Sent to FDA",
        "lbl.reportSentFdaDate": "FDA Report Date",
        "lbl.reportSentToManuf": "Report Sent to Manufacturer",
        "lbl.reportSentManufDate": "Manufacturer Report Date",
        "lbl.responseToAuthorityReqd": "Response to Authority Required",
        "lbl.userFacility": "User Facility",
        "lbl.ufImporterReportNo": "User Facility/Importer Report No.",
        "lbl.importer": "Importer",
        "lbl.reprocessorUnit": "Reprocessor Unit",
        "lbl.specifyCompanyUnit": "Specify Company Unit",
        "lbl.deviceType": "Device Type",
        "lbl.noOfEventsSummarized": "No. of Events Summarized",
        "lbl.followUpAddInfo": "Follow-up Additional Info",
        "lbl.followUpCorrection": "Follow-up Correction",
        "lbl.followUpDeviceEval": "Follow-up Device Evaluation",
        "lbl.manufacturerAsReported": "Manufacturer As Reported",
        "lbl.manufacturerAsCoded": "Manufacturer As Coded",
        "lbl.manufacturerAddress": "Manufacturer Address",
        "lbl.manufacturerCity": "City",
        "lbl.manufacturerState": "State",
        "lbl.manufacturerCountry": "Country",
        "lbl.evaluationType": "Evaluation Type",
        "lbl.evaluationValue": "Evaluation Value",
        "lbl.imdrfAnnexA": "Medical Device Problem (Annex A)",
        "lbl.imdrfAnnexB": "Type of Investigation (Annex B)",
        "lbl.imdrfAnnexC": "Investigation Findings (Annex C)",
        "lbl.imdrfAnnexD": "Investigation Conclusion (Annex D)",
        "lbl.imdrfAnnexG": "Medical Device Component (Annex G)",
        "lbl.reactionName": "Reaction Term",
        "lbl.reactionRecordId": "Reaction Record ID",
        "lbl.drugReactAssessTerm": "Reported Term",
        "lbl.companyCausality": "Company Causality",
        "lbl.reporterCausality": "Reporter Causality",
        "lbl.companyCausalityProc": "Company Causality Procedure",
        "lbl.reporterCausalityProc": "Reporter Causality Procedure",
        "lbl.procedureComments": "Procedure Comments",
        "lbl.outcomeAfterChange": "Outcome After Change",
        "lbl.drugStartLatency": "Start Latency",
        "lbl.drugStartLatencyUnit": "Start Latency Unit",
        "lbl.drugEndLatency": "End Latency",
        "lbl.drugEndLatencyUnit": "End Latency Unit",
        "lbl.isAesi": "AESI",
        "lbl.assessRelationship": "Assess Relationship",
        "lbl.assessRelationshipManual": "Assess Relationship (Manual)",
        "lbl.companyCausalityManual": "Company Causality (Manual)",
        "lbl.relatednessFollowUp": "Follow-up",
        "lbl.temporalAssociation": "Temporal Association",
        "lbl.endLatencyManual": "End Latency (Manual)",
        "lbl.startLatencyManual": "Start Latency (Manual)",
        "lbl.labellingCountry": "Country",
        "lbl.labelling": "Labelling",
        "lbl.labellingVersion": "Labelling Version",
        "lbl.reasonForListedness": "Reason for Listedness",
        "lbl.labellingManual": "Labelling (Manual)",
        "lbl.sec_labTests": "Lab Tests",
        "lbl.sec_labTestCore": "Test Identification",
        "lbl.sec_labTestResult": "Test Result",
        "lbl.sec_labTestAdmin": "Coding & Admin",
        "lbl.testName": "Test Name",
        "lbl.testMeddraLlt": "MedDRA LLT Code",
        "lbl.testMeddraPt": "MedDRA PT Code",
        "lbl.testDate": "Test Date",
        "lbl.testResultValue": "Result Value",
        "lbl.testUnit": "Result Unit",
        "lbl.testResultCode": "Result Code",
        "lbl.testResultText": "Result (Free Text)",
        "lbl.lowTestRange": "Normal Range: Low",
        "lbl.highTestRange": "Normal Range: High",
        "lbl.moreInformation": "More Information Available",
        "lbl.labFollowUp": "Follow-up Expected",
        "lbl.labComments": "Comments",
        "lbl.sec_literature": "Literature",
        "lbl.sec_literatureCore": "Reference Details",
        "lbl.sec_publicationDetails": "Publication Details",
        "lbl.sec_literatureAdmin": "Administrative",
        "lbl.articleTitle": "Article Title",
        "lbl.journalTitle": "Journal Title",
        "lbl.doi": "DOI",
        "lbl.literatureDocName": "Document Name",
        "lbl.pubDate": "Publication Date",
        "lbl.edition": "Edition",
        "lbl.issue": "Issue",
        "lbl.pageFrom": "Page From",
        "lbl.pageTo": "Page To",
        "lbl.additionalLitInfo": "Additional Information",
        "lbl.retainLiteratureReference": "Retain Reference",
        "lbl.litFollowUp": "Follow-up Expected",
        "lbl.widget_totalCases": "Total Cases",
        "lbl.widget_seriousCases": "Serious",
        "lbl.widget_susarCases": "SUSAR",
        "lbl.widget_openCases": "Open",
        "lbl.widget_overdueCases": "Overdue",
        "lbl.sec_r3_caseHeader": "Case Header (R3 Extensions)",
        "lbl.sec_r3_regulatoryClock": "Regulatory Clock",
        "lbl.sec_r3_otherSafetyRef": "Other Safety References",
        "lbl.sec_r3_reporter": "Reporter (R3 Extensions)",
        "lbl.sec_r3_reporterRegulatory": "Regulatory Purpose",
        "lbl.sec_r3_patient": "Patient (R3 Extensions)",
        "lbl.sec_r3_patientIdentity": "Gender Identity & Ethnicity",
        "lbl.sec_r3_pastDrugSubstances": "Past Drug Substances (R3)",
        "lbl.sec_r3_reactionExtended": "Reaction (R3 Extensions)",
        "lbl.sec_r3_reactionNativeLang": "Native Language Term",
        "lbl.sec_r3_latency": "Latency",
        "lbl.sec_r3_drugProductIds": "Drug Product Identifiers (R3)",
        "lbl.sec_r3_mpidPhpid": "MPID / PhPID",
        "lbl.sec_r3_activeSubstances": "Active Substances (R3)",
        "lbl.sec_r3_therapyTermIds": "Therapy Term IDs (R3)",
        "lbl.sec_r3_routeTermIds": "Route & Dose Form Term IDs",
        "lbl.sec_r3_relatednessLabellings": "Relatedness & Labellings (R3)",
        "lbl.e2bRegulatoryPurpose": "Primary Source for Regulatory Purposes",
        "lbl.reporterCountryPractice": "Country of Practice",
        "lbl.pharmaTermId": "Pharmaceutical Dose Form TermID",
        "lbl.pharmaTermIdVersion": "Pharmaceutical Dose Form TermID Version",
        "lbl.routeTermId": "Route of Administration TermID",
        "lbl.routeTermIdVersion": "Route of Administration TermID Version",
        "lbl.parentRouteAdmin": "Parent Route of Administration",
        "lbl.clinicalDrugCode": "Clinical Drug Code (Japan)",
        "lbl.sec_r2_caseHeader": "Case Header (R2)",
        "lbl.sec_r2_reportIdentification": "Report Identification",
        "lbl.sec_r2_reportType": "Report Type & Dates",
        "lbl.sec_r2_seriousness": "Seriousness Criteria",
        "lbl.sec_r2_reporter": "Reporter (R2)",
        "lbl.sec_r2_reporterQualification": "Qualification & FDA Notification",
        "lbl.sec_r2_patient": "Patient (R2)",
        "lbl.sec_r2_patientCore": "Patient Core",
        "lbl.sec_r2_patientPhysical": "Physical Characteristics",
        "lbl.sec_r2_patientMedical": "Medical Background",
        "lbl.sec_r2_patientDeath": "Death / Autopsy",
        "lbl.sec_r2_patientRecords": "Record Numbers",
        "lbl.sec_r2_medicalHistory": "Medical History (R2)",
        "lbl.sec_r2_pastDrugTherapies": "Past Drug Therapies (R2)",
        "lbl.sec_r2_deathCauses": "Death Causes (R2)",
        "lbl.sec_r2_parent": "Parent Information (R2)",
        "lbl.sec_r2_eventReactions": "Event / Reactions (R2)",
        "lbl.sec_r2_reactionCore": "Reaction Details",
        "lbl.sec_r2_seriousnessCriteria": "Seriousness Criteria",
        "lbl.sec_r2_drugProducts": "Drug Products (R2)",
        "lbl.sec_r2_drugCore": "Drug Details",
        "lbl.sec_r2_drugIdentification": "Product Identification",
        "lbl.sec_r2_drugDose": "Dose",
        "lbl.sec_r2_drugAction": "Action / Dechallenge / Rechallenge",
        "lbl.sec_r2_drugTherapy": "Therapy Details",
        "lbl.sec_r2_drugRelatedness": "Drug-Reaction Relatedness",
        "lbl.sec_r2_study": "Study Information (R2)",
        "lbl.sec_r2_studyCore": "Study Details",
        "lbl.sec_r2_studySubject": "Subject & Site",
        "lbl.sec_r2_studyBlinding": "Blinding / Code"
    },
    "fr": {
        "lbl.sec_caseHeader": "En-tête du cas",
        "lbl.sec_caseIdentification": "Identification du cas",
        "lbl.sec_reportClassification": "Classification du rapport",
        "lbl.sec_caseDates": "Dates du cas",
        "lbl.sec_seriousness": "CritÃ¨res de gravitÃ©",
        "lbl.sec_caseFlags": "Indicateurs du cas",
        "lbl.sec_assignmentOrg": "Attribution et organisation",
        "lbl.sec_followUp": "Suivi",
        "lbl.sec_nonCase": "Non-cas / Suppression",
        "lbl.sec_codingStatus": "Statut de codage",
        "lbl.sec_adminAudit": "Administration et audit",
        "lbl.safetyReportId": "ID rapport de sécurité",
        "lbl.safetyReportVersion": "Version",
        "lbl.authorityNumb": "Numéro autorité / société",
        "lbl.aerNo": "Numéro AER",
        "lbl.aerVersionNo": "Version AER",
        "lbl.receiptNo": "Numéro de réception",
        "lbl.reportType": "Type de rapport",
        "lbl.initialOrFollowup": "Initial / Suivi",
        "lbl.caseNullification": "Nullification / Amendement",
        "lbl.nullificationReason": "Raison de nullification / amendement",
        "lbl.reportClassification": "Catégorie de rapport",
        "lbl.reportClassificationCategory": "Classification du rapport",
        "lbl.safetyClassification": "Classification sécurité / efficacité",
        "lbl.caseType": "Type de cas",
        "lbl.icsrFlag": "Indicateur ICSR",
        "lbl.casePriority": "Type de rapport critères locaux",
        "lbl.priority": "Priorité du rapport",
        "lbl.receiveDate": "Date de réception initiale",
        "lbl.receiptDate": "Date de réception la plus récente",
        "lbl.regulatoryStartDate": "Date de début de l''horloge réglementaire",
        "lbl.caseDueDate": "Date d''échéance du cas",
        "lbl.submissionDueDate": "Date d''échéance de soumission",
        "lbl.seriousness": "Grave ?",
        "lbl.death": "DÃ©cÃ¨s ?",
        "lbl.lifethreatening": "Mise en jeu du pronostic vital ?",
        "lbl.hospitalization": "Hospitalisation causÃ©e/prolongÃ©e ?",
        "lbl.disabling": "Invalidité / dommage permanent ?",
        "lbl.congenitalAnomaly": "Anomalie congénitale",
        "lbl.otherSerious": "Autre condition médicalement importante ?",
        "lbl.requiredIntervention": "Intervention requise ?",
        "lbl.fulfillExpediteCriteria": "Accéléré localement",
        "lbl.medicallyConfirm": "Confirmé médicalement",
        "lbl.additionalDoc": "Documents supplémentaires disponibles",
        "lbl.susar": "SUSAR",
        "lbl.isCaseAesi": "AESI ?",
        "lbl.assignedTo": "Assigné à",
        "lbl.caseOwner": "Propriétaire du cas",
        "lbl.assessor": "Évaluateur",
        "lbl.safetyManager": "Responsable sécurité",
        "lbl.followUp": "Suivi",
        "lbl.nonCaseReason": "Raison d''évaluation non-cas",
        "lbl.removeReasonCode": "Code de raison de suppression",
        "lbl.sec_caseDocuments": "Documents du cas",
        "lbl.fileName": "Nom du fichier",
        "lbl.isDocumentIncluded": "Document inclus ?",
        "lbl.fileS3Path": "Chemin du fichier",
        "lbl.sec_reporterInformations": "Informations déclarant",
        "lbl.sec_reporterCore": "Détails réglementaires",
        "lbl.sec_reporterIdentity": "Identité du déclarant",
        "lbl.sec_reporterProfessional": "Détails professionnels",
        "lbl.sec_reporterContact": "Coordonnées",
        "lbl.primaryReporter": "Déclarant principal",
        "lbl.e2bRegulatoryPurpose": "Source primaire à des fins réglementaires",
        "lbl.doNotReportName": "Protéger la confidentialité",
        "lbl.reporterQualification": "Qualification",
        "lbl.reporterSentToFDA": "Déclarant a informé l''autorité directement",
        "lbl.reporterTitle": "Titre",
        "lbl.reporterGivenName": "Prénom",
        "lbl.reporterMiddleName": "Deuxième prénom",
        "lbl.reporterFamilyName": "Nom de famille",
        "lbl.reporterOrContact": "Type de personne",
        "lbl.consentToContacts": "Consentement au contact",
        "lbl.canFollowUp": "Peut faire un suivi",
        "lbl.isHealthProf": "Professionnel de santé",
        "lbl.occupation": "Profession",
        "lbl.speciality": "Spécialisation",
        "lbl.reporterOrganization": "Hôpital / Organisation",
        "lbl.reporterDepartment": "Département",
        "lbl.reporterCity": "Ville",
        "lbl.reporterCountry": "Pays",
        "lbl.reporterPhone": "Téléphone",
        "lbl.reporterEmail": "Email",
        "lbl.reporterCountryPractice": "Pays d''exercice",
        "lbl.sec_sourceInformations": "Informations source",
        "lbl.sec_sourceCore": "Détails source",
        "lbl.sec_sourceReference": "Détails référence",
        "lbl.primarySource": "Source primaire",
        "lbl.source": "Source",
        "lbl.dateReceived": "Date de réception",
        "lbl.originatingAccount": "Organisation expéditrice",
        "lbl.senderOrganisationType": "Type d''organisation expéditrice",
        "lbl.sourceFollowUp": "Suivi",
        "lbl.identificationNo": "Numéro de référence",
        "lbl.referenceType": "Type de référence",
        "lbl.sourceAerNumber": "Version AER source",
        "lbl.sourceDescription": "Description",
        "lbl.sec_patient": "Patient",
        "lbl.sec_patientCore": "Identification du patient",
        "lbl.sec_patientDemographics": "Données démographiques",
        "lbl.sec_patientPhysical": "Caractéristiques physiques",
        "lbl.sec_patientMedical": "Antécédents médicaux",
        "lbl.sec_patientDeath": "Décès / Autopsie",
        "lbl.sec_patientContact": "Coordonnées",
        "lbl.sec_patientRecords": "Numéros de dossier",
        "lbl.sec_patientVaccine": "Informations vaccin",
        "lbl.sec_biologicalFather": "Père biologique",
        "lbl.sec_patientAdmin": "Administratif",
        "lbl.patientInitial": "ID / Initiales du patient",
        "lbl.patDoNotReportName": "Protéger la confidentialité",
        "lbl.patientIdentify": "Patient identifiable",
        "lbl.patSex": "Sexe",
        "lbl.patGender": "Identité de genre",
        "lbl.patDob": "Date de naissance",
        "lbl.patOnsetAge": "Âge au moment de l''événement",
        "lbl.patOnsetAgeUnit": "Unité d''âge",
        "lbl.patAgeGroup": "Groupe d''âge",
        "lbl.patWeight": "Poids",
        "lbl.patWeightUnit": "Unité de poids",
        "lbl.patHeight": "Taille",
        "lbl.patHeightUnit": "Unité de taille",
        "lbl.patLMP": "Date des dernières règles",
        "lbl.patientPregnant": "Enceinte ?",
        "lbl.gestationalAge": "Âge gestationnel",
        "lbl.patMedicalHistoryText": "Antécédents médicaux et conditions concomitantes",
        "lbl.resultsTestsProcedures": "Résultats des tests et procédures",
        "lbl.patDeathDate": "Date de décès",
        "lbl.patAutopsyYesNo": "Autopsie effectuée ?",
        "lbl.patCity": "Ville",
        "lbl.patCountry": "Pays",
        "lbl.partnerName": "Nom du père biologique",
        "lbl.biologicalFatherAge": "Âge du père biologique",
        "lbl.sec_patientSummary": "Résumé du cas",
        "lbl.sec_caseNarrative": "Récit du cas",
        "lbl.sec_medicalAssessment": "Évaluation médicale",
        "lbl.sec_clinicalNarrative": "Récit clinique",
        "lbl.sec_correctiveActions": "Actions correctives / préventives",
        "lbl.companyNarrative": "Description de l''événement (récit société)",
        "lbl.reporterComment": "Description de la réaction selon le déclarant",
        "lbl.senderComment": "Remarques de la société (commentaires expéditeur)",
        "lbl.summaryDescription": "Description résumée",
        "lbl.evaluationComments": "Commentaires de pharmacovigilance",
        "lbl.evaluationSummary": "Résumé de l''évaluation",
        "lbl.additionalInformation": "Informations supplémentaires",
        "lbl.additionalComments": "Commentaires supplémentaires",
        "lbl.whatFurtherInvestigations": "Investigations supplémentaires prévues",
        "lbl.patientDuringEvent": "Description du patient pendant l''événement",
        "lbl.treatmentFollowingEvent": "Traitement suite à l''événement",
        "lbl.manufacturerNarrative": "Commentaires finaux du fabricant",
        "lbl.correctiveActions": "Actions correctives",
        "lbl.correctedData": "Données corrigées",
        "lbl.productComplaintDetails": "Détails de la réclamation produit",
        "lbl.initialManufacturerAnalysis": "Analyse initiale du fabricant",
        "lbl.summaryFollowUp": "Suivi",
        "lbl.sec_medicalHistory": "Antécédents médicaux",
        "lbl.sec_medHistCore": "Détails de l''épisode",
        "lbl.sec_medHistClassification": "Classification",
        "lbl.sec_medHistDuration": "Durée",
        "lbl.sec_medHistAdmin": "Codage et administration",
        "lbl.medicalEpisodeName": "Terme maladie / condition",
        "lbl.medicalEpisodeLLT": "Code MedDRA LLT",
        "lbl.medicalHistoryPT": "Code MedDRA PT",
        "lbl.medicalStartDate": "Date de début",
        "lbl.medicalEndDate": "Date de fin",
        "lbl.medicalContinue": "En cours ?",
        "lbl.diseaseType": "Type de maladie",
        "lbl.conditionTreated": "Condition traitée",
        "lbl.familyHistory": "Antécédents familiaux",
        "lbl.illnessAtVaccination": "Maladie au moment de la vaccination",
        "lbl.medHistDuration": "Durée",
        "lbl.medHistDurationUnit": "Unité de durée",
        "lbl.codingType": "Type de codage",
        "lbl.concomitantTherapies": "Thérapies concomitantes",
        "lbl.medicalComment": "Commentaires",
        "lbl.sec_pastDrugTherapies": "Thérapies médicamenteuses antérieures",
        "lbl.sec_pastDrugProduct": "Identification du produit",
        "lbl.sec_pastDrugCoding": "Codage MedDRA et IDs produit",
        "lbl.sec_pastDrugDates": "Dates et vaccination",
        "lbl.sec_pastDrugDetails": "Détails supplémentaires",
        "lbl.sec_pastDrugSubstances": "Substances",
        "lbl.pastDrugName": "Nom du produit tel que rapporté",
        "lbl.pastDrugIndication": "Terme d''indication",
        "lbl.pastDrugReaction": "Terme de réaction",
        "lbl.pastDrugStartDate": "Date de début",
        "lbl.pastDrugEndDate": "Date de fin",
        "lbl.substanceName": "Nom de la substance",
        "lbl.substanceStrengthNumber": "Concentration (nombre)",
        "lbl.substanceStrengthUnit": "UnitÃ© de dosage",
        "lbl.sec_pregnancy": "Grossesse",
        "lbl.sec_pregnancyDetails": "Détails de la grossesse",
        "lbl.sec_pregnancyPhysical": "Physique / Accouchement",
        "lbl.sec_pregnancyAdmin": "Suivi et commentaires",
        "lbl.sec_pregnancyOutcomes": "Issues de grossesse",
        "lbl.sec_outcomeCore": "Détails de l''issue",
        "lbl.sec_prevPregnancyOutcomes": "Issues de grossesses précédentes",
        "lbl.sec_neonates": "Nouveau-nés",
        "lbl.sec_neonateCore": "Détails du nouveau-né",
        "lbl.sec_neonateAnomaly": "Anomalie congénitale",
        "lbl.sec_neonateApgar": "Scores APGAR",
        "lbl.sec_neonateNicu": "Admission en USIN",
        "lbl.sec_neonateOther": "Autres détails",
        "lbl.sec_neonateChildren": "Suivi de l''enfant",
        "lbl.pregnancyType": "Type de grossesse",
        "lbl.trimesterOfExposure": "Trimestre d''exposition",
        "lbl.pregnancyConfirmDate": "Date de confirmation de grossesse",
        "lbl.pregnancyConfirmMode": "Mode de confirmation",
        "lbl.expectedDueDate": "Date prévue d''accouchement",
        "lbl.gravidity": "Gravidité",
        "lbl.para": "Parité",
        "lbl.plannedPregnancy": "Grossesse planifiée",
        "lbl.contraceptivesUsed": "Contraceptifs utilisés",
        "lbl.contraceptiveFailure": "Échec contraceptif",
        "lbl.typesOfContraceptives": "Types de contraceptifs",
        "lbl.prePregnancyWeight": "Poids avant grossesse",
        "lbl.prePregnancyWeightUnit": "Unité de poids",
        "lbl.deliveryMethod": "Mode d''accouchement",
        "lbl.familyHistoryBirthDefects": "Antécédents familiaux de malformations",
        "lbl.pregnancyFollowUp": "Suivi attendu",
        "lbl.pregnancyComments": "Commentaires",
        "lbl.pregnancyOutcome": "Issue de grossesse",
        "lbl.pregnancyOutcomeDate": "Date de l''issue",
        "lbl.pregnancyEndDate": "Date de fin de grossesse",
        "lbl.noOfFoetus": "Nombre de fœtus",
        "lbl.liveBirthComplications": "Complications à la naissance",
        "lbl.pastPregnancyOutcome": "Issue de grossesse passée",
        "lbl.pastPregnancyOutcomeDetails": "Détails de l''issue passée",
        "lbl.noOfChildren": "Nombre d''enfants",
        "lbl.numberOfAbortions": "Nombre d''avortements",
        "lbl.birthOutcome": "Issue à la naissance",
        "lbl.childSex": "Sexe de l''enfant",
        "lbl.whichPregnancy": "Quelle grossesse",
        "lbl.currentPregnancy": "Grossesse actuelle",
        "lbl.gestationalAgeBirth": "Âge gestationnel à la naissance",
        "lbl.gestationalAgeBirthUnit": "Unité d''âge gestationnel",
        "lbl.congenitalAnomalyType": "Type d''anomalie",
        "lbl.apgarScore1": "Score APGAR (1 min)",
        "lbl.apgarScore5": "Score APGAR (5 min)",
        "lbl.apgarScore10": "Score APGAR (10 min)",
        "lbl.nicuAdmission": "Admission en USIN",
        "lbl.admissionDuration": "Durée d''admission",
        "lbl.admissionDurationUnit": "Unité de durée",
        "lbl.resuscitated": "Réanimé",
        "lbl.otherNeonateDetails": "Autres détails du nouveau-né",
        "lbl.otherOutcomeDetails": "Autres détails de l''issue",
        "lbl.childAge": "Âge de l''enfant",
        "lbl.childAgeUnit": "Unité d''âge",
        "lbl.headCircumBirth": "Périmètre crânien à la naissance",
        "lbl.headCircumBirthUnit": "Unité de périmètre crânien",
        "lbl.neonBirthLength": "Longueur à la naissance",
        "lbl.neonBirthLengthUnit": "Unité de longueur",
        "lbl.neonWeight": "Poids à la naissance",
        "lbl.neonWeightUnit": "Unité de poids",
        "lbl.sec_deathCauses": "Causes de dÃ©cÃ¨s",
        "lbl.sec_reportedDeathCauses": "Causes de dÃ©cÃ¨s rapportÃ©es",
        "lbl.sec_autopsyCauses": "Causes de dÃ©cÃ¨s dÃ©terminÃ©es par autopsie",
        "lbl.patDeathReport": "Cause de dÃ©cÃ¨s rapportÃ©e",
        "lbl.patDeathReportMeddraCode": "Code MedDRA LLT (cause rapportÃ©e)",
        "lbl.patDeathReportMeddraPtCode": "Code MedDRA PT (cause rapportÃ©e)",
        "lbl.patDetAutopsy": "Cause de dÃ©cÃ¨s dÃ©terminÃ©e par autopsie",
        "lbl.patDetAutopsyMeddraCode": "Code MedDRA LLT (cause autopsie)",
        "lbl.patDetAutopsyMeddraPtCode": "Code MedDRA PT (cause autopsie)",
        "lbl.sec_parent": "Informations sur le parent",
        "lbl.sec_parentCore": "Identification du parent",
        "lbl.sec_parentPhysical": "CaractÃ©ristiques physiques",
        "lbl.sec_parentMedical": "AntÃ©cÃ©dents mÃ©dicaux",
        "lbl.sec_parentVaccine": "Informations vaccin",
        "lbl.sec_parentAdmin": "Suivi et consentement",
        "lbl.sec_parentPastDrugs": "Traitements mÃ©dicamenteux passÃ©s du parent",
        "lbl.sec_parDrugProduct": "DÃ©tails du produit",
        "lbl.sec_parDrugIdentifiers": "Identifiants du produit",
        "lbl.sec_parDrugTherapy": "ThÃ©rapie et indication",
        "lbl.sec_parDrugForm": "Forme et conditionnement",
        "lbl.sec_parDrugSubstances": "Substances actives",
        "lbl.sec_parentMedHistory": "AntÃ©cÃ©dents mÃ©dicaux du parent",
        "lbl.sec_parMedHistCore": "DÃ©tails de l''Ã©pisode",
        "lbl.sec_parMedHistDuration": "DurÃ©e",
        "lbl.sec_parMedHistAdmin": "Codage et commentaires",
        "lbl.parentId": "ID / Initiales du parent",
        "lbl.parentSex": "Sexe du parent",
        "lbl.parentDob": "Date de naissance du parent",
        "lbl.parentAge": "Ã‚ge du parent",
        "lbl.parentAgeUnit": "UnitÃ© d''Ã¢ge",
        "lbl.parentEthnicity": "Origine ethnique",
        "lbl.parentLMP": "DerniÃ¨res rÃ¨gles",
        "lbl.parentWeight": "Poids du parent",
        "lbl.parentWeightUnit": "UnitÃ© de poids",
        "lbl.parentHeight": "Taille du parent",
        "lbl.parentHeightUnit": "UnitÃ© de taille",
        "lbl.parentMedHistory": "AntÃ©cÃ©dents mÃ©dicaux",
        "lbl.parentAgeAtVaccine": "Ã‚ge Ã  la vaccination",
        "lbl.parentAgeAtVaccineUnit": "UnitÃ© d''Ã¢ge Ã  la vaccination",
        "lbl.parentConsentToContact": "Consentement au contact",
        "lbl.parentFollowUp": "Suivi possible",
        "lbl.parDrugName": "Nom du produit tel que rapportÃ©",
        "lbl.parProductDescription": "Description du produit",
        "lbl.parInventedName": "Nom inventÃ©",
        "lbl.parScientificName": "Nom scientifique",
        "lbl.parTrademarkName": "Nom de marque",
        "lbl.parDrugStartDate": "Date de dÃ©but",
        "lbl.parDrugEndDate": "Date de fin",
        "lbl.parDrugIndication": "Terme d''indication",
        "lbl.parDrugIndicationLLT": "MedDRA LLT (indication)",
        "lbl.parDrugIndicationPT": "MedDRA PT (indication)",
        "lbl.parDrugReaction": "Terme de rÃ©action",
        "lbl.parDrugReactionLLT": "MedDRA LLT (rÃ©action)",
        "lbl.parDrugReactionPT": "MedDRA PT (rÃ©action)",
        "lbl.parFormName": "Forme pharmaceutique",
        "lbl.parStrengthName": "Dosage",
        "lbl.parContainerName": "Conditionnement",
        "lbl.parDeviceName": "Dispositif",
        "lbl.parIntendedUseName": "Usage prÃ©vu",
        "lbl.substanceTermId": "TermID de la substance",
        "lbl.substanceTermIdVersion": "Version du TermID",
        "lbl.substanceStrength": "Dosage (nombre)",
        "lbl.parMedEpisodeName": "Terme maladie / condition",
        "lbl.parMedEpisodeLLT": "Code MedDRA LLT",
        "lbl.parMedEpisodePT": "Code MedDRA PT",
        "lbl.parMedStartDate": "Date de dÃ©but",
        "lbl.parMedEndDate": "Date de fin",
        "lbl.parMedContinue": "En cours ?",
        "lbl.parDiseaseType": "Type de maladie",
        "lbl.parMedDuration": "DurÃ©e",
        "lbl.parMedDurationUnit": "UnitÃ© de durÃ©e",
        "lbl.parCodingType": "Type de codage",
        "lbl.parMedComment": "Commentaires",
        "lbl.sec_study": "Informations sur l''Ã©tude",
        "lbl.sec_studyIdentification": "Identification de l''Ã©tude",
        "lbl.sec_studyDesign": "SchÃ©ma de l''Ã©tude",
        "lbl.sec_studySubject": "Sujet / Inscription",
        "lbl.sec_studySite": "Site et investigateur",
        "lbl.sec_studyRegulatoryIds": "Identifiants rÃ©glementaires",
        "lbl.sec_studyBlinding": "Aveugle / Code",
        "lbl.sec_studyDates": "Dates de l''Ã©tude",
        "lbl.sec_studyAdmin": "DÃ©claration de sÃ©curitÃ© et administration",
        "lbl.sec_studyRegistrations": "Enregistrements de l''Ã©tude",
        "lbl.sec_studyCrossRefInds": "IND rÃ©fÃ©rencÃ©s croisÃ©s",
        "lbl.studySponsorStudyNo": "NÂ° d''Ã©tude promoteur / protocole",
        "lbl.studyName": "Nom de l''Ã©tude",
        "lbl.studyTitle": "Titre de l''Ã©tude",
        "lbl.studyAcronym": "Acronyme de l''Ã©tude",
        "lbl.studyLibraryRecordId": "ID d''enregistrement bibliothÃ¨que",
        "lbl.studyType": "Type d''Ã©tude",
        "lbl.studyDesign": "SchÃ©ma de l''Ã©tude",
        "lbl.studyPhase": "Phase de l''Ã©tude",
        "lbl.blindingTechnique": "Technique d''aveugle",
        "lbl.subjectId": "ID du sujet",
        "lbl.randomizationNumber": "NumÃ©ro de randomisation",
        "lbl.enrolDate": "Date d''inscription",
        "lbl.enrollStatus": "Statut d''inscription",
        "lbl.globalStudyEnrollmentCount": "Effectif mondial de l''Ã©tude",
        "lbl.withdrawnDate": "Date de retrait",
        "lbl.studyCompletionStatus": "Statut de complÃ©tion",
        "lbl.studyDiscontReason": "Raison d''arrÃªt",
        "lbl.siteNumber": "NumÃ©ro de centre",
        "lbl.investigatorNo": "NumÃ©ro d''investigateur",
        "lbl.investigationSite": "Site d''investigation",
        "lbl.investigationSiteRecordId": "ID d''enregistrement du site",
        "lbl.eudractNo": "NumÃ©ro EudraCT",
        "lbl.primaryInd": "IND principal",
        "lbl.reportedPrimaryInd": "IND rapportÃ© / PrÃ©-ANDA",
        "lbl.panda": "PANDA",
        "lbl.projectNo": "NÂ° de projet",
        "lbl.studySerialNumber": "NumÃ©ro de sÃ©rie de l''Ã©tude",
        "lbl.codeBroken": "Code cas levÃ©",
        "lbl.dateCodeBroken": "Date de levÃ©e du code",
        "lbl.studyCodeBroken": "Code Ã©tude levÃ©",
        "lbl.unblindedInformation": "Informations dÃ©masquÃ©es",
        "lbl.euctRegulation": "RÃ¨glement UE CT 2019",
        "lbl.ctdctrDate": "Date de transition CTD vers CTR",
        "lbl.studyStartDate": "Date de dÃ©but",
        "lbl.studyEndDate": "Date de fin",
        "lbl.safetyReporting": "ResponsabilitÃ© de dÃ©claration de sÃ©curitÃ©",
        "lbl.medicalDeviceSafetyReporting": "DÃ©claration sÃ©curitÃ© dispositif mÃ©dical",
        "lbl.otherStudy": "Autres dÃ©tails d''examen",
        "lbl.protocolDetails": "DÃ©tails du protocole",
        "lbl.queryContact": "Contact pour requÃªtes",
        "lbl.studyFollowUp": "Suivi attendu",
        "lbl.studyRegNumber": "NumÃ©ro d''enregistrement",
        "lbl.studyRegCountry": "Pays d''enregistrement",
        "lbl.studyRegDate": "Date d''enregistrement",
        "lbl.noOfPatientsEnrolled": "Nombre de patients inscrits",
        "lbl.noOfMedicinalProduct": "Nombre de mÃ©dicaments",
        "lbl.crossRefInd": "NumÃ©ro IND rÃ©fÃ©rencÃ© croisÃ©",
        "lbl.parentInd": "IND parent",
        "lbl.reportedSponsorStudyNo": "NÂ° d''Ã©tude promoteur rapportÃ©",
        "lbl.crossRefStudyName": "Nom de l''Ã©tude",
        "lbl.sec_eventReactions": "Ã‰vÃ©nements / RÃ©actions",
        "lbl.sec_reactionTerm": "Terme de rÃ©action",
        "lbl.sec_reactionDates": "Dates et durÃ©e",
        "lbl.sec_hospitalization": "DÃ©tails d''hospitalisation",
        "lbl.sec_reactionOutcome": "Issue et classification",
        "lbl.sec_reactionCause": "Cause de l''Ã©vÃ©nement indÃ©sirable",
        "lbl.sec_reactionTreatment": "Traitement",
        "lbl.sec_reactionLocation": "Localisation et dÃ©tection",
        "lbl.sec_reactionClassification": "Classification et indicateurs",
        "lbl.sec_vaccineReaction": "DÃ©tails rÃ©action vaccin",
        "lbl.sec_deviceReaction": "DÃ©tails incident dispositif",
        "lbl.sec_similarIncidents": "Analyse des incidents similaires",
        "lbl.sec_similarIncidentData": "DonnÃ©es incidents similaires",
        "lbl.sec_reactionAdmin": "Administratif",
        "lbl.reactionTerm": "Terme de rÃ©action rapportÃ©",
        "lbl.reactMeddraLlt": "Code MedDRA LLT",
        "lbl.reactMeddraPt": "Code MedDRA PT",
        "lbl.termHighlighted": "Terme mis en Ã©vidence",
        "lbl.reactionNativeLang": "Terme rapportÃ© (langue native)",
        "lbl.nativeLanguage": "Langue native",
        "lbl.reactStartDate": "Date de dÃ©but",
        "lbl.reactEndDate": "Date de cessation",
        "lbl.reactDuration": "DurÃ©e",
        "lbl.reactDurationUnit": "UnitÃ© de durÃ©e",
        "lbl.reactOutcome": "Issue",
        "lbl.severity": "SÃ©vÃ©ritÃ©",
        "lbl.lifeThreatening": "Mettant en jeu le pronostic vital ?",
        "lbl.disability": "InvaliditÃ©/dommage permanent ?",
        "lbl.congenitalAnomalyEvent": "Anomalie congÃ©nitale ?",
        "lbl.otherMedImportant": "Autre condition mÃ©dicalement importante ?",
        "lbl.interventionRequired": "Intervention requise ?",
        "lbl.hospitalisationDate": "Hospitalisation du",
        "lbl.hospitalDischargeDate": "Hospitalisation au",
        "lbl.causeOfAe": "Cause de l''EI",
        "lbl.treatmentPerformed": "Traitement effectuÃ©",
        "lbl.countryOfDetection": "Pays de dÃ©tection",
        "lbl.reactionSite": "Site de rÃ©action",
        "lbl.deviceEventSeverity": "SÃ©vÃ©ritÃ© de l''Ã©vÃ©nement dispositif",
        "lbl.eventReceivedDate": "Date de rÃ©ception",
        "lbl.eventFollowUp": "Suivi attendu",
        "lbl.sec_drugProducts": "MÃ©dicaments / Produits",
        "lbl.sec_productIdentification": "Identification du produit",
        "lbl.sec_productIdentifiers": "Identifiants du produit",
        "lbl.sec_productClassification": "Classification",
        "lbl.sec_productDosage": "Dosage et forme",
        "lbl.sec_productDechallenge": "Action / DÃ©fi / RÃ©introduction",
        "lbl.sec_productFlags": "Indicateurs produit",
        "lbl.sec_activeSubstances": "Substances actives",
        "lbl.sec_drugIndications": "Indications mÃ©dicamenteuses",
        "lbl.sec_drugTherapies": "ThÃ©rapies mÃ©dicamenteuses",
        "lbl.sec_therapyDates": "Dates de thÃ©rapie",
        "lbl.sec_therapyDose": "Dose",
        "lbl.sec_therapyFrequency": "FrÃ©quence",
        "lbl.sec_therapyRoute": "Voie et forme",
        "lbl.sec_therapyLot": "Lot et site",
        "lbl.sec_therapyDoctor": "MÃ©decin prescripteur",
        "lbl.sec_vaccFacility": "Ã‰tablissement de vaccination",
        "lbl.sec_drugApprovals": "Autorisations mÃ©dicamenteuses",
        "lbl.sec_productDevices": "Dispositifs mÃ©dicaux",
        "lbl.sec_deviceIdentification": "Identification du dispositif",
        "lbl.sec_deviceDates": "Dates du dispositif",
        "lbl.sec_deviceEvaluation": "Ã‰valuation et action corrective",
        "lbl.sec_deviceNomenclature": "Nomenclature et composant",
        "lbl.sec_deviceReporting": "DÃ©claration et Ã©tablissement",
        "lbl.sec_deviceManufacturers": "Fabricants du dispositif",
        "lbl.sec_deviceProblemEval": "Ã‰valuation du problÃ¨me dispositif",
        "lbl.sec_deviceImdrfEval": "Ã‰valuation IMDRF",
        "lbl.sec_drugRelatedness": "ImputabilitÃ© mÃ©dicament-rÃ©action",
        "lbl.sec_relatednessCore": "DÃ©tails d''imputabilitÃ©",
        "lbl.sec_causality": "Ã‰valuation de causalitÃ©",
        "lbl.sec_latency": "Latence",
        "lbl.sec_relatednessFlags": "Indicateurs",
        "lbl.sec_reactionLabellings": "Ã‰tiquetage des rÃ©actions",
        "lbl.productNameAsReported": "Nom du produit tel que rapportÃ©",
        "lbl.drugCharacterization": "CaractÃ©risation du produit",
        "lbl.actionDrug": "Mesure prise avec le mÃ©dicament",
        "lbl.dechallenge": "DÃ©fi",
        "lbl.rechallenge": "RÃ©introduction",
        "lbl.companyCausality": "CausalitÃ© de la sociÃ©tÃ©",
        "lbl.reporterCausality": "CausalitÃ© du dÃ©clarant",
        "lbl.labelling": "Ã‰tiquetage",
        "lbl.sec_labTests": "Tests de laboratoire",
        "lbl.sec_labTestCore": "Identification du test",
        "lbl.sec_labTestResult": "RÃ©sultat du test",
        "lbl.sec_labTestAdmin": "Codage et administration",
        "lbl.testName": "Nom du test",
        "lbl.testMeddraLlt": "Code MedDRA LLT",
        "lbl.testMeddraPt": "Code MedDRA PT",
        "lbl.testDate": "Date du test",
        "lbl.testResultValue": "Valeur du rÃ©sultat",
        "lbl.testUnit": "UnitÃ© du rÃ©sultat",
        "lbl.testResultCode": "Code du rÃ©sultat",
        "lbl.testResultText": "RÃ©sultat (texte libre)",
        "lbl.lowTestRange": "Plage normale : basse",
        "lbl.highTestRange": "Plage normale : haute",
        "lbl.moreInformation": "Plus d''informations disponibles",
        "lbl.labFollowUp": "Suivi attendu",
        "lbl.labComments": "Commentaires",
        "lbl.sec_literature": "LittÃ©rature",
        "lbl.sec_literatureCore": "DÃ©tails de la rÃ©fÃ©rence",
        "lbl.sec_publicationDetails": "DÃ©tails de publication",
        "lbl.sec_literatureAdmin": "Administratif",
        "lbl.literatureReference": "RÃ©fÃ©rence bibliographique",
        "lbl.articleTitle": "Titre de l''article",
        "lbl.journalTitle": "Titre du journal",
        "lbl.doi": "DOI",
        "lbl.literatureDocName": "Nom du document",
        "lbl.pubDate": "Date de publication",
        "lbl.edition": "Ã‰dition",
        "lbl.issue": "NumÃ©ro",
        "lbl.pageFrom": "Page de",
        "lbl.pageTo": "Page Ã ",
        "lbl.additionalLitInfo": "Informations supplÃ©mentaires",
        "lbl.retainLiteratureReference": "Conserver la rÃ©fÃ©rence",
        "lbl.litFollowUp": "Suivi attendu",
        "lbl.widget_totalCases": "Total cas",
        "lbl.widget_seriousCases": "Graves",
        "lbl.widget_susarCases": "SUSAR",
        "lbl.widget_openCases": "Ouverts",
        "lbl.widget_overdueCases": "En retard",
        "lbl.sec_r3_caseHeader": "En-tête du cas (extensions R3)",
        "lbl.sec_r3_regulatoryClock": "Horloge réglementaire",
        "lbl.sec_r3_otherSafetyRef": "Autres références de sécurité",
        "lbl.sec_r3_reporter": "Déclarant (extensions R3)",
        "lbl.sec_r3_reporterRegulatory": "Objectif réglementaire",
        "lbl.sec_r3_patient": "Patient (extensions R3)",
        "lbl.sec_r3_patientIdentity": "Identité de genre et ethnicité",
        "lbl.sec_r3_pastDrugSubstances": "Substances médicamenteuses passées (R3)",
        "lbl.sec_r3_reactionExtended": "Réaction (extensions R3)",
        "lbl.sec_r3_reactionNativeLang": "Terme en langue native",
        "lbl.sec_r3_latency": "Latence",
        "lbl.sec_r3_drugProductIds": "Identifiants produit médicamenteux (R3)",
        "lbl.sec_r3_mpidPhpid": "MPID / PhPID",
        "lbl.sec_r3_activeSubstances": "Substances actives (R3)",
        "lbl.sec_r3_therapyTermIds": "TermIDs de thérapie (R3)",
        "lbl.sec_r3_routeTermIds": "TermIDs voie et forme pharmaceutique",
        "lbl.sec_r3_relatednessLabellings": "Imputabilité et étiquetage (R3)",
        "lbl.e2bRegulatoryPurpose": "Source primaire à des fins réglementaires",
        "lbl.reporterCountryPractice": "Pays de pratique",
        "lbl.pharmaTermId": "TermID forme pharmaceutique",
        "lbl.pharmaTermIdVersion": "Version TermID forme pharmaceutique",
        "lbl.routeTermId": "TermID voie d''administration",
        "lbl.routeTermIdVersion": "Version TermID voie d''administration",
        "lbl.parentRouteAdmin": "Voie d''administration parentale",
        "lbl.clinicalDrugCode": "Code médicament clinique (Japon)",
        "lbl.sec_r2_caseHeader": "En-tête du cas (R2)",
        "lbl.sec_r2_reportIdentification": "Identification du rapport",
        "lbl.sec_r2_reportType": "Type de rapport et dates",
        "lbl.sec_r2_seriousness": "Critères de gravité",
        "lbl.sec_r2_reporter": "Déclarant (R2)",
        "lbl.sec_r2_reporterQualification": "Qualification et notification FDA",
        "lbl.sec_r2_patient": "Patient (R2)",
        "lbl.sec_r2_patientCore": "Données essentielles du patient",
        "lbl.sec_r2_patientPhysical": "Caractéristiques physiques",
        "lbl.sec_r2_patientMedical": "Antécédents médicaux",
        "lbl.sec_r2_patientDeath": "Décès / Autopsie",
        "lbl.sec_r2_patientRecords": "Numéros de dossier",
        "lbl.sec_r2_medicalHistory": "Antécédents médicaux (R2)",
        "lbl.sec_r2_pastDrugTherapies": "Traitements passés (R2)",
        "lbl.sec_r2_deathCauses": "Causes de décès (R2)",
        "lbl.sec_r2_parent": "Informations sur le parent (R2)",
        "lbl.sec_r2_eventReactions": "Événements / Réactions (R2)",
        "lbl.sec_r2_reactionCore": "Détails de la réaction",
        "lbl.sec_r2_seriousnessCriteria": "Critères de gravité",
        "lbl.sec_r2_drugProducts": "Médicaments (R2)",
        "lbl.sec_r2_drugCore": "Détails du médicament",
        "lbl.sec_r2_drugIdentification": "Identification du produit",
        "lbl.sec_r2_drugDose": "Dose",
        "lbl.sec_r2_drugAction": "Action / Défi / Réintroduction",
        "lbl.sec_r2_drugTherapy": "Détails de la thérapie",
        "lbl.sec_r2_drugRelatedness": "Imputabilité médicament-réaction",
        "lbl.sec_r2_study": "Informations sur l''étude (R2)",
        "lbl.sec_r2_studyCore": "Détails de l''étude",
        "lbl.sec_r2_studySubject": "Sujet et site",
        "lbl.sec_r2_studyBlinding": "Aveugle / Code"
    },
    "ja": {
        "lbl.sec_caseHeader": "ケースヘッダー",
        "lbl.sec_caseIdentification": "ケース識別",
        "lbl.sec_reportClassification": "報告分類",
        "lbl.sec_caseDates": "ケース日付",
        "lbl.sec_seriousness": "é‡ç¯¤æ€§åŸºæº–",
        "lbl.sec_caseFlags": "ケースフラグ",
        "lbl.sec_assignmentOrg": "担当・組織",
        "lbl.sec_followUp": "追跡",
        "lbl.sec_nonCase": "非ケース・削除",
        "lbl.sec_codingStatus": "コーディング状況",
        "lbl.sec_adminAudit": "管理・監査",
        "lbl.safetyReportId": "安全性報告ID",
        "lbl.safetyReportVersion": "バージョン",
        "lbl.authorityNumb": "当局/会社番号",
        "lbl.aerNo": "AER番号",
        "lbl.aerVersionNo": "AERバージョン",
        "lbl.receiptNo": "受付番号",
        "lbl.reportType": "報告種別",
        "lbl.initialOrFollowup": "初回/追跡",
        "lbl.caseNullification": "無効化/修正",
        "lbl.nullificationReason": "無効化/修正の理由",
        "lbl.reportClassification": "報告カテゴリ",
        "lbl.reportClassificationCategory": "報告分類",
        "lbl.safetyClassification": "安全性/有効性分類",
        "lbl.caseType": "ケース種別",
        "lbl.icsrFlag": "ICSRフラグ",
        "lbl.casePriority": "ローカル基準報告種別",
        "lbl.priority": "報告優先度",
        "lbl.receiveDate": "初回受信日",
        "lbl.receiptDate": "最新受信日",
        "lbl.regulatoryStartDate": "規制クロック開始日",
        "lbl.caseDueDate": "ケース期限日",
        "lbl.submissionDueDate": "提出期限日",
        "lbl.seriousness": "é‡ç¯¤ï¼Ÿ",
        "lbl.death": "æ­»äº¡ï¼Ÿ",
        "lbl.lifethreatening": "生命を脅かす？",
        "lbl.hospitalization": "å…¥é™¢ã‚’å¼•ãèµ·ã“ã—ãŸ/å»¶é•·ã—ãŸï¼Ÿ",
        "lbl.disabling": "障害/永続的損傷？",
        "lbl.congenitalAnomaly": "先天性異常",
        "lbl.otherSerious": "その他医学的に重要な状態？",
        "lbl.requiredIntervention": "介入が必要？",
        "lbl.fulfillExpediteCriteria": "ローカル迅速基準",
        "lbl.medicallyConfirm": "医学的確認",
        "lbl.additionalDoc": "追加文書あり",
        "lbl.susar": "SUSAR",
        "lbl.isCaseAesi": "AESI？",
        "lbl.assignedTo": "担当者",
        "lbl.caseOwner": "ケースオーナー",
        "lbl.assessor": "評価者",
        "lbl.safetyManager": "安全性マネージャー",
        "lbl.followUp": "追跡",
        "lbl.nonCaseReason": "非ケース評価理由",
        "lbl.removeReasonCode": "削除理由コード",
        "lbl.sec_caseDocuments": "ケース文書",
        "lbl.fileName": "ファイル名",
        "lbl.isDocumentIncluded": "文書含む？",
        "lbl.fileS3Path": "ファイルパス",
        "lbl.sec_reporterInformations": "報告者情報",
        "lbl.sec_reporterCore": "規制詳細",
        "lbl.sec_reporterIdentity": "報告者識別",
        "lbl.sec_reporterProfessional": "専門詳細",
        "lbl.sec_reporterContact": "連絡先",
        "lbl.primaryReporter": "主要報告者",
        "lbl.e2bRegulatoryPurpose": "規制目的の一次情報源",
        "lbl.doNotReportName": "機密保護",
        "lbl.reporterQualification": "資格",
        "lbl.reporterSentToFDA": "報告者が当局に直接通知",
        "lbl.reporterTitle": "敬称",
        "lbl.reporterGivenName": "名",
        "lbl.reporterMiddleName": "ミドルネーム",
        "lbl.reporterFamilyName": "姓",
        "lbl.reporterOrContact": "人物種別",
        "lbl.consentToContacts": "連絡への同意",
        "lbl.canFollowUp": "追跡可能",
        "lbl.isHealthProf": "医療専門家",
        "lbl.occupation": "職業",
        "lbl.speciality": "専門分野",
        "lbl.reporterOrganization": "病院/組織名",
        "lbl.reporterDepartment": "部門",
        "lbl.reporterCity": "市区町村",
        "lbl.reporterCountry": "国",
        "lbl.reporterPhone": "電話番号",
        "lbl.reporterEmail": "メールアドレス",
        "lbl.reporterCountryPractice": "診療国",
        "lbl.sec_sourceInformations": "情報源",
        "lbl.sec_sourceCore": "情報源詳細",
        "lbl.sec_sourceReference": "参照詳細",
        "lbl.primarySource": "一次情報源",
        "lbl.source": "情報源",
        "lbl.dateReceived": "受信日",
        "lbl.originatingAccount": "送信組織",
        "lbl.senderOrganisationType": "送信組織種別",
        "lbl.sourceFollowUp": "追跡",
        "lbl.identificationNo": "参照番号",
        "lbl.referenceType": "参照種別",
        "lbl.sourceAerNumber": "情報源AERバージョン",
        "lbl.sourceDescription": "説明",
        "lbl.sec_patient": "患者",
        "lbl.sec_patientCore": "患者識別",
        "lbl.sec_patientDemographics": "人口統計",
        "lbl.sec_patientPhysical": "身体的特徴",
        "lbl.sec_patientMedical": "医療背景",
        "lbl.sec_patientDeath": "死亡/剖検",
        "lbl.sec_patientContact": "連絡先",
        "lbl.sec_patientRecords": "記録番号",
        "lbl.sec_patientVaccine": "ワクチン情報",
        "lbl.sec_biologicalFather": "生物学的父親",
        "lbl.sec_patientAdmin": "管理",
        "lbl.patientInitial": "患者ID/イニシャル",
        "lbl.patDoNotReportName": "機密保護",
        "lbl.patientIdentify": "患者特定可能",
        "lbl.patSex": "性別",
        "lbl.patGender": "性自認",
        "lbl.patDob": "生年月日",
        "lbl.patOnsetAge": "発症時年齢",
        "lbl.patOnsetAgeUnit": "年齢単位",
        "lbl.patAgeGroup": "年齢群",
        "lbl.patWeight": "体重",
        "lbl.patWeightUnit": "体重単位",
        "lbl.patHeight": "身長",
        "lbl.patHeightUnit": "身長単位",
        "lbl.patLMP": "最終月経日",
        "lbl.patientPregnant": "妊娠中？",
        "lbl.gestationalAge": "発症時妊娠週数",
        "lbl.patMedicalHistoryText": "病歴および合併症",
        "lbl.resultsTestsProcedures": "検査・処置結果",
        "lbl.patDeathDate": "死亡日",
        "lbl.patAutopsyYesNo": "剖検実施？",
        "lbl.patCity": "市区町村",
        "lbl.patCountry": "国",
        "lbl.partnerName": "生物学的父親名",
        "lbl.biologicalFatherAge": "生物学的父親の年齢",
        "lbl.sec_patientSummary": "ケースサマリー",
        "lbl.sec_caseNarrative": "ケースナラティブ",
        "lbl.sec_medicalAssessment": "医学的評価",
        "lbl.sec_clinicalNarrative": "臨床ナラティブ",
        "lbl.sec_correctiveActions": "是正/予防措置",
        "lbl.companyNarrative": "事象説明（会社ナラティブ）",
        "lbl.reporterComment": "報告者による反応説明",
        "lbl.senderComment": "会社コメント（送信者コメント）",
        "lbl.summaryDescription": "サマリー説明",
        "lbl.evaluationComments": "ファーマコビジランスコメント",
        "lbl.evaluationSummary": "評価サマリー",
        "lbl.additionalInformation": "追加情報",
        "lbl.additionalComments": "追加コメント",
        "lbl.whatFurtherInvestigations": "予定されている追加調査",
        "lbl.patientDuringEvent": "事象中の患者状態説明",
        "lbl.treatmentFollowingEvent": "事象後の治療",
        "lbl.manufacturerNarrative": "製造業者の最終コメント",
        "lbl.correctiveActions": "是正措置",
        "lbl.correctedData": "修正データ",
        "lbl.productComplaintDetails": "製品苦情詳細",
        "lbl.initialManufacturerAnalysis": "製造業者の初期分析",
        "lbl.summaryFollowUp": "追跡",
        "lbl.sec_medicalHistory": "病歴",
        "lbl.sec_medHistCore": "エピソード詳細",
        "lbl.sec_medHistClassification": "分類",
        "lbl.sec_medHistDuration": "期間",
        "lbl.sec_medHistAdmin": "コーディング・管理",
        "lbl.medicalEpisodeName": "疾患/状態用語",
        "lbl.medicalEpisodeLLT": "MedDRA LLTコード",
        "lbl.medicalHistoryPT": "MedDRA PTコード",
        "lbl.medicalStartDate": "開始日",
        "lbl.medicalEndDate": "終了日",
        "lbl.medicalContinue": "継続中？",
        "lbl.diseaseType": "疾患種別",
        "lbl.conditionTreated": "治療中の状態",
        "lbl.familyHistory": "家族歴",
        "lbl.illnessAtVaccination": "接種時の疾患",
        "lbl.medHistDuration": "期間",
        "lbl.medHistDurationUnit": "期間単位",
        "lbl.codingType": "ã‚³ãƒ¼ãƒ‡ã‚£ãƒ³ã‚°ç¨®åˆ¥",
        "lbl.concomitantTherapies": "併用療法",
        "lbl.medicalComment": "コメント",
        "lbl.sec_pastDrugTherapies": "過去の薬物療法",
        "lbl.sec_pastDrugProduct": "製品識別",
        "lbl.sec_pastDrugCoding": "MedDRAコーディング・製品ID",
        "lbl.sec_pastDrugDates": "日付・ワクチン接種",
        "lbl.sec_pastDrugDetails": "追加詳細",
        "lbl.sec_pastDrugSubstances": "物質",
        "lbl.pastDrugName": "報告された製品名",
        "lbl.pastDrugIndication": "適応症用語",
        "lbl.pastDrugReaction": "反応用語",
        "lbl.pastDrugStartDate": "開始日",
        "lbl.pastDrugEndDate": "終了日",
        "lbl.substanceName": "ç‰©è³ªå",
        "lbl.substanceStrengthNumber": "含量（数値）",
        "lbl.substanceStrengthUnit": "å¼·åº¦å˜ä½",
        "lbl.sec_pregnancy": "妊娠",
        "lbl.sec_pregnancyDetails": "妊娠詳細",
        "lbl.sec_pregnancyPhysical": "身体・分娩",
        "lbl.sec_pregnancyAdmin": "フォローアップとコメント",
        "lbl.sec_pregnancyOutcomes": "妊娠転帰",
        "lbl.sec_outcomeCore": "転帰詳細",
        "lbl.sec_prevPregnancyOutcomes": "過去の妊娠転帰",
        "lbl.sec_neonates": "新生児",
        "lbl.sec_neonateCore": "新生児詳細",
        "lbl.sec_neonateAnomaly": "先天性異常",
        "lbl.sec_neonateApgar": "APGARスコア",
        "lbl.sec_neonateNicu": "NICU入院",
        "lbl.sec_neonateOther": "その他の詳細",
        "lbl.sec_neonateChildren": "小児フォローアップ",
        "lbl.pregnancyType": "妊娠種別",
        "lbl.trimesterOfExposure": "曝露時の妊娠期",
        "lbl.pregnancyConfirmDate": "妊娠確認日",
        "lbl.pregnancyConfirmMode": "確認方法",
        "lbl.expectedDueDate": "予定日",
        "lbl.gravidity": "妊娠回数",
        "lbl.para": "分娩回数",
        "lbl.plannedPregnancy": "計画妊娠",
        "lbl.contraceptivesUsed": "避妊具使用",
        "lbl.contraceptiveFailure": "避妊失敗",
        "lbl.typesOfContraceptives": "避妊具の種類",
        "lbl.prePregnancyWeight": "妊娠前体重",
        "lbl.prePregnancyWeightUnit": "体重単位",
        "lbl.deliveryMethod": "分娩方法",
        "lbl.familyHistoryBirthDefects": "先天性異常の家族歴",
        "lbl.pregnancyFollowUp": "フォローアップ予定",
        "lbl.pregnancyComments": "コメント",
        "lbl.pregnancyOutcome": "妊娠転帰",
        "lbl.pregnancyOutcomeDate": "転帰日",
        "lbl.pregnancyEndDate": "妊娠終了日",
        "lbl.noOfFoetus": "胎児数",
        "lbl.liveBirthComplications": "生産合併症",
        "lbl.pastPregnancyOutcome": "過去の妊娠転帰",
        "lbl.pastPregnancyOutcomeDetails": "過去の転帰詳細",
        "lbl.noOfChildren": "子供の数",
        "lbl.numberOfAbortions": "流産回数",
        "lbl.birthOutcome": "出生転帰",
        "lbl.childSex": "子供の性別",
        "lbl.whichPregnancy": "何回目の妊娠",
        "lbl.currentPregnancy": "現在の妊娠",
        "lbl.gestationalAgeBirth": "出生時妊娠週数",
        "lbl.gestationalAgeBirthUnit": "妊娠週数単位",
        "lbl.congenitalAnomalyType": "異常の種類",
        "lbl.apgarScore1": "APGARスコア（1分）",
        "lbl.apgarScore5": "APGARスコア（5分）",
        "lbl.apgarScore10": "APGARスコア（10分）",
        "lbl.nicuAdmission": "NICU入院",
        "lbl.admissionDuration": "入院期間",
        "lbl.admissionDurationUnit": "期間単位",
        "lbl.resuscitated": "蘇生処置",
        "lbl.otherNeonateDetails": "その他の新生児詳細",
        "lbl.otherOutcomeDetails": "その他の転帰詳細",
        "lbl.childAge": "子供の年齢",
        "lbl.childAgeUnit": "年齢単位",
        "lbl.headCircumBirth": "出生時頭囲",
        "lbl.headCircumBirthUnit": "頭囲単位",
        "lbl.neonBirthLength": "出生時身長",
        "lbl.neonBirthLengthUnit": "身長単位",
        "lbl.neonWeight": "出生時体重",
        "lbl.neonWeightUnit": "体重単位",
        "lbl.sec_deathCauses": "æ­»å› ",
        "lbl.sec_reportedDeathCauses": "å ±å‘Šã•ã‚ŒãŸæ­»å› ",
        "lbl.sec_autopsyCauses": "å‰–æ¤œã«ã‚ˆã‚‹æ­»å› ",
        "lbl.patDeathReport": "å ±å‘Šã•ã‚ŒãŸæ­»å› ",
        "lbl.patDeathReportMeddraCode": "MedDRA LLTã‚³ãƒ¼ãƒ‰ï¼ˆå ±å‘Šæ­»å› ï¼‰",
        "lbl.patDeathReportMeddraPtCode": "MedDRA PTã‚³ãƒ¼ãƒ‰ï¼ˆå ±å‘Šæ­»å› ï¼‰",
        "lbl.patDetAutopsy": "å‰–æ¤œã«ã‚ˆã‚‹æ­»å› ",
        "lbl.patDetAutopsyMeddraCode": "MedDRA LLTã‚³ãƒ¼ãƒ‰ï¼ˆå‰–æ¤œæ­»å› ï¼‰",
        "lbl.patDetAutopsyMeddraPtCode": "MedDRA PTã‚³ãƒ¼ãƒ‰ï¼ˆå‰–æ¤œæ­»å› ï¼‰",
        "lbl.sec_parent": "è¦ªæƒ…å ±",
        "lbl.sec_parentCore": "è¦ªã®è­˜åˆ¥",
        "lbl.sec_parentPhysical": "èº«ä½“çš„ç‰¹å¾´",
        "lbl.sec_parentMedical": "ç—…æ­´",
        "lbl.sec_parentVaccine": "ãƒ¯ã‚¯ãƒãƒ³æƒ…å ±",
        "lbl.sec_parentAdmin": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—ã¨åŒæ„",
        "lbl.sec_parentPastDrugs": "è¦ªã®éŽåŽ»ã®è–¬ç‰©ç™‚æ³•",
        "lbl.sec_parDrugProduct": "è£½å“è©³ç´°",
        "lbl.sec_parDrugIdentifiers": "è£½å“è­˜åˆ¥å­",
        "lbl.sec_parDrugTherapy": "ç™‚æ³•ã¨é©å¿œç—‡",
        "lbl.sec_parDrugForm": "å‰¤å½¢ã¨ã‚³ãƒ³ãƒ†ãƒŠ",
        "lbl.sec_parDrugSubstances": "æœ‰åŠ¹æˆåˆ†",
        "lbl.sec_parentMedHistory": "è¦ªã®ç—…æ­´",
        "lbl.sec_parMedHistCore": "ã‚¨ãƒ”ã‚½ãƒ¼ãƒ‰è©³ç´°",
        "lbl.sec_parMedHistDuration": "æœŸé–“",
        "lbl.sec_parMedHistAdmin": "ã‚³ãƒ¼ãƒ‡ã‚£ãƒ³ã‚°ã¨ã‚³ãƒ¡ãƒ³ãƒˆ",
        "lbl.parentId": "è¦ªID/ã‚¤ãƒ‹ã‚·ãƒ£ãƒ«",
        "lbl.parentSex": "è¦ªã®æ€§åˆ¥",
        "lbl.parentDob": "è¦ªã®ç”Ÿå¹´æœˆæ—¥",
        "lbl.parentAge": "è¦ªã®å¹´é½¢",
        "lbl.parentAgeUnit": "å¹´é½¢å˜ä½",
        "lbl.parentEthnicity": "æ°‘æ—çš„å‡ºè‡ª",
        "lbl.parentLMP": "æœ€çµ‚æœˆçµŒæ—¥",
        "lbl.parentWeight": "è¦ªã®ä½“é‡",
        "lbl.parentWeightUnit": "ä½“é‡å˜ä½",
        "lbl.parentHeight": "è¦ªã®èº«é•·",
        "lbl.parentHeightUnit": "èº«é•·å˜ä½",
        "lbl.parentMedHistory": "ç—…æ­´ãƒ†ã‚­ã‚¹ãƒˆ",
        "lbl.parentAgeAtVaccine": "æŽ¥ç¨®æ™‚å¹´é½¢",
        "lbl.parentAgeAtVaccineUnit": "æŽ¥ç¨®æ™‚å¹´é½¢å˜ä½",
        "lbl.parentConsentToContact": "é€£çµ¡ã¸ã®åŒæ„",
        "lbl.parentFollowUp": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—å¯èƒ½",
        "lbl.parDrugName": "å ±å‘Šã•ã‚ŒãŸè£½å“å",
        "lbl.parProductDescription": "è£½å“èª¬æ˜Ž",
        "lbl.parInventedName": "ç™ºæ˜Žå",
        "lbl.parScientificName": "ç§‘å­¦å",
        "lbl.parTrademarkName": "å•†æ¨™å",
        "lbl.parDrugStartDate": "é–‹å§‹æ—¥",
        "lbl.parDrugEndDate": "çµ‚äº†æ—¥",
        "lbl.parDrugIndication": "é©å¿œç—‡ç”¨èªž",
        "lbl.parDrugIndicationLLT": "MedDRA LLTï¼ˆé©å¿œç—‡ï¼‰",
        "lbl.parDrugIndicationPT": "MedDRA PTï¼ˆé©å¿œç—‡ï¼‰",
        "lbl.parDrugReaction": "åå¿œç”¨èªž",
        "lbl.parDrugReactionLLT": "MedDRA LLTï¼ˆåå¿œï¼‰",
        "lbl.parDrugReactionPT": "MedDRA PTï¼ˆåå¿œï¼‰",
        "lbl.parFormName": "å‰¤å½¢å",
        "lbl.parStrengthName": "å¼·åº¦å",
        "lbl.parContainerName": "å®¹å™¨å",
        "lbl.parDeviceName": "ãƒ‡ãƒã‚¤ã‚¹å",
        "lbl.parIntendedUseName": "ä½¿ç”¨ç›®çš„",
        "lbl.substanceTermId": "ç‰©è³ªTermID",
        "lbl.substanceTermIdVersion": "TermIDãƒãƒ¼ã‚¸ãƒ§ãƒ³",
        "lbl.substanceStrength": "å¼·åº¦ï¼ˆæ•°å€¤ï¼‰",
        "lbl.parMedEpisodeName": "ç–¾æ‚£/çŠ¶æ…‹ç”¨èªž",
        "lbl.parMedEpisodeLLT": "MedDRA LLTã‚³ãƒ¼ãƒ‰",
        "lbl.parMedEpisodePT": "MedDRA PTã‚³ãƒ¼ãƒ‰",
        "lbl.parMedStartDate": "é–‹å§‹æ—¥",
        "lbl.parMedEndDate": "çµ‚äº†æ—¥",
        "lbl.parMedContinue": "ç¶™ç¶šä¸­ï¼Ÿ",
        "lbl.parDiseaseType": "ç–¾æ‚£ç¨®åˆ¥",
        "lbl.parMedDuration": "æœŸé–“",
        "lbl.parMedDurationUnit": "æœŸé–“å˜ä½",
        "lbl.parCodingType": "ã‚³ãƒ¼ãƒ‡ã‚£ãƒ³ã‚°ç¨®åˆ¥",
        "lbl.parMedComment": "ã‚³ãƒ¡ãƒ³ãƒˆ",
        "lbl.sec_study": "è©¦é¨“æƒ…å ±",
        "lbl.sec_studyIdentification": "è©¦é¨“è­˜åˆ¥",
        "lbl.sec_studyDesign": "è©¦é¨“ãƒ‡ã‚¶ã‚¤ãƒ³",
        "lbl.sec_studySubject": "è¢«é¨“è€…/ç™»éŒ²",
        "lbl.sec_studySite": "æ–½è¨­ã¨æ²»é¨“è²¬ä»»åŒ»å¸«",
        "lbl.sec_studyRegulatoryIds": "è¦åˆ¶è­˜åˆ¥å­",
        "lbl.sec_studyBlinding": "ç›²æ¤œ/ã‚³ãƒ¼ãƒ‰",
        "lbl.sec_studyDates": "è©¦é¨“æ—¥ç¨‹",
        "lbl.sec_studyAdmin": "å®‰å…¨æ€§å ±å‘Šã¨ç®¡ç†",
        "lbl.sec_studyRegistrations": "è©¦é¨“ç™»éŒ²",
        "lbl.sec_studyCrossRefInds": "ç›¸äº’å‚ç…§IND",
        "lbl.studySponsorStudyNo": "ã‚¹ãƒãƒ³ã‚µãƒ¼è©¦é¨“ç•ªå·/ãƒ—ãƒ­ãƒˆã‚³ãƒ«ç•ªå·",
        "lbl.studyName": "è©¦é¨“å",
        "lbl.studyTitle": "è©¦é¨“ã‚¿ã‚¤ãƒˆãƒ«",
        "lbl.studyAcronym": "è©¦é¨“ç•¥ç§°",
        "lbl.studyLibraryRecordId": "è©¦é¨“ãƒ©ã‚¤ãƒ–ãƒ©ãƒªãƒ¬ã‚³ãƒ¼ãƒ‰ID",
        "lbl.studyType": "è©¦é¨“ç¨®åˆ¥",
        "lbl.studyDesign": "è©¦é¨“ãƒ‡ã‚¶ã‚¤ãƒ³",
        "lbl.studyPhase": "è©¦é¨“ãƒ•ã‚§ãƒ¼ã‚º",
        "lbl.blindingTechnique": "ç›²æ¤œåŒ–æ‰‹æ³•",
        "lbl.subjectId": "è¢«é¨“è€…ID",
        "lbl.randomizationNumber": "ç„¡ä½œç‚ºåŒ–ç•ªå·",
        "lbl.enrolDate": "ç™»éŒ²æ—¥",
        "lbl.enrollStatus": "ç™»éŒ²ã‚¹ãƒ†ãƒ¼ã‚¿ã‚¹",
        "lbl.globalStudyEnrollmentCount": "ã‚°ãƒ­ãƒ¼ãƒãƒ«ç™»éŒ²æ•°",
        "lbl.withdrawnDate": "ä¸­æ­¢æ—¥",
        "lbl.studyCompletionStatus": "è©¦é¨“å®Œäº†ã‚¹ãƒ†ãƒ¼ã‚¿ã‚¹",
        "lbl.studyDiscontReason": "ä¸­æ­¢ç†ç”±",
        "lbl.siteNumber": "ã‚»ãƒ³ã‚¿ãƒ¼ç•ªå·",
        "lbl.investigatorNo": "æ²»é¨“è²¬ä»»åŒ»å¸«ç•ªå·",
        "lbl.investigationSite": "æ²»é¨“å®Ÿæ–½æ–½è¨­",
        "lbl.investigationSiteRecordId": "æ–½è¨­ãƒ¬ã‚³ãƒ¼ãƒ‰ID",
        "lbl.eudractNo": "EudraCTç•ªå·",
        "lbl.primaryInd": "ä¸»è¦INDç•ªå·",
        "lbl.reportedPrimaryInd": "å ±å‘ŠIND/Pre-ANDAç•ªå·",
        "lbl.panda": "PANDAç•ªå·",
        "lbl.projectNo": "ãƒ—ãƒ­ã‚¸ã‚§ã‚¯ãƒˆç•ªå·",
        "lbl.studySerialNumber": "è©¦é¨“ã‚·ãƒªã‚¢ãƒ«ç•ªå·",
        "lbl.codeBroken": "ã‚±ãƒ¼ã‚¹ã‚³ãƒ¼ãƒ‰é–‹å°",
        "lbl.dateCodeBroken": "ã‚³ãƒ¼ãƒ‰é–‹å°æ—¥",
        "lbl.studyCodeBroken": "è©¦é¨“ã‚³ãƒ¼ãƒ‰é–‹å°",
        "lbl.unblindedInformation": "é–‹å°æƒ…å ±",
        "lbl.euctRegulation": "EU CTè¦å‰‡2019",
        "lbl.ctdctrDate": "CTDã‹ã‚‰CTRã¸ã®ç§»è¡Œæ—¥",
        "lbl.studyStartDate": "è©¦é¨“é–‹å§‹æ—¥",
        "lbl.studyEndDate": "è©¦é¨“çµ‚äº†æ—¥",
        "lbl.safetyReporting": "å®‰å…¨æ€§å ±å‘Šè²¬ä»»",
        "lbl.medicalDeviceSafetyReporting": "åŒ»ç™‚æ©Ÿå™¨å®‰å…¨æ€§å ±å‘Š",
        "lbl.otherStudy": "ãã®ä»–ã®æ¤œæŸ»è©³ç´°",
        "lbl.protocolDetails": "ãƒ—ãƒ­ãƒˆã‚³ãƒ«è©³ç´°",
        "lbl.queryContact": "å•ã„åˆã‚ã›å…ˆ",
        "lbl.studyFollowUp": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—äºˆå®š",
        "lbl.studyRegNumber": "ç™»éŒ²ç•ªå·",
        "lbl.studyRegCountry": "ç™»éŒ²å›½",
        "lbl.studyRegDate": "ç™»éŒ²æ—¥",
        "lbl.noOfPatientsEnrolled": "ç™»éŒ²æ‚£è€…æ•°",
        "lbl.noOfMedicinalProduct": "åŒ»è–¬å“æ•°",
        "lbl.crossRefInd": "ç›¸äº’å‚ç…§INDç•ªå·",
        "lbl.parentInd": "è¦ªIND",
        "lbl.reportedSponsorStudyNo": "å ±å‘Šã‚¹ãƒãƒ³ã‚µãƒ¼è©¦é¨“ç•ªå·",
        "lbl.crossRefStudyName": "è©¦é¨“å",
        "lbl.sec_eventReactions": "äº‹è±¡/åå¿œ",
        "lbl.sec_reactionTerm": "åå¿œç”¨èªž",
        "lbl.sec_reactionDates": "æ—¥ä»˜ã¨æœŸé–“",
        "lbl.sec_hospitalization": "å…¥é™¢è©³ç´°",
        "lbl.sec_reactionOutcome": "è»¢å¸°ã¨åˆ†é¡ž",
        "lbl.sec_reactionCause": "æœ‰å®³äº‹è±¡ã®åŽŸå› ",
        "lbl.sec_reactionTreatment": "æ²»ç™‚",
        "lbl.sec_reactionLocation": "å ´æ‰€ã¨æ¤œå‡º",
        "lbl.sec_reactionClassification": "åˆ†é¡žã¨ãƒ•ãƒ©ã‚°",
        "lbl.sec_vaccineReaction": "ãƒ¯ã‚¯ãƒãƒ³åå¿œè©³ç´°",
        "lbl.sec_deviceReaction": "æ©Ÿå™¨ã‚¤ãƒ³ã‚·ãƒ‡ãƒ³ãƒˆè©³ç´°",
        "lbl.sec_similarIncidents": "é¡žä¼¼ã‚¤ãƒ³ã‚·ãƒ‡ãƒ³ãƒˆåˆ†æž",
        "lbl.sec_similarIncidentData": "é¡žä¼¼ã‚¤ãƒ³ã‚·ãƒ‡ãƒ³ãƒˆãƒ‡ãƒ¼ã‚¿",
        "lbl.sec_reactionAdmin": "ç®¡ç†",
        "lbl.reactionTerm": "å ±å‘Šã•ã‚ŒãŸåå¿œç”¨èªž",
        "lbl.reactMeddraLlt": "MedDRA LLTã‚³ãƒ¼ãƒ‰",
        "lbl.reactMeddraPt": "MedDRA PTã‚³ãƒ¼ãƒ‰",
        "lbl.termHighlighted": "å¼·èª¿ç”¨èªž",
        "lbl.reactionNativeLang": "å ±å‘Šç”¨èªžï¼ˆæ¯å›½èªžï¼‰",
        "lbl.nativeLanguage": "æ¯å›½èªž",
        "lbl.reactStartDate": "ç™ºç—‡æ—¥",
        "lbl.reactEndDate": "æ¶ˆå¤±æ—¥",
        "lbl.reactDuration": "æœŸé–“",
        "lbl.reactDurationUnit": "æœŸé–“å˜ä½",
        "lbl.reactOutcome": "è»¢å¸°",
        "lbl.severity": "é‡ç—‡åº¦",
        "lbl.lifeThreatening": "ç”Ÿå‘½ã‚’è„…ã‹ã™ï¼Ÿ",
        "lbl.disability": "éšœå®³/æ°¸ç¶šçš„æå‚·ï¼Ÿ",
        "lbl.congenitalAnomalyEvent": "å…ˆå¤©æ€§ç•°å¸¸ï¼Ÿ",
        "lbl.otherMedImportant": "ãã®ä»–ã®åŒ»å­¦çš„ã«é‡è¦ãªçŠ¶æ…‹ï¼Ÿ",
        "lbl.interventionRequired": "ä»‹å…¥ãŒå¿…è¦ï¼Ÿ",
        "lbl.hospitalisationDate": "å…¥é™¢é–‹å§‹æ—¥",
        "lbl.hospitalDischargeDate": "é€€é™¢æ—¥",
        "lbl.causeOfAe": "æœ‰å®³äº‹è±¡ã®åŽŸå› ",
        "lbl.treatmentPerformed": "æ²»ç™‚å®Ÿæ–½",
        "lbl.countryOfDetection": "æ¤œå‡ºå›½",
        "lbl.reactionSite": "åå¿œéƒ¨ä½",
        "lbl.deviceEventSeverity": "æ©Ÿå™¨äº‹è±¡é‡ç—‡åº¦",
        "lbl.eventReceivedDate": "äº‹è±¡å—ä¿¡æ—¥",
        "lbl.eventFollowUp": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—äºˆå®š",
        "lbl.sec_drugProducts": "åŒ»è–¬å“/è£½å“",
        "lbl.sec_productIdentification": "è£½å“è­˜åˆ¥",
        "lbl.sec_productIdentifiers": "è£½å“è­˜åˆ¥å­",
        "lbl.sec_productClassification": "åˆ†é¡ž",
        "lbl.sec_productDosage": "ç”¨é‡ã¨å‰¤å½¢",
        "lbl.sec_productDechallenge": "æŽªç½®/æŠ•ä¸Žä¸­æ­¢/å†æŠ•ä¸Ž",
        "lbl.sec_productFlags": "è£½å“ãƒ•ãƒ©ã‚°",
        "lbl.sec_activeSubstances": "æœ‰åŠ¹æˆåˆ†",
        "lbl.sec_drugIndications": "è–¬ç‰©é©å¿œç—‡",
        "lbl.sec_drugTherapies": "è–¬ç‰©ç™‚æ³•",
        "lbl.sec_therapyDates": "ç™‚æ³•æ—¥ç¨‹",
        "lbl.sec_therapyDose": "ç”¨é‡",
        "lbl.sec_therapyFrequency": "æŠ•ä¸Žé »åº¦",
        "lbl.sec_therapyRoute": "æŠ•ä¸ŽçµŒè·¯ã¨å‰¤å½¢",
        "lbl.sec_therapyLot": "ãƒ­ãƒƒãƒˆã¨ã‚µã‚¤ãƒˆ",
        "lbl.sec_therapyDoctor": "å‡¦æ–¹åŒ»",
        "lbl.sec_vaccFacility": "æŽ¥ç¨®æ–½è¨­",
        "lbl.sec_drugApprovals": "è–¬ç‰©æ‰¿èª",
        "lbl.sec_productDevices": "åŒ»ç™‚æ©Ÿå™¨",
        "lbl.sec_deviceIdentification": "æ©Ÿå™¨è­˜åˆ¥",
        "lbl.sec_deviceDates": "æ©Ÿå™¨æ—¥ç¨‹",
        "lbl.sec_deviceEvaluation": "è©•ä¾¡ã¨æ˜¯æ­£æŽªç½®",
        "lbl.sec_deviceNomenclature": "å‘½åæ³•ã¨ã‚³ãƒ³ãƒãƒ¼ãƒãƒ³ãƒˆ",
        "lbl.sec_deviceReporting": "å ±å‘Šã¨æ–½è¨­",
        "lbl.sec_deviceManufacturers": "æ©Ÿå™¨è£½é€ æ¥­è€…",
        "lbl.sec_deviceProblemEval": "æ©Ÿå™¨å•é¡Œè©•ä¾¡",
        "lbl.sec_deviceImdrfEval": "IMDRFè©•ä¾¡",
        "lbl.sec_drugRelatedness": "è–¬ç‰©-åå¿œé–¢é€£æ€§",
        "lbl.sec_relatednessCore": "é–¢é€£æ€§è©³ç´°",
        "lbl.sec_causality": "å› æžœé–¢ä¿‚è©•ä¾¡",
        "lbl.sec_latency": "æ½œä¼æœŸé–“",
        "lbl.sec_relatednessFlags": "ãƒ•ãƒ©ã‚°",
        "lbl.sec_reactionLabellings": "åå¿œãƒ©ãƒ™ãƒªãƒ³ã‚°",
        "lbl.productNameAsReported": "å ±å‘Šã•ã‚ŒãŸè£½å“å",
        "lbl.drugCharacterization": "è£½å“ç‰¹æ€§",
        "lbl.actionDrug": "è–¬ç‰©ã«å¯¾ã™ã‚‹æŽªç½®",
        "lbl.dechallenge": "æŠ•ä¸Žä¸­æ­¢",
        "lbl.rechallenge": "å†æŠ•ä¸Ž",
        "lbl.companyCausality": "ä¼æ¥­å› æžœé–¢ä¿‚",
        "lbl.reporterCausality": "å ±å‘Šè€…å› æžœé–¢ä¿‚",
        "lbl.labelling": "ãƒ©ãƒ™ãƒªãƒ³ã‚°",
        "lbl.sec_labTests": "è‡¨åºŠæ¤œæŸ»",
        "lbl.sec_labTestCore": "æ¤œæŸ»è­˜åˆ¥",
        "lbl.sec_labTestResult": "æ¤œæŸ»çµæžœ",
        "lbl.sec_labTestAdmin": "ã‚³ãƒ¼ãƒ‡ã‚£ãƒ³ã‚°ã¨ç®¡ç†",
        "lbl.testName": "æ¤œæŸ»å",
        "lbl.testMeddraLlt": "MedDRA LLTã‚³ãƒ¼ãƒ‰",
        "lbl.testMeddraPt": "MedDRA PTã‚³ãƒ¼ãƒ‰",
        "lbl.testDate": "æ¤œæŸ»æ—¥",
        "lbl.testResultValue": "çµæžœå€¤",
        "lbl.testUnit": "çµæžœå˜ä½",
        "lbl.testResultCode": "çµæžœã‚³ãƒ¼ãƒ‰",
        "lbl.testResultText": "çµæžœï¼ˆãƒ•ãƒªãƒ¼ãƒ†ã‚­ã‚¹ãƒˆï¼‰",
        "lbl.lowTestRange": "åŸºæº–å€¤ï¼šä¸‹é™",
        "lbl.highTestRange": "åŸºæº–å€¤ï¼šä¸Šé™",
        "lbl.moreInformation": "è¿½åŠ æƒ…å ±ã‚ã‚Š",
        "lbl.labFollowUp": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—äºˆå®š",
        "lbl.labComments": "ã‚³ãƒ¡ãƒ³ãƒˆ",
        "lbl.sec_literature": "æ–‡çŒ®",
        "lbl.sec_literatureCore": "å‚è€ƒæ–‡çŒ®è©³ç´°",
        "lbl.sec_publicationDetails": "å‡ºç‰ˆè©³ç´°",
        "lbl.sec_literatureAdmin": "ç®¡ç†",
        "lbl.literatureReference": "æ–‡çŒ®å‚ç…§",
        "lbl.articleTitle": "è¨˜äº‹ã‚¿ã‚¤ãƒˆãƒ«",
        "lbl.journalTitle": "é›‘èªŒã‚¿ã‚¤ãƒˆãƒ«",
        "lbl.doi": "DOI",
        "lbl.literatureDocName": "æ–‡æ›¸å",
        "lbl.pubDate": "å‡ºç‰ˆæ—¥",
        "lbl.edition": "ç‰ˆ",
        "lbl.issue": "å·",
        "lbl.pageFrom": "é–‹å§‹ãƒšãƒ¼ã‚¸",
        "lbl.pageTo": "çµ‚äº†ãƒšãƒ¼ã‚¸",
        "lbl.additionalLitInfo": "è¿½åŠ æƒ…å ±",
        "lbl.retainLiteratureReference": "å‚ç…§ã‚’ä¿æŒ",
        "lbl.litFollowUp": "ãƒ•ã‚©ãƒ­ãƒ¼ã‚¢ãƒƒãƒ—äºˆå®š",
        "lbl.widget_totalCases": "総ケース数",
        "lbl.widget_seriousCases": "重篤",
        "lbl.widget_susarCases": "SUSAR",
        "lbl.widget_openCases": "オープン",
        "lbl.widget_overdueCases": "期限超過",
        "lbl.sec_r3_caseHeader": "ケースヘッダー（R3拡張）",
        "lbl.sec_r3_regulatoryClock": "規制クロック",
        "lbl.sec_r3_otherSafetyRef": "その他の安全性参照",
        "lbl.sec_r3_reporter": "報告者（R3拡張）",
        "lbl.sec_r3_reporterRegulatory": "規制目的",
        "lbl.sec_r3_patient": "患者（R3拡張）",
        "lbl.sec_r3_patientIdentity": "性自認と民族性",
        "lbl.sec_r3_pastDrugSubstances": "過去の薬物有効成分（R3）",
        "lbl.sec_r3_reactionExtended": "反応（R3拡張）",
        "lbl.sec_r3_reactionNativeLang": "母国語用語",
        "lbl.sec_r3_latency": "潜伏期間",
        "lbl.sec_r3_drugProductIds": "医薬品識別子（R3）",
        "lbl.sec_r3_mpidPhpid": "MPID / PhPID",
        "lbl.sec_r3_activeSubstances": "有効成分（R3）",
        "lbl.sec_r3_therapyTermIds": "療法TermID（R3）",
        "lbl.sec_r3_routeTermIds": "投与経路・剤形TermID",
        "lbl.sec_r3_relatednessLabellings": "関連性とラベリング（R3）",
        "lbl.e2bRegulatoryPurpose": "規制目的の一次情報源",
        "lbl.reporterCountryPractice": "実践国",
        "lbl.pharmaTermId": "医薬品剤形TermID",
        "lbl.pharmaTermIdVersion": "医薬品剤形TermIDバージョン",
        "lbl.routeTermId": "投与経路TermID",
        "lbl.routeTermIdVersion": "投与経路TermIDバージョン",
        "lbl.parentRouteAdmin": "親の投与経路",
        "lbl.clinicalDrugCode": "臨床薬コード（日本）",
        "lbl.sec_r2_caseHeader": "ケースヘッダー（R2）",
        "lbl.sec_r2_reportIdentification": "報告識別",
        "lbl.sec_r2_reportType": "報告種別と日付",
        "lbl.sec_r2_seriousness": "重篤性基準",
        "lbl.sec_r2_reporter": "報告者（R2）",
        "lbl.sec_r2_reporterQualification": "資格とFDA通知",
        "lbl.sec_r2_patient": "患者（R2）",
        "lbl.sec_r2_patientCore": "患者基本情報",
        "lbl.sec_r2_patientPhysical": "身体的特徴",
        "lbl.sec_r2_patientMedical": "医療背景",
        "lbl.sec_r2_patientDeath": "死亡/剖検",
        "lbl.sec_r2_patientRecords": "記録番号",
        "lbl.sec_r2_medicalHistory": "病歴（R2）",
        "lbl.sec_r2_pastDrugTherapies": "過去の薬物療法（R2）",
        "lbl.sec_r2_deathCauses": "死因（R2）",
        "lbl.sec_r2_parent": "親情報（R2）",
        "lbl.sec_r2_eventReactions": "事象/反応（R2）",
        "lbl.sec_r2_reactionCore": "反応詳細",
        "lbl.sec_r2_seriousnessCriteria": "重篤性基準",
        "lbl.sec_r2_drugProducts": "医薬品（R2）",
        "lbl.sec_r2_drugCore": "医薬品詳細",
        "lbl.sec_r2_drugIdentification": "製品識別",
        "lbl.sec_r2_drugDose": "用量",
        "lbl.sec_r2_drugAction": "措置/投与中止/再投与",
        "lbl.sec_r2_drugTherapy": "療法詳細",
        "lbl.sec_r2_drugRelatedness": "薬物-反応関連性",
        "lbl.sec_r2_study": "試験情報（R2）",
        "lbl.sec_r2_studyCore": "試験詳細",
        "lbl.sec_r2_studySubject": "被験者とサイト",
        "lbl.sec_r2_studyBlinding": "盲検/コード"
    }
}
')ON CONFLICT (NAME) DO NOTHING;



-- ICSR RENDER RULES
-- ============================================================
-- Sections:
--   500  Case Header          610  Drug Products
--   510  Documents            640  Lab Tests
--   515  Reporter             645  Literature (in 640 file)
--   520  Source               550  Pregnancy
--   530  Patient              560  Death Causes
--   535  Patient Summary      565  Parent
--   540  Medical History      580  Study
--   545  Past Drug Therapies  600  Event Reactions
-- ============================================================

-- ============================================================
-- APP_RULES — Render conditions for ICSR case header (500)
-- RULE_TYPE: RENDERER
-- RULE_EXPRESSION JSON:
--   logic: AND | OR
--   conditions: [{lhsFieldId, operator, rhsValue}]
--   expressions: [] (nested rule groups, empty for simple rules)
-- ============================================================


DELETE FROM APP_RULES WHERE MODULE_ID = 'ICSR';

INSERT INTO APP_RULES (
    ID, MODULE_ID,  RULE_ID, STATUS, IS_ACTIVE, IS_OOB,
    RULE_TYPE, TRIGGER_FIELDS, CONTEXT_PATH, RULE_EXPRESSION)
VALUES

-- ── Section 500_008 (Non-Case) — show when icsrFlag = Non-Relevant ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_NON_CASE_SECTION',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500042', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500042","operator":"eq","rhsValue":"02"}],"expressions":[]}'),

-- ── nullificationReason (500016) — show when caseNullification has value ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_NULLIFICATION_REASON',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500015', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500015","operator":"neq","rhsValue":""}],"expressions":[]}'),

-- ── regulatoryClockComment (500010) — show when regulatoryStartDate is set ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_REG_CLOCK_COMMENT',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500009', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500009","operator":"neq","rhsValue":""}],"expressions":[]}'),

-- ── batchUnblinding (500045) — show only for Pre-Market case type ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_BATCH_UNBLINDING',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500040', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500040","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- ── safetyManagerApprovalDate (500069) — show when safetyManager is set ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_SAFETY_MGR_DATE',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500068', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500068","operator":"neq","rhsValue":""}],"expressions":[]}'),

-- ── Follow-up fields (500055-500059) — show when followUp = Y ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_FOLLOWUP_FIELDS',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500054', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500054","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── noSuspectProduct (500104) — show when noProduct = N ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_NO_SUSPECT_PRODUCT',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500103', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500103","operator":"eq","rhsValue":"N"}],"expressions":[]}'),

-- ── Seriousness sub-flags (500022-500028) — show when seriousness = Y ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_SERIOUSNESS_FLAGS',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500021', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500021","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── SUSAR (500043) — show when reportClassificationCategory is SUSAR type ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_SUSAR_FIELD',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500037', '',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500037","operator":"in","rhsValue":["5004","5005","5006","5007","5018"]}],"expressions":[]}'),

-- ── isCaseAesi (500044) — show when reportType = study or spontaneous ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_AESI_FIELD',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500011', '',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500011","operator":"in","rhsValue":["1","2"]}],"expressions":[]}'),

-- ── Device fields (500092-500094) — show when reportCategory = product problem ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_DEVICE_FIELDS',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500036', '',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500036","operator":"in","rhsValue":["3","8"]}],"expressions":[]}'),

-- ── combinationProductReport (500095) — show for device/combination cases ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_COMBINATION_PRODUCT',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500036', '',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500036","operator":"in","rhsValue":["3","8"]}],"expressions":[]}'),

-- ── safetyReportType (500038) — show only for IND/US regulatory context ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_SAFETY_REPORT_TYPE',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500005', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500005","operator":"eq","rhsValue":"US"}],"expressions":[]}'),

-- ── Section 510_001 — show when additionalDoc (500014) = Y ───
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_DOCS_SECTION',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '500014', '',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500014","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── fileS3Path (510003) — readOnly, auto-populated on upload ─
(gen_random_uuid()::VARCHAR, 'ICSR', 'RULE_ICSR_DOC_S3PATH_READONLY',
    'PUBLISHED', 'Y', 'Y', 'RENDERER', '510001', 'caseDocuments$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"510001","operator":"neq","rhsValue":""}],"expressions":[{"targetFieldId":"510003","action":"setReadOnly","value":true}]}'),
	
-- ── e2bRegulatoryPurpose (515002) — R3 only, show when receive format = E2B R3 ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_E2B_REG_PURPOSE',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── reporterSentToFDA (515005) — show when primarySrcCountry = US ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REPORTER_SENT_FDA',
    'PUBLISHED','Y','Y','RENDERER','500005','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500005","operator":"eq","rhsValue":"US"}],"expressions":[]}'),

-- ── speciality (515015) — show when isHealthProf = Y ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REPORTER_SPECIALITY',
    'PUBLISHED','Y','Y','RENDERER','515013','reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"515013","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── hcpClassification (515016), otherHCP (515017) — show when isHealthProf = Y ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_HCP_CLASSIFICATION',
    'PUBLISHED','Y','Y','RENDERER','515013','reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"515013","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── literatureReference (515021) — show when reportType = study/literature ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_LIT_REFERENCE',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500011","operator":"in","rhsValue":["2","3"]}],"expressions":[]}'),

-- ── contact address fields — show when consentToContacts = Y ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REPORTER_ADDRESS',
    'PUBLISHED','Y','Y','RENDERER','515011','reporterInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"515011","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),
	
-- ── senderOrganisationType (520010) — R3 only ────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_SENDER_ORG_TYPE',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── identificationNo + referenceType — show when source is not spontaneous ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_SOURCE_REF_FIELDS',
    'PUBLISHED','Y','Y','RENDERER','520002','sourceInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"520002","operator":"notIn","rhsValue":["1"]}],"expressions":[]}'),

-- ── description — show when source = Other ───────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_SOURCE_DESCRIPTION',
    'PUBLISHED','Y','Y','RENDERER','520002','sourceInformations$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"520002","operator":"eq","rhsValue":"99"}],"expressions":[]}'),

-- ── patGenderOther (530015) — show when gender = Other ───────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_GENDER_OTHER',
    'PUBLISHED','Y','Y','RENDERER','530003','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530003","operator":"eq","rhsValue":"5"}],"expressions":[]}'),

-- ── LMP (530029) — show when patient is female ───────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_LMP',
    'PUBLISHED','Y','Y','RENDERER','530002','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530002","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── Pregnancy fields (530030-530032) — show when female ──────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_PREGNANCY',
    'PUBLISHED','Y','Y','RENDERER','530002','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530002","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── Death section (530_005) — show when death seriousness = Y ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_DEATH_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500022','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500022","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── Autopsy date (530039) — show when autopsy = Y ────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_AUTOPSY_DATE',
    'PUBLISHED','Y','Y','RENDERER','530038','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530038","operator":"eq","rhsValue":"Y"}],"expressions":[]}'),

-- ── Contact section (530_006) — show when consentToContact = Y ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_CONTACT_SECTION',
    'PUBLISHED','Y','Y','RENDERER','530018','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530018","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- ── Vaccine section (530_008) — show when report involves vaccine ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_VACCINE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── Biological father section (530_009) — show when patient is female and pregnant ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_BIO_FATHER_SECTION',
    'PUBLISHED','Y','Y','RENDERER','530030','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530030","operator":"eq","rhsValue":"1"},{"lhsFieldId":"530002","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── militaryStatus (530020) — show when primarySrcCountry = US ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_MILITARY',
    'PUBLISHED','Y','Y','RENDERER','500005','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500005","operator":"eq","rhsValue":"US"}],"expressions":[]}'),

-- ── birthWeight (530025-530026) — show when ageGroup = Neonate/Foetus ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAT_BIRTH_WEIGHT',
    'PUBLISHED','Y','Y','RENDERER','530007','',
    '{"logic":"OR","conditions":[{"lhsFieldId":"530007","operator":"in","rhsValue":["0","1"]}],"expressions":[]}'),

-- ── Corrective actions section — show for device/product problem cases ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_SUMMARY_CORRECTIVE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500036','',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500036","operator":"in","rhsValue":["3","8"]}],"expressions":[]}'),

-- ── summaryDescription (535004) — R3 only ────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_SUMMARY_DESC_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── additionalManufacturerNarrative (535013) — show for follow-up reports ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_ADD_MFR_NARRATIVE',
    'PUBLISHED','Y','Y','RENDERER','500041','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500041","operator":"eq","rhsValue":"02"}],"expressions":[]}'),

-- ── correctedData (535017) — show for follow-up / amendment reports ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_CORRECTED_DATA',
    'PUBLISHED','Y','Y','RENDERER','500041','',
    '{"logic":"OR","conditions":[{"lhsFieldId":"500041","operator":"eq","rhsValue":"02"},{"lhsFieldId":"500015","operator":"neq","rhsValue":""}],"expressions":[]}'),

-- ── medicalEpisodeLLT (540002) — show when codingType = Dictionary/Intelligent ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_MED_HIST_LLT',
    'PUBLISHED','Y','Y','RENDERER','540013','patient.patientMedicalHistory$',
    '{"logic":"OR","conditions":[{"lhsFieldId":"540013","operator":"in","rhsValue":["A","I"]}],"expressions":[]}'),

-- ── medicalHistoryPT (540003) — R3 only ──────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_MED_HIST_PT_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── familyHistory (540009) — R3 only ─────────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_MED_HIST_FAMILY_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── illnessAtVaccination (540010) — show for vaccine report type ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_MED_HIST_VACCINE',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── medicalEndDate (540005) — show when medicalContinue = N ──
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_MED_HIST_END_DATE',
    'PUBLISHED','Y','Y','RENDERER','540006','patient.patientMedicalHistory$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"540006","operator":"eq","rhsValue":"N"}],"expressions":[]}'),

-- ── Substance sub-section (546) — R3 only ────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAST_DRUG_SUBSTANCE_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── MPID/PhPID fields (545015-545019) — R3 only ──────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAST_DRUG_PRODID_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── Vaccine age fields (545022-545023) — vaccine cases only ──
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAST_DRUG_VACCINE',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── PT codes (545011, 545014) — R3 only ──────────────────────
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAST_DRUG_PT_R3',
    'PUBLISHED','Y','Y','RENDERER','500071','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500071","operator":"eq","rhsValue":"17"}],"expressions":[]}'),

-- ── Whole pregnancy section — show when patient is female and pregnant ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PREGNANCY_SECTION',
    'PUBLISHED','Y','Y','RENDERER','530030','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530030","operator":"eq","rhsValue":"1"},{"lhsFieldId":"530002","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- ── contraceptiveFailure (550010) — show when contraceptivesUsed = true ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PREG_CONTRACEPTIVE_FAILURE',
    'PUBLISHED','Y','Y','RENDERER','550009','patient.pregnancy',
    '{"logic":"AND","conditions":[{"lhsFieldId":"550009","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- ── typesOfContraceptives (550011) — show when contraceptivesUsed = true ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PREG_CONTRACEPTIVE_TYPES',
    'PUBLISHED','Y','Y','RENDERER','550009','patient.pregnancy',
    '{"logic":"AND","conditions":[{"lhsFieldId":"550009","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- ── congenitalAnomalyType (555009) — show when congenitalAnomaly = true ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_NEONATE_ANOMALY_SECTION',
    'PUBLISHED','Y','Y','RENDERER','555008','patient.pregnancy.pregnancyOutcomes$.neonates$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"555008","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- ── NICU details (555014-555016) — show when nicuAdmission = true ─
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_NEONATE_NICU_SECTION',
    'PUBLISHED','Y','Y','RENDERER','555013','patient.pregnancy.pregnancyOutcomes$.neonates$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"555013","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Whole parent section â€” show when patient is female and pregnant â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PARENT_SECTION',
    'PUBLISHED','Y','Y','RENDERER','530030','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"530030","operator":"eq","rhsValue":"1"},{"lhsFieldId":"530002","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ Vaccine section â€” show when report type is vaccine â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PARENT_VACCINE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ Parent med hist end date â€” show when medicalContinue = N â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_PAR_MED_HIST_END_DATE',
    'PUBLISHED','Y','Y','RENDERER','575003','patient.parent.parentMedHistEpisodeCollection$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"575003","operator":"eq","rhsValue":"N"}],"expressions":[]}'),

-- â”€â”€ Study section â€” show when report type = study (code 2) â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_STUDY_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ studyDiscontReason â€” show when completionStatus = prematurely ended â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_STUDY_DISCONT_REASON',
    'PUBLISHED','Y','Y','RENDERER','580029','study',
    '{"logic":"AND","conditions":[{"lhsFieldId":"580029","operator":"eq","rhsValue":"3"}],"expressions":[]}'),

-- â”€â”€ dateCodeBroken â€” show when codeBroken = CODE_BROKEN â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_STUDY_CODE_BROKEN_DATE',
    'PUBLISHED','Y','Y','RENDERER','580002','study',
    '{"logic":"AND","conditions":[{"lhsFieldId":"580002","operator":"eq","rhsValue":"CODE_BROKEN"}],"expressions":[]}'),

-- â”€â”€ unblindedInformation â€” show when studyCodeBroken = CODE_BROKEN â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_STUDY_UNBLINDED_INFO',
    'PUBLISHED','Y','Y','RENDERER','580028','study',
    '{"logic":"AND","conditions":[{"lhsFieldId":"580028","operator":"eq","rhsValue":"CODE_BROKEN"}],"expressions":[]}'),

-- â”€â”€ EU CT transition date â€” show when euctRegulation = true â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_STUDY_EUCT_DATE',
    'PUBLISHED','Y','Y','RENDERER','580008','study',
    '{"logic":"AND","conditions":[{"lhsFieldId":"580008","operator":"eq","rhsValue":"1"}],"expressions":[]}'),
	
-- â”€â”€ Hospitalization dates â€” show when hospitalization = true â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_HOSPITALIZATION',
    'PUBLISHED','Y','Y','RENDERER','600033','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600033","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Vaccine reaction section â€” show when report type = vaccine â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_VACCINE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ Device sections â€” show when report involves device â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_DEVICE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"in","rhsValue":["3","4"]}],"expressions":[]}'),

-- â”€â”€ otherCauseAeDetails â€” show when causeOfAe = Other â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_OTHER_CAUSE',
    'PUBLISHED','Y','Y','RENDERER','600005','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600005","operator":"eq","rhsValue":"5"}],"expressions":[]}'),

-- â”€â”€ otherMedImportantInfo â€” show when nonserious = true â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_NONSERIOUS_INFO',
    'PUBLISHED','Y','Y','RENDERER','600040','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600040","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ treatmentDescription â€” show when treatmentPerformed = Yes â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_TREATMENT_DESC',
    'PUBLISHED','Y','Y','RENDERER','600049','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600049","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ countryDetectionManual â€” show when countryOfDetection = manual â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_COUNTRY_MANUAL',
    'PUBLISHED','Y','Y','RENDERER','600010','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600010","operator":"eq","rhsValue":"MANUAL"}],"expressions":[]}'),

-- â”€â”€ reactionSiteText â€” show when reactionSite = Other â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_REACT_SITE_TEXT',
    'PUBLISHED','Y','Y','RENDERER','600028','eventReactions$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"600028","operator":"eq","rhsValue":"4"}],"expressions":[]}'),

-- â”€â”€ Vaccine: noOfDaysHospitalized â€” show when hospitalRequired = true â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_VAC_HOSP_DAYS',
    'PUBLISHED','Y','Y','RENDERER','602007','eventReactions$.reactionVaccine',
    '{"logic":"AND","conditions":[{"lhsFieldId":"602007","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Vaccine therapy section â€” show when report type = vaccine â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DRUG_VACCINE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','500011','',
    '{"logic":"AND","conditions":[{"lhsFieldId":"500011","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ Device section â€” show when product type = device â”€â”€â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DRUG_DEVICE_SECTION',
    'PUBLISHED','Y','Y','RENDERER','610051','drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610051","operator":"eq","rhsValue":"DEVICE"}],"expressions":[]}'),

-- â”€â”€ productReferralComments â€” show when referral required = Y â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DRUG_REFERRAL_COMMENTS',
    'PUBLISHED','Y','Y','RENDERER','610056','drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610056","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Dechallenge result â€” show when action = drug withdrawn or dose reduced â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DRUG_DECHALLENGE',
    'PUBLISHED','Y','Y','RENDERER','610001','drugProducts$',
    '{"logic":"OR","conditions":[{"lhsFieldId":"610001","operator":"in","rhsValue":["1","2"]}],"expressions":[]}'),

-- â”€â”€ Rechallenge result â€” show when dechallenge = yes abated â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DRUG_RECHALLENGE',
    'PUBLISHED','Y','Y','RENDERER','610017','drugProducts$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"610017","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Device evaluation reason â€” show when evaluated = No â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DEVICE_EVAL_REASON',
    'PUBLISHED','Y','Y','RENDERER','625022','drugProducts$.productDevices$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"625022","operator":"eq","rhsValue":"2"}],"expressions":[]}'),

-- â”€â”€ Remedial action other â€” show when remedial = Other â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DEVICE_REMEDIAL_OTHER',
    'PUBLISHED','Y','Y','RENDERER','625068','drugProducts$.productDevices$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"625068","operator":"eq","rhsValue":"5"}],"expressions":[]}'),

-- â”€â”€ FDA report date â€” show when reportSentToFda = true â”€â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DEVICE_FDA_DATE',
    'PUBLISHED','Y','Y','RENDERER','625069','drugProducts$.productDevices$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"625069","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Manufacturer report date â€” show when reportSentToManuf = true â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_DEVICE_MANUF_DATE',
    'PUBLISHED','Y','Y','RENDERER','625070','drugProducts$.productDevices$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"625070","operator":"eq","rhsValue":"1"}],"expressions":[]}'),

-- â”€â”€ Causality procedure â€” show when companyCausality is set â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_RELATEDNESS_CAUSALITY_PROC',
    'PUBLISHED','Y','Y','RENDERER','635008','drugProducts$.drugReactionRelatednes$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"635008","operator":"notNull","rhsValue":""}],"expressions":[]}'),

-- â”€â”€ Reason for listedness â€” show when listed = Unlisted â”€â”€â”€â”€â”€â”€
(gen_random_uuid()::VARCHAR,'ICSR','RULE_ICSR_LABELLING_REASON',
    'PUBLISHED','Y','Y','RENDERER','636003','drugProducts$.drugReactionRelatednes$.drugReactionLabellings$',
    '{"logic":"AND","conditions":[{"lhsFieldId":"636003","operator":"eq","rhsValue":"2"}],"expressions":[]}')

ON CONFLICT (MODULE_ID,  RULE_ID) DO NOTHING;
