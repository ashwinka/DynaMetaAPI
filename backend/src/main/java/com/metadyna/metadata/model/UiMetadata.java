package com.metadyna.metadata.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class UiMetadata {
    private String id;
    private String moduleId;
    private String name;
    /** LISTING | FORM | LOOKUP | I18N */
    private String type;
    private String metadataJson;
    private String s3Path;
    private String createdAt;
    private String updatedAt;
}
