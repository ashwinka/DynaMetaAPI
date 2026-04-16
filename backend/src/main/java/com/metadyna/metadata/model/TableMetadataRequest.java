package com.metadyna.metadata.model;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableMetadataRequest {

    @NotBlank @Size(max = 300)
    private String moduleId;

    @NotBlank @Size(max = 100)
    private String tableId;

    @Size(max = 100)
    private String parentTableId;

    @NotBlank @Size(max = 100)
    private String dbTableName;

    @NotBlank @Size(max = 100)
    private String contextName;

    @Size(max = 100)
    private String joinColumn;

    @Size(max = 100)
    private String refJoinColumn;

    @Pattern(regexp = "Y|N")
    private String multiContext = "N";

    @Size(max = 1000)
    private String contextPath;
}
