package com.metadyna.metadata.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ColumnMetadataRequest {

    @NotBlank @Size(max = 300)
    private String moduleId;

    @NotBlank @Size(max = 300)
    private String tableId;

    @NotBlank @Size(max = 300)
    private String fieldId;

    @NotBlank @Size(max = 300)
    private String columnName;

    @NotBlank @Size(max = 300)
    private String contextName;

    /**
     * Dot-notation field path.
     * Single-context:  aerInfo.patient.patName
     * Multi-context:   aerInfo.reactions$.reportedTerm
     * $ suffix on a segment indicates a multi-context (array) node.
     */
    @Size(max = 1000)
    private String fieldPath;

    @NotBlank
    @Pattern(regexp = "TEXT|NUMBER|DATE|DATETIME")
    private String dataType;

    private Integer maxLength;

    @Pattern(regexp = "Y|N")
    private String requiredField = "N";

    @Size(max = 300)
    private String listingAlias;
}
