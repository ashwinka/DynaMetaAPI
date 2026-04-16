package com.metadyna.module.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ModuleEntry {
    private String id;
    private String moduleId;
    private String itemId;
    private String label;
    private String translations; // JSON: {"fr":{"label":"...","description":"..."},"ja":{...}}
    private String description;
    private String menuGroupId;
    private String icon;
    private String view;
    private String dbRootTable;
    private String badge;
    private String badgeColor;
    private String isDisabled;
    private String isActive;
    private int sequence;
}
