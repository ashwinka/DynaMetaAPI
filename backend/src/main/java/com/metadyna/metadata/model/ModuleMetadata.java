package com.metadyna.metadata.model;

import lombok.Builder;
import lombok.Getter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Aggregate model combining TABLE_METADATA + TABLE_COLUMN_METADATA for a module.
 * Used by the Dynamic Engine (Unit 06) — loaded from MetadataCache or DB.
 */
@Getter
@Builder
public class ModuleMetadata {
    private String moduleId;
    private List<TableMetadata> tables;
    private List<ColumnMetadata> columns;

    /** Quick lookup: tableId → TableMetadata */
    private Map<String, TableMetadata> tableIndex;

    /** Quick lookup: tableId → list of ColumnMetadata */
    private Map<String, List<ColumnMetadata>> columnIndex;

    /** Quick lookup: tableId → list of ColumnMetadata */
    private Map<String, List<TableMetadata>> tableIndexByParent;

    /** Root table (the one with no parentTableId) */
    public TableMetadata getRootTable() {
        return tables.stream()
                .filter(t -> t.getParentTableId() == null || t.getParentTableId().isBlank())
                .findFirst()
                .orElse(tables.isEmpty() ? null : tables.get(0));
    }

    /** Direct children of a given tableId */
    public List<TableMetadata> getChildren(String tableId) {
        return tableIndexByParent.get(tableId) != null ? tableIndexByParent.get(tableId) : new ArrayList<>();
    }
}
