package com.metadyna.moduleData.component;

import com.metadyna.moduleData.model.SearchCondition;
import com.metadyna.moduleData.model.SearchCriteria;
import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import com.metadyna.metadata.model.TableMetadata;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/**
 * Unit tests for ListingQueryEngine SQL generation.
 *
 * Metadata mirrors ListingQueryEngineTestCase.txt:
 *
 *   101  ICSR_CASES      (root, N)
 *   106  ICSR_AER_INFO   (parent=101, N,  JOIN=CASE_REC_ID, REF=ID)
 *   111  ICSR_PATIENT    (parent=106, N,  JOIN=AER_REC_ID,  REF=ID)
 *   112  ICSR_MED_HIST   (parent=111, N,  JOIN=PAT_REC_ID,  REF=ID)  ← $ in FIELD_PATH only
 *   116  ICSR_STUDY      (parent=106, N,  JOIN=AER_REC_ID,  REF=ID)
 *   121  ICSR_EVENTS     (parent=106, Y,  JOIN=AER_REC_ID,  REF=ID)
 *   126  ICSR_DRUGS      (parent=106, Y,  JOIN=AER_REC_ID,  REF=ID)
 *   131  ICSR_DRUG_IND   (parent=126, Y,  JOIN=DRUG_REC_ID, REF=ID)
 */
class ListingQueryEngineTest {

    private ListingQueryEngine engine;
    private JdbcTemplate jdbc;
    private ModuleMetadata metadata;

    // ── Table constants ───────────────────────────────────────────────────────
    private static final String T_ROOT    = "101";
    private static final String T_AER     = "106";
    private static final String T_PAT     = "111";
    private static final String T_MEDHIST = "112";
    private static final String T_STUDY   = "116";
    private static final String T_EVENTS  = "121";
    private static final String T_DRUGS   = "126";
    private static final String T_DRUGIND = "131";

    @BeforeEach
    void setUp() {
        engine = new ListingQueryEngine();
        jdbc   = mock(JdbcTemplate.class);

        // Default mock returns so execute() doesn't NPE
        when(jdbc.queryForList(anyString(), any(Object[].class)))
                .thenReturn(List.of());
        when(jdbc.queryForObject(anyString(), eq(Long.class), any(Object[].class)))
                .thenReturn(0L);

        metadata = buildIcsrMetadata();
    }

    // ── Test Case from ListingQueryEngineTestCase.txt ─────────────────────────

    @Test
    @DisplayName("TC-01: listing columns + non-multi-context condition + multi-context (medHist$) condition")
    void testListingWithMedHistMultiContextCondition() {
        SearchCriteria criteria = new SearchCriteria();
        criteria.setListingColumns(List.of("caseId", "aerInfo.lrd", "aerInfo.patient.patName"));
        criteria.setSortFieldId("aerInfo.lrd");
        criteria.setConditions(List.of(
                condition("aerInfo.study.studyName", "eq", "STD-01"),
                condition("aerInfo.patient.medHist$.treatment", "eq", "therapy")
        ));
        criteria.setStartIndex(0);
        criteria.setRecordsPerPage(25);

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        // Capture the listing SQL (queryForList call)
        verify(jdbc).queryForList(sqlCaptor.capture(), any(Object[].class));
        String sql = sqlCaptor.getValue();

        // SELECT clause — id + 3 listing columns
        assertThat(sql).contains("T101.ID AS \"id\"");
        assertThat(sql).contains("T101.CASE_ID AS \"caseId\"");
        assertThat(sql).contains("T106.LRD AS \"lrd\"");
        assertThat(sql).contains("T111.PAT_NAME AS \"patName\"");

        // FROM clause — root
        assertThat(sql).contains("FROM ICSR_CASES T101");

        // JOINs — aerInfo, patient, study (required by listing cols + study condition)
        assertThat(sql).contains("LEFT JOIN ICSR_AER_INFO T106 ON T106.CASE_REC_ID = T101.ID");
        assertThat(sql).contains("LEFT JOIN ICSR_PATIENT T111 ON T111.AER_REC_ID = T106.ID");
        assertThat(sql).contains("LEFT JOIN ICSR_STUDY T116 ON T116.AER_REC_ID = T106.ID");

        // medHist (multi-context path) must NOT be joined in main FROM
        assertThat(sql).doesNotContain("LEFT JOIN ICSR_MED_HIST");

        // WHERE — non-multi-context condition
        assertThat(sql).contains("T116.STUDY_NAME = ?");

        // WHERE — multi-context IN subquery anchored to patient (T111)
        assertThat(sql).contains("T111.ID IN (SELECT T112.PAT_REC_ID FROM ICSR_MED_HIST T112 WHERE T112.TREATMENT = ?)");

        // ORDER BY sort field
        assertThat(sql).contains("ORDER BY T106.LRD ASC");

        // Pagination
        assertThat(sql).contains("LIMIT 25 OFFSET 0");
    }

    @Test
    @DisplayName("TC-01: params are bound in correct order — study condition first, medHist condition second")
    void testParamOrder() {
        SearchCriteria criteria = new SearchCriteria();
        criteria.setListingColumns(List.of("caseId", "aerInfo.lrd", "aerInfo.patient.patName"));
        criteria.setSortFieldId("aerInfo.lrd");
        criteria.setConditions(List.of(
                condition("aerInfo.study.studyName", "eq", "STD-01"),
                condition("aerInfo.patient.medHist$.treatment", "eq", "therapy")
        ));

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<Object[]> paramsCaptor = ArgumentCaptor.forClass(Object[].class);
        verify(jdbc).queryForList(anyString(), paramsCaptor.capture());
        Object[] params = paramsCaptor.getValue();

        assertThat(params).hasSize(2);
        assertThat(params[0]).isEqualTo("STD-01");   // non-multi-context condition first
        assertThat(params[1]).isEqualTo("therapy");  // multi-context subquery param second
    }

    @Test
    @DisplayName("TC-02: COUNT query shares same FROM+WHERE core")
    void testCountQuerySharesCore() {
        SearchCriteria criteria = new SearchCriteria();
        criteria.setListingColumns(List.of("aerInfo.lrd"));
        criteria.setConditions(List.of(condition("aerInfo.study.studyName", "eq", "STD-01")));

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        verify(jdbc).queryForObject(sqlCaptor.capture(), eq(Long.class), any(Object[].class));
        String countSql = sqlCaptor.getValue();

        assertThat(countSql).startsWith("SELECT COUNT(*)");
        assertThat(countSql).contains("FROM ICSR_CASES T101");
        assertThat(countSql).contains("LEFT JOIN ICSR_AER_INFO T106");
        assertThat(countSql).contains("LEFT JOIN ICSR_STUDY T116");
        assertThat(countSql).contains("T116.STUDY_NAME = ?");
    }

    @Test
    @DisplayName("TC-03: no listing columns defaults to root table columns with listingAlias")
    void testDefaultListingColumnsFromRoot() {
        SearchCriteria criteria = new SearchCriteria();
        // no listingColumns set

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        verify(jdbc).queryForList(sqlCaptor.capture(), any(Object[].class));
        String sql = sqlCaptor.getValue();

        // Root table column CASE_ID has listingAlias "caseId"
        assertThat(sql).contains("T101.CASE_ID AS \"caseId\"");
        // No joins needed for root-only columns
        assertThat(sql).doesNotContain("LEFT JOIN");
    }

    @Test
    @DisplayName("TC-04: multi-context sort field falls back to ID")
    void testMultiContextSortFallsBackToId() {
        SearchCriteria criteria = new SearchCriteria();
        criteria.setListingColumns(List.of("aerInfo.lrd"));
        criteria.setSortFieldId("aerInfo.events$.eventTerm"); // multi-context — should be rejected

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        verify(jdbc).queryForList(sqlCaptor.capture(), any(Object[].class));
        String sql = sqlCaptor.getValue();

        assertThat(sql).contains("ORDER BY T101.ID ASC");
    }

    @Test
    @DisplayName("TC-05: nested multi-context drugs$ + drugInds$ grouped into one subquery")
    void testNestedMultiContextGroupedIntoOneSubquery() {
        SearchCriteria criteria = new SearchCriteria();
        criteria.setListingColumns(List.of("aerInfo.lrd"));
        criteria.setConditions(List.of(
                condition("aerInfo.drugs$.drugName", "eq", "Aspirin"),
                condition("aerInfo.drugs$.drugInds$.indication", "eq", "Pain")
        ));

        engine.execute(metadata, criteria, jdbc);

        ArgumentCaptor<String> sqlCaptor = ArgumentCaptor.forClass(String.class);
        verify(jdbc).queryForList(sqlCaptor.capture(), any(Object[].class));
        String sql = sqlCaptor.getValue();

        // Only ONE IN subquery anchored to aerInfo (T106) for drugs$
        long inCount = sql.chars().filter(c -> c == '(').count();
        assertThat(sql).containsOnlyOnce("T106.ID IN (");

        // Subquery starts FROM drugs and joins drugInds
        assertThat(sql).contains("FROM ICSR_DRUGS T126");
        assertThat(sql).contains("LEFT JOIN ICSR_DRUG_IND T131 ON T131.DRUG_REC_ID = T126.ID");

        // Both conditions inside the subquery WHERE
        assertThat(sql).contains("T126.DRUG_NAME = ?");
        assertThat(sql).contains("T131.INDICATION = ?");
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private SearchCondition condition(String fieldId, String operator, String value) {
        SearchCondition c = new SearchCondition();
        c.setFieldId(fieldId);
        c.setOperator(operator);
        c.setValue(value);
        return c;
    }

    // ── Metadata Builder ──────────────────────────────────────────────────────

    private ModuleMetadata buildIcsrMetadata() {
        // Tables
        TableMetadata tRoot    = table(T_ROOT,    null,    "ICSR_CASES",    null,           null,            "N");
        TableMetadata tAer     = table(T_AER,     T_ROOT,  "ICSR_AER_INFO", "CASE_REC_ID",  "ID",     "N");
        TableMetadata tPat     = table(T_PAT,     T_AER,   "ICSR_PATIENT",  "AER_REC_ID",   "ID",     "N");
        TableMetadata tMedHist = table(T_MEDHIST, T_PAT,   "ICSR_MED_HIST", "PAT_REC_ID",   "ID",     "N");
        TableMetadata tStudy   = table(T_STUDY,   T_AER,   "ICSR_STUDY",    "AER_REC_ID",   "ID",     "N");
        TableMetadata tEvents  = table(T_EVENTS,  T_AER,   "ICSR_EVENTS",   "AER_REC_ID",   "ID",     "Y");
        TableMetadata tDrugs   = table(T_DRUGS,   T_AER,   "ICSR_DRUGS",    "AER_REC_ID",   "ID",     "Y");
        TableMetadata tDrugInd = table(T_DRUGIND, T_DRUGS, "ICSR_DRUG_IND", "DRUG_REC_ID",  "ID",     "Y");

        List<TableMetadata> tables = List.of(tRoot, tAer, tPat, tMedHist, tStudy, tEvents, tDrugs, tDrugInd);

        // Columns
        List<ColumnMetadata> columns = List.of(
            col(T_ROOT,    "CASE_ID",    "caseId",    "caseId",                                    "caseId"),
            col(T_AER,     "LRD",        "lrd",       "aerInfo.lrd",                               "lrd"),
            col(T_AER,     "SENDER",     "sender",    "aerInfo.sender",                            "sender"),
            col(T_PAT,     "PAT_NAME",   "patName",   "aerInfo.patient.patName",                   "patName"),
            col(T_PAT,     "PAT_AGE",    "patAge",    "aerInfo.patient.patAge",                    "patAge"),
            col(T_PAT,     "PAT_WEIGHT", "patWeight", "aerInfo.patient.patWeight",                 "patWeight"),
            col(T_MEDHIST, "TREATMENT",  "treatment", "aerInfo.patient.medHist$.treatment",        "treatment"),
            col(T_MEDHIST, "DURATION",   "duration",  "aerInfo.patient.medHist$.duration",         "duration"),
            col(T_STUDY,   "STUDY_NAME", "studyName", "aerInfo.study.studyName",                   "studyName"),
            col(T_STUDY,   "STUDY_TYPE", "studyType", "aerInfo.study.studyType",                   "studyType"),
            col(T_EVENTS,  "EVENT_TERM", "eventTerm", "aerInfo.events$.eventTerm",                 "eventTerm"),
            col(T_EVENTS,  "EVENT_DATE", "eventDate", "aerInfo.events$.eventDate",                 "eventDate"),
            col(T_DRUGS,   "DRUG_NAME",  "drugName",  "aerInfo.drugs$.drugName",                   "drugName"),
            col(T_DRUGS,   "DRUG_TYPE",  "drugType",  "aerInfo.drugs$.drugType",                   "drugType"),
            col(T_DRUGIND, "INDICATION", "indication","aerInfo.drugs$.drugInds$.indication",       "indication"),
            col(T_DRUGIND, "IND_CODE",   "indCode",   "aerInfo.drugs$.drugInds$.indCode",          "indCode")
        );

        Map<String, TableMetadata> tableIndex = new HashMap<>();
        Map<String, List<ColumnMetadata>> columnIndex = new HashMap<>();
        for (TableMetadata t : tables) tableIndex.put(t.getTableId(), t);
        for (ColumnMetadata c : columns) columnIndex.computeIfAbsent(c.getTableId(), k -> new ArrayList<>()).add(c);

        return ModuleMetadata.builder()
                .moduleId("ICSR")
                .tables(tables)
                .columns(columns)
                .tableIndex(tableIndex)
                .columnIndex(columnIndex)
                .build();
    }

    private TableMetadata table(String tableId, String parentId, String dbName,
                                 String joinCol, String refJoinCol, String multiContext) {
        return TableMetadata.builder()
                .tableId(tableId)
                .parentTableId(parentId)
                .dbTableName(dbName)
                .joinColumn(joinCol)
                .refJoinColumn(refJoinCol)
                .multiContext(multiContext)
                .build();
    }

    private ColumnMetadata col(String tableId, String columnName, String fieldName,
                                String fieldPath, String listingAlias) {
        return ColumnMetadata.builder()
                .tableId(tableId)
                .columnName(columnName)
                .fieldName(fieldName)
                .fieldPath(fieldPath)
                .listingAlias(listingAlias)
                .build();
    }
}
