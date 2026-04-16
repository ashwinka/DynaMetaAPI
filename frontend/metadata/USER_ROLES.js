(()=>{	
	window.offline_metadata = {
	  "formMetadata": {
		  "module": "USER_ROLES",
		  "FORMS": {
			"SIMPLE_FORM": {
			  "formID": "SIMPLE_FORM",
			  "formName": "User Role",
			  "version": "1.0",
			  "layout": {
				"recordTitleField": "roleName",
				"enableFilterSection": false,
				"navigationWidth": "240px",
				"formPanelWidth": "80%",
				"responsive": {
				  "webFieldsPerRow": 3,
				  "tabletFieldsPerRow": 2,
				  "mobileFieldsPerRow": 1
				}
			  },
			  "formHeaderActions": [
				{
				  "actionId": "save",
				  "label": "Save",
				  "icon": "save",
				  "type": "standard"
				},
				{
				  "actionId": "cancel",
				  "label": "Cancel",
				  "icon": "close"
				},
				{
				  "actionId": "formSummary",
				  "label": "Form Summary",
				  "icon": "summary",
				  "type": "moreAction"
				}
			  ],
			  "sections": [
				{
				  "sectionId": "rol_1",
				  "title": "Role",
				  "sequence": 1,
				  "multiContext": false,
				  "sections": [
					{
					  "sectionId": "rol_1_1",
					  "title": "Role Details",
					  "sequence": 1,
					  "multiContext": false,
					  "tabPanel": true,
					  "fields": [
						{
						  "fieldId": "rol_f01",
						  "label": "Role Code",
						  "fieldPath": "roleCode",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "rol_f02",
						  "label": "Role Name",
						  "fieldPath": "roleName",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 2
						},
						{
						  "fieldId": "rol_f03",
						  "label": "Description",
						  "fieldPath": "description",
						  "dataType": "text",
						  "renderAs": "textarea",
						  "fieldWidth": 3,
						  "maxLen": 1000
						},
						{
						  "fieldId": "rol_f04",
						  "label": "Active",
						  "fieldPath": "isActive",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						},
						{
						  "fieldId": "rol_f05",
						  "label": "User Count",
						  "fieldPath": "userCount",
						  "dataType": "text",
						  "renderAs": "text",
						  "fieldWidth": 1
						},
						{
						  "fieldId": "rol_f06",
						  "label": "System Role",
						  "fieldPath": "isSystem",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "codelist": "YES_NO"
						}
					  ]
					},
					{
					  "sectionId": "rol_1_2",
					  "title": "Permissions",
					  "sequence": 2,
					  "multiContext": true,
					  "contextPath": "permissions$",
					  "editableGrid": true,
					  "tabPanel": true,
					  "dataGridConfig": {
						"allowAdd": true,
						"allowDelete": true,
						"allowCopy": false,
						"pagination": true,
						"pageSizeOptions": [
						  5,
						  10,
						  25
						]
					  },
					  "fields": [
						{
						  "fieldId": "rol_f10",
						  "label": "Module",
						  "fieldPath": "permissions$.module",
						  "dataType": "text",
						  "renderAs": "combo",
						  "fieldWidth": 1,
						  "allowSorting": true,
						  "columnSize": "16ch",
						  "codelist": "PERM_MODULE"
						},
						{
						  "fieldId": "rol_f11",
						  "label": "Action",
						  "fieldPath": "permissions$.action",
						  "dataType": "text",
						  "renderAs": "combo",
						  "fieldWidth": 1,
						  "allowSorting": true,
						  "columnSize": "14ch",
						  "codelist": "PERM_ACTION"
						},
						{
						  "fieldId": "rol_f12",
						  "label": "Granted",
						  "fieldPath": "permissions$.granted",
						  "dataType": "text",
						  "renderAs": "radio",
						  "fieldWidth": 1,
						  "allowSorting": true,
						  "columnSize": "10ch",
						  "codelist": "YES_NO"
						}
					  ],
					  "gridFields": [
						{
						  "fieldId": "rol_f10",
						  "label": "Module",
						  "fieldPath": "permissions$.module",
						  "dataType": "text",
						  "renderAs": "combo",
						  "allowSorting": true,
						  "columnSize": "16ch",
						  "codelist": "PERM_MODULE"
						},
						{
						  "fieldId": "rol_f11",
						  "label": "Action",
						  "fieldPath": "permissions$.action",
						  "dataType": "text",
						  "renderAs": "combo",
						  "allowSorting": true,
						  "columnSize": "14ch",
						  "codelist": "PERM_ACTION"
						},
						{
						  "fieldId": "rol_f12",
						  "label": "Granted",
						  "fieldPath": "permissions$.granted",
						  "dataType": "text",
						  "renderAs": "radio",
						  "allowSorting": true,
						  "columnSize": "10ch",
						  "codelist": "YES_NO"
						}
					  ]
					}
				  ]
				}
			  ]
			}
		  }
		},
	  "listingMetadata": {
		"module": "USER_ROLES",
		"title": "User Roles",
		"FILTERS_FIELDS": [
		  {
			"fieldId": "rol_name",
			"label": "Role Name",
			"fieldPath": "roleName",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "rol_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "combo",
			"codelist": "YES_NO",
			"fieldWidth": 1
		  }
		],
		"GRID_FIELDS": [
		  {
			"fieldId": "rol_id",
			"label": "Role Code",
			"fieldPath": "roleCode",
			"renderAs": "text",
			"allowSorting": true,
			"width": "14ch",
			"primaryKey": true
		  },
		  {
			"fieldId": "rol_name",
			"label": "Role Name",
			"fieldPath": "roleName",
			"renderAs": "text",
			"allowSorting": true,
			"width": "20ch"
		  },
		  {
			"fieldId": "rol_desc",
			"label": "Description",
			"fieldPath": "description",
			"renderAs": "text",
			"allowSorting": false,
			"width": "30ch"
		  },
		  {
			"fieldId": "rol_users",
			"label": "Users",
			"fieldPath": "userCount",
			"renderAs": "text",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  },
		  {
			"fieldId": "rol_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "yesno",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  }
		],
		"DASHBOARD_WIDGETS": [
		  {
			"widgetId": "totalRoles",
			"label": "Total Roles",
			"iconColor": "blue",
			"icon": "M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2",
			"filters": []
		  },
		  {
			"widgetId": "activeRoles",
			"label": "Active Roles",
			"iconColor": "green",
			"icon": "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z",
			"filters": [
			  {
				"field": "isActive",
				"operator": "eq",
				"value": "true"
			  }
			]
		  }
		]
	  },
	  "lookupMetadata": {
		"module": "USER_ROLES",
		"title": "User Roles",
		"FILTERS_FIELDS": [
		  {
			"fieldId": "rol_name",
			"label": "Role Name",
			"fieldPath": "roleName",
			"renderAs": "text",
			"fieldWidth": 1
		  },
		  {
			"fieldId": "rol_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "combo",
			"codelist": "YES_NO",
			"fieldWidth": 1
		  }
		],
		"GRID_FIELDS": [
		  {
			"fieldId": "rol_id",
			"label": "Role Code",
			"fieldPath": "roleCode",
			"renderAs": "text",
			"allowSorting": true,
			"width": "14ch",
			"primaryKey": true
		  },
		  {
			"fieldId": "rol_name",
			"label": "Role Name",
			"fieldPath": "roleName",
			"renderAs": "text",
			"allowSorting": true,
			"width": "20ch"
		  },
		  {
			"fieldId": "rol_desc",
			"label": "Description",
			"fieldPath": "description",
			"renderAs": "text",
			"allowSorting": false,
			"width": "30ch"
		  },
		  {
			"fieldId": "rol_users",
			"label": "Users",
			"fieldPath": "userCount",
			"renderAs": "text",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  },
		  {
			"fieldId": "rol_active",
			"label": "Active",
			"fieldPath": "isActive",
			"renderAs": "yesno",
			"allowSorting": true,
			"width": "8ch",
			"align": "center"
		  }
		]
	  },"i18nTrans": {
		"en": {}
	  }
	}
})();
