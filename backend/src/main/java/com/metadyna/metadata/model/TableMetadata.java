package com.metadyna.metadata.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class TableMetadata {
    private String id;
    private String moduleId;
    private String tableId;
    private String parentTableId;
    private String dbTableName;
    private String contextName;
    private String joinColumn;
    private String refJoinColumn;
    private String multiContext;   // 'Y' or 'N'
    private String contextPath;
}
