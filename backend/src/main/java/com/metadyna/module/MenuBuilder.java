package com.metadyna.module;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.metadyna.auth.model.JwtClaims;
import com.metadyna.metadata.cache.MetadataCache;
import com.metadyna.module.model.MenuGroup;
import com.metadyna.module.model.ModuleEntry;
import com.metadyna.module.repository.ModuleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Builds the menu_metadata JSON returned on login.
 * Uses MetadataCache for MENU_GROUPS and MODULE — falls back to DB on cache miss.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class MenuBuilder {

    private final ObjectMapper objectMapper;
    private final MetadataCache metadataCache;
    private final ModuleRepository moduleRepository;

    public JsonNode buildMenu(List<JwtClaims.Privilege> privileges, JdbcTemplate jdbc, String tenantId) {
        Set<String> readableModules = privileges.stream()
                .filter(JwtClaims.Privilege::isRead)
                .map(JwtClaims.Privilege::getModuleId)
                .collect(Collectors.toSet());

        // Wildcard privilege "*" means access to all modules
        boolean isWildcard = readableModules.contains("*");

        // Load from cache or DB
        List<MenuGroup> groups = metadataCache.getMenuGroups(tenantId).orElseGet(() -> {
            List<MenuGroup> loaded = moduleRepository.findAllMenuGroups(jdbc);
            metadataCache.putMenuGroups(tenantId, loaded);
            return loaded;
        });

        List<ModuleEntry> modules = metadataCache.getModules(tenantId).orElseGet(() -> {
            List<ModuleEntry> loaded = moduleRepository.findAllModules(jdbc);
            metadataCache.putModules(tenantId, loaded);
            return loaded;
        });

        // Build JSON
        ObjectNode root = objectMapper.createObjectNode();
        ArrayNode groupsArray = root.putArray("groups");

        for (MenuGroup group : groups) {
            if (!"Y".equals(group.getIsActive())) continue;

            List<ModuleEntry> groupModules = modules.stream()
                    .filter(m -> "Y".equals(m.getIsActive()))
                    .filter(m -> group.getMenuId().equals(m.getMenuGroupId()))
                    .filter(m -> isWildcard || readableModules.contains(m.getModuleId()))
                    .toList();

            if (groupModules.isEmpty()) continue;

            ObjectNode groupNode = groupsArray.addObject();
            groupNode.put("groupId", group.getMenuId());
            groupNode.put("label", group.getLabel());
            putNullable(groupNode, "translations", group.getTranslations());
            putNullable(groupNode, "icon", group.getIcon());

            ArrayNode itemsArray = groupNode.putArray("items");
            for (ModuleEntry mod : groupModules) {
                ObjectNode item = itemsArray.addObject();
                item.put("moduleId", mod.getModuleId());
                item.put("itemId", mod.getItemId());
                item.put("label", mod.getLabel());
                putNullable(item, "translations", mod.getTranslations());
                putNullable(item, "description", mod.getDescription());
                putNullable(item, "icon", mod.getIcon());
                item.put("view", mod.getView() != null ? mod.getView() : "listing");
                putNullable(item, "badge", mod.getBadge());
                putNullable(item, "badgeColor", mod.getBadgeColor());
                item.put("isDisabled", "Y".equals(mod.getIsDisabled()));

                // Resolve privilege: prefer exact module match, fall back to wildcard
                JwtClaims.Privilege resolved = privileges.stream()
                        .filter(p -> p.getModuleId().equals(mod.getModuleId()))
                        .findFirst()
                        .orElse(privileges.stream()
                                .filter(p -> "*".equals(p.getModuleId()))
                                .findFirst()
                                .orElse(null));

                if (resolved != null) {
                    ObjectNode privNode = item.putObject("privileges");
                    privNode.put("read", resolved.isRead());
                    privNode.put("write", resolved.isWrite());
                    // accessLevel: "write" if write access, "read" if read-only
                    item.put("accessLevel", resolved.isWrite() ? "write" : "read");
                }
            }
        }

        return root;
    }

    private void putNullable(ObjectNode node, String key, String value) {
        if (value != null) node.put(key, value);
    }
}
