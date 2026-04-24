package com.metadyna.metadata.model;

import com.fasterxml.jackson.databind.JsonNode;
import lombok.Builder;
import lombok.Getter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Builder
public class UiMetadataBundle {

    private Map<String, Object> formMetadata = new HashMap<>();
    private JsonNode listingMetadata;
    private JsonNode lookupMetadata;
    private JsonNode i18nTrans;
    private List<ColumnMetadata> fields = new ArrayList<>();
    private List<AppRules> renderRules = new ArrayList<>();
    private Map<String, List<Map<String, Object>>> codeLists = new HashMap<>();

    public void setCodelists(Map<String, List<Map<String, Object>>> codeLists){
        this.codeLists = codeLists;
    }
}
