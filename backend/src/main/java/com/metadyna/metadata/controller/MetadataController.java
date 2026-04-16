package com.metadyna.metadata.controller;

import com.metadyna.common.model.ApiResponse;
import com.metadyna.common.security.PrivilegeChecker;
import com.metadyna.metadata.model.*;
import com.metadyna.metadata.service.MetadataService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/metadata")
@RequiredArgsConstructor
@Tag(name = "Metadata Management", description = "TABLE_METADATA, TABLE_COLUMN_METADATA, UI_METADATA CRUD")
public class MetadataController {

    private final MetadataService metadataService;
    private final PrivilegeChecker privilegeChecker;

    // ── Table Metadata ────────────────────────────────────────────────────────

    @PostMapping("/tables")
    @Operation(summary = "Create or update table metadata")
    public ResponseEntity<ApiResponse<TableMetadata>> saveTable(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @Valid @RequestBody TableMetadataRequest request) {
        privilegeChecker.requireWrite(request.getModuleId());
        return ResponseEntity.ok(ApiResponse.ok(metadataService.saveTableMetadata(request, tenantId), null));
    }

    @GetMapping("/tables/{moduleId}")
    @Operation(summary = "Get all table metadata for a module")
    public ResponseEntity<ApiResponse<List<TableMetadata>>> getTables(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getTableMetadata(moduleId, tenantId), null));
    }

    @DeleteMapping("/tables/{moduleId}/{tableId}")
    @Operation(summary = "Delete table metadata")
    public ResponseEntity<ApiResponse<Void>> deleteTable(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String tableId) {
        privilegeChecker.requireWrite(moduleId);
        metadataService.deleteTableMetadata(moduleId, tableId, tenantId);
        return ResponseEntity.ok(ApiResponse.ok(null, null));
    }

    // ── Column Metadata ───────────────────────────────────────────────────────

    @PostMapping("/columns")
    @Operation(summary = "Create or update column metadata")
    public ResponseEntity<ApiResponse<ColumnMetadata>> saveColumn(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @Valid @RequestBody ColumnMetadataRequest request) {
        privilegeChecker.requireWrite(request.getModuleId());
        return ResponseEntity.ok(ApiResponse.ok(metadataService.saveColumnMetadata(request, tenantId), null));
    }

    @GetMapping("/columns/{moduleId}/{tableId}")
    @Operation(summary = "Get column metadata for a table")
    public ResponseEntity<ApiResponse<List<ColumnMetadata>>> getColumns(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String tableId) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getColumnMetadata(moduleId, tableId, tenantId), null));
    }

    @DeleteMapping("/columns/{moduleId}/{tableId}/{fieldId}")
    @Operation(summary = "Delete column metadata")
    public ResponseEntity<ApiResponse<Void>> deleteColumn(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String tableId,
            @PathVariable String fieldId) {
        privilegeChecker.requireWrite(moduleId);
        metadataService.deleteColumnMetadata(moduleId, tableId, fieldId, tenantId);
        return ResponseEntity.ok(ApiResponse.ok(null, null));
    }

    // ── UI Metadata ───────────────────────────────────────────────────────────

    @PostMapping("/ui")
    @Operation(summary = "Create or update UI metadata (LISTING / FORM / LOOKUP / I18N)")
    public ResponseEntity<ApiResponse<UiMetadata>> saveUi(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @Valid @RequestBody UiMetadataRequest request) {
        privilegeChecker.requireWrite(request.getModuleId());
        return ResponseEntity.ok(ApiResponse.ok(metadataService.saveUiMetadata(request, tenantId), null));
    }

    @GetMapping("/ui/{moduleId}")
    @Operation(summary = "Get structured UI metadata bundle for a module")
    public ResponseEntity<ApiResponse<UiMetadataBundle>> getAllUi(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getUiMetadataBundle(moduleId, tenantId), null));
    }

    @GetMapping("/ui/{moduleId}/full")
    @Operation(summary = "Get UI metadata bundle + complete codelist registry for a module")
    public ResponseEntity<ApiResponse<UiMetadataBundle>> getFullUi(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getUiMetadataWithCodelists(moduleId, tenantId), null));
    }

    @GetMapping("/ui/{moduleId}/{type}")
    @Operation(summary = "Get UI metadata by module and type")
    public ResponseEntity<ApiResponse<UiMetadata>> getUi(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String type) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getUiMetadata(moduleId, type, tenantId), null));
    }

    @DeleteMapping("/ui/{moduleId}/{type}")
    @Operation(summary = "Delete UI metadata")
    public ResponseEntity<ApiResponse<Void>> deleteUi(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @PathVariable String type) {
        privilegeChecker.requireWrite(moduleId);
        metadataService.deleteUiMetadata(moduleId, type, tenantId);
        return ResponseEntity.ok(ApiResponse.ok(null, null));
    }

    // ── I18N ──────────────────────────────────────────────────────────────────

    @GetMapping("/ui/{moduleId}/i18n")
    @Operation(summary = "Get flat i18n key-value map for a module and locale")
    public ResponseEntity<ApiResponse<Map<String, String>>> getI18n(
            @RequestHeader("X-Tenant-ID") String tenantId,
            @PathVariable String moduleId,
            @RequestParam(defaultValue = "en") String lang) {
        privilegeChecker.requireRead(moduleId);
        return ResponseEntity.ok(ApiResponse.ok(metadataService.getI18n(moduleId, lang, tenantId), null));
    }
}
