package com.metadyna.codelist.repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metadyna.codelist.model.CodeListLib;
import com.metadyna.codelist.model.CodeListValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Slf4j
@Repository
@RequiredArgsConstructor
public class CodeListRepository {

    private final ObjectMapper objectMapper;

    // ── Code List Library ─────────────────────────────────────────────────────

    public List<CodeListValue> findAllActiveValues(JdbcTemplate jdbc) {
        return jdbc.query("""
                SELECT v.ID, v.CODE_LIST_ID, v.CODE, v.DECODE, v.TRANSLATIONS, v.SEQUENCE, v.IS_ACTIVE
                  FROM CODE_LIST_VALUES v
                  JOIN CODE_LIST_LIB l ON l.CODE_LIST_ID = v.CODE_LIST_ID
                 WHERE v.IS_ACTIVE = 'Y' AND l.IS_ACTIVE = 'Y'
                 ORDER BY v.CODE_LIST_ID, v.SEQUENCE, v.CODE
                """, (rs, n) -> mapValue(rs));
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private CodeListValue mapValue(java.sql.ResultSet rs) throws java.sql.SQLException {
        return CodeListValue.builder()
                .id(rs.getString("ID"))
                .codeListId(rs.getString("CODE_LIST_ID"))
                .code(rs.getString("CODE"))
                .decode(rs.getString("DECODE"))
                .translations(parseTranslations(rs.getString("TRANSLATIONS")))
                .sequence(rs.getInt("SEQUENCE"))
                .isActive(rs.getString("IS_ACTIVE"))
                .build();
    }

    private Map<String, String> parseTranslations(String json) {
        try {
            if (json == null || json.isBlank()) return null;
            return objectMapper.readValue(json, new TypeReference<>() {});
        } catch (Exception e) {
            log.warn("Failed to parse TRANSLATIONS JSON: {}", json);
            return null;
        }
    }

    private String toJson(Object obj) {
        if (obj == null) return null;
        try {
            return objectMapper.writeValueAsString(obj);
        } catch (Exception e) {
            return null;
        }
    }
}
