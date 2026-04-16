package com.metadyna.metadata.model;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ColumnMetadata {
    private String id;
    private String moduleId;
    private String tableId;
    private String fieldId;
    private String columnName;
    private String fieldName;
    /** Dot-notation path; $ suffix on a segment = multi-context (array) node */
    private String fieldPath;
    private String dataType; //TEXT/NUMERIC/DATE/FILE/JSON
    private Integer maxLength;
    private String requiredField;  // 'Y' or 'N'
    private String listingAlias;
    private String label;
    private String description;
    private String labelInfo;
    private String uiMetadata; //JSON metadata
   /* {
        render_as: "text/textarea/numeric/date/combo/ms-combo/radio/checkbox/bool-switch/lookup/ms-lookup/type-ahead/html-editor"
		codelist: "codelist id",
		dataValues:["instead of code list, a static data values array with code and decode can be maintained."],
		lookupModule:"module ID of the reference module",
			storeValField: "data json field name where the store value for lookup needs to be stores",
			lkpStoreField: "field name of lookup records which is used for store value",
			lkpDispField: "field name of lookup records which is used for display value",
			storeFormat:"JSON/TEXT"

		nfField:"Y", nfCodelist:"", nfDataValues:[]
		sfField:"Y",
		partDateFmt:"mm-yyyy/yyyy"
		}
	*/

}
