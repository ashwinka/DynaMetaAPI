package com.metadyna.module.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MenuGroup {
    private String id;
    private String menuId;
    private String label;
    private String translations; // JSON: {"fr":"...","ja":"..."}
    private String icon;
    private int sequence;
    private String isActive;
}
