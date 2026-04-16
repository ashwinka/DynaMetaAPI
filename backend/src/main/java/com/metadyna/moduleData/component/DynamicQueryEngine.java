package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.SearchCriteria;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Facade delegating to focused query engine components:
 *  - ListingQueryEngine     — dynamic listing queries
 *  - RecordFetchQueryEngine — optimised single-record and child-row fetches
 */
@Component
@RequiredArgsConstructor
public class DynamicQueryEngine {

    private final ListingQueryEngine listingQueryEngine;
    private final RecordFetchQueryEngine recordFetchQueryEngine;

    // ── Listing ───────────────────────────────────────────────────────────────

    public ListingQueryEngine.ListingResult moduleDataListing(
            ModuleMetadata metadata, SearchCriteria criteria, JdbcTemplate jdbc) {
        return listingQueryEngine.execute(metadata, criteria, jdbc);
    }

    // ── Optimised single-record fetch (root + non-multi-context spine in one query) ──

    public Optional<Map<String, Object>> fetchFlatRecord(
            ModuleMetadata metadata, String id, JdbcTemplate jdbc) {
        return recordFetchQueryEngine.fetchFlatRecord(metadata, id, jdbc);
    }

    // ── Multi-context (array) table fetch ─────────────────────────────────────

    public List<Map<String, Object>> fetchMultiContextRows(
            TableMetadata table, String fromClause, String whereClause, List<String> joinClause,
            ModuleMetadata metadata, String parentId, JdbcTemplate jdbc) {
        return recordFetchQueryEngine.fetchMultiContextRows(table, fromClause, whereClause, joinClause, metadata, parentId, jdbc);
    }

    // ── Legacy single-table fetches (used by delete cascade) ─────────────────

    public Optional<Map<String, Object>> fetchBaseDataRecord(
            String id, TableMetadata table, ModuleMetadata metadata, JdbcTemplate jdbc) {
        return recordFetchQueryEngine.fetchRootRow(table, metadata, id, jdbc);
    }

    public List<Map<String, Object>> fetchChildRows(
            TableMetadata table, ModuleMetadata metadata, String parentId, JdbcTemplate jdbc) {
        return recordFetchQueryEngine.fetchChildRows(table, metadata, parentId, jdbc);
    }
}
