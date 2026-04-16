package com.metadyna.moduleData.model;

import lombok.Builder;
import lombok.Getter;

import java.util.Map;

/**
 * Represents a single DML operation to be executed by DynamicSaveEngine.
 * Operations are ordered: root table first, children after.
 */
@Getter
@Builder
public class TableOperation {

    public enum OperationType { INSERT, UPDATE, DELETE }

    /** The physical DB table name */
    private String dbTableName;

    /** TABLE_METADATA.TABLE_ID — used for FK resolution */
    private String tableId;

    /** TABLE_METADATA.TABLE_ID of the parent — used to resolve FK value */
    private String parentCtxObjId;

    /** The column in this table that holds the FK to the parent's ID */
    private String joinColumn;

    /** The operation to perform */
    private OperationType operationType;

    /**
     * Column name → value pairs for INSERT / UPDATE.
     * For DELETE, only ID is needed.
     */
    private Map<String, Object> columnValues;

    /**
     * String UUID of the existing row — present for UPDATE and DELETE.
     * Null for INSERT.
     */
    private String id;
}
