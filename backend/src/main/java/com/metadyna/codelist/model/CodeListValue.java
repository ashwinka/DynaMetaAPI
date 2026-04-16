package com.metadyna.codelist.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class CodeListValue {
    private String id;
    private String codeListId;
    private String code;
    private String decode;
    /** JSON object keyed by ISO language code, e.g. {"en":"Active","fr":"Actif"} */
    private java.util.Map<String, String> translations;
    private int sequence;
    private String isActive;
}
