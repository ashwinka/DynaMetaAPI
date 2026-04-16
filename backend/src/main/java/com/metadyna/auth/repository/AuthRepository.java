package com.metadyna.auth.repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.metadyna.auth.model.AppUser;
import com.metadyna.auth.model.JwtClaims;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Queries APP_USERS and ROLE_PRIVILEGES from the tenant-scoped DB.
 * Receives a tenant JdbcTemplate per call (no ThreadLocal dependency here).
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class AuthRepository {

    private final ObjectMapper objectMapper;

    /**
     * Finds a user by username in the tenant DB.
     */
    public Optional<AppUser> findUserByUsername(String username, JdbcTemplate jdbc) {
        String sql = """
                SELECT ID, USER_NAME, FULL_NAME, EMAIL_ID,
                       PASSWORD_HASH, ROLES, IS_ACTIVE
                  FROM APP_USERS
                 WHERE USER_NAME = ?
                """;

        List<AppUser> results = jdbc.query(sql, (rs, rowNum) -> {
            List<String> roles = parseJsonArray(rs.getString("ROLES"));
            return AppUser.builder()
                    .id(rs.getString("ID"))
                    .userName(rs.getString("USER_NAME"))
                    .fullName(rs.getString("FULL_NAME"))
                    .emailId(rs.getString("EMAIL_ID"))
                    .passwordHash(rs.getString("PASSWORD_HASH"))
                    .roles(roles)
                    .isActive(rs.getString("IS_ACTIVE"))
                    .build();
        }, username);

        return results.isEmpty() ? Optional.empty() : Optional.of(results.get(0));
    }

    /**
     * Loads and aggregates privileges for the given list of role IDs.
     * Joins USER_ROLES (root) with ROLE_PRIVILEGES (child) — only active roles.
     * Merges read/write flags across all roles (OR logic — most permissive wins).
     */
    public List<JwtClaims.Privilege> loadRolePrivileges(List<String> roleIds, JdbcTemplate jdbc) {
        if (roleIds == null || roleIds.isEmpty()) {
            return List.of();
        }

        String placeholders = String.join(",", roleIds.stream().map(r -> "?").toList());
        String sql = """
                SELECT rp.MODULE_ID, rp.READ_ACCESS, rp.WRITE_ACCESS
                  FROM ROLE_PRIVILEGES rp
                  JOIN USER_ROLES ur ON ur.ROLE_ID = rp.ROLE_ID
                 WHERE rp.ROLE_ID IN (%s)
                   AND ur.IS_ACTIVE = 'Y'
                """.formatted(placeholders);

        Map<String, JwtClaims.Privilege> aggregated = new java.util.LinkedHashMap<>();

        jdbc.query(sql, (rs, rowNum) -> {
            String moduleId = rs.getString("MODULE_ID");
            boolean read  = "Y".equals(rs.getString("READ_ACCESS"));
            boolean write = "Y".equals(rs.getString("WRITE_ACCESS"));
            // OR merge — most permissive access wins across all roles
            aggregated.merge(moduleId,
                    JwtClaims.Privilege.builder().moduleId(moduleId).read(read).write(write).build(),
                    (existing, incoming) -> JwtClaims.Privilege.builder()
                            .moduleId(moduleId)
                            .read(existing.isRead()   || incoming.isRead())
                            .write(existing.isWrite() || incoming.isWrite())
                            .build());
            return null;
        }, roleIds.toArray());

        return List.copyOf(aggregated.values());
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private List<String> parseJsonArray(String json) {
        try {
            if (json == null || json.isBlank()) return List.of();
            return objectMapper.readValue(json, new TypeReference<>() {});
        } catch (Exception e) {
            log.warn("Failed to parse ROLES JSON: {}", json, e);
            return List.of();
        }
    }


}
