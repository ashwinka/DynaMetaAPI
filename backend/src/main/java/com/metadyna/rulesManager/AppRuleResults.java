package com.metadyna.rulesManager;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Getter
@Builder
@Setter
public class AppRuleResults {
    List<Map<String, String>> ctxIds = new ArrayList<>();
    List<String> evalLogs = new ArrayList<>();
    Boolean ruleResult = false;
}
