package com.metadyna.rulesManager;

import com.metadyna.metadata.model.ColumnMetadata;
import com.metadyna.metadata.model.ModuleMetadata;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import static com.metadyna.AppConstants.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class RuleEngine {

    private final JSONParser parser = new JSONParser();

    public List<AppRuleResults> evaluateRule(JSONObject dataJson, AppRules rule, ModuleMetadata md, boolean breakIfAnyCtxPassed){
        String ruleCtxPath = rule.getContextPath();
        String ruleExpStr = rule.getRuleExpression();
        List<AppRuleResults> ruleResList = new ArrayList<>();
        if(ruleExpStr == null || ruleExpStr.isEmpty()){
            return ruleResList;
        }
        JSONObject ruleExp = null;
        try{
            ruleExp = (JSONObject) parser.parse(ruleExpStr);
        } catch (Exception e){
            log.error(e.getMessage());
            return ruleResList;
        }
        if(ruleCtxPath == null || !ruleCtxPath.contains("$")){
            Map<String, String> ctxIds = new HashMap<>();
            boolean isPassed = evaluateRuleExpression(ruleExp, dataJson, ctxIds, md);
            AppRuleResults ruleRes = AppRuleResults.builder().ctxIds(null).ruleResult(isPassed).build();
            ruleResList.add(ruleRes);
        } else {
            resolveMultiCtxIds(ruleExp, ruleCtxPath, dataJson, dataJson, null, md, ruleResList, breakIfAnyCtxPassed);
        }
        return ruleResList;
    }

    private void resolveMultiCtxIds(JSONObject ruleExp, String ruleCtxPath, JSONObject ctxJsonObj, JSONObject dataJson, Map<String, String> parentCtxIds, ModuleMetadata md, List<AppRuleResults> ruleResList, boolean breakIfAnyCtxPassed){
        String currCtxPath = ruleCtxPath != null && ruleCtxPath.contains(".") ? ruleCtxPath.substring(0, ruleCtxPath.indexOf(".")) : ruleCtxPath;
        String parentCtxPath = ruleCtxPath != null && ruleCtxPath.contains(".") ? ruleCtxPath.substring(ruleCtxPath.indexOf(".")+1) : null;

        if(currCtxPath == null){
            boolean ruleExpPassed = evaluateRuleExpression(ruleExp, dataJson, parentCtxIds, md);
            AppRuleResults ruleRes = AppRuleResults.builder().ctxIds(null).ruleResult(ruleExpPassed).build();
            ruleResList.add(ruleRes);
        } else {
            if(currCtxPath.contains("$")){
                if(ctxJsonObj.get(currCtxPath) != null && ctxJsonObj.get(currCtxPath) instanceof JSONArray ctxObjArr){
                    Map<String, String> currCtxIds = new HashMap<>();
                    if(parentCtxIds != null){
                        currCtxIds.putAll(parentCtxIds);
                    }

                    for(Object o : ctxObjArr){
                        if(o instanceof JSONObject currCtxJsonObj){
                            currCtxIds.put(currCtxPath, String.valueOf(currCtxJsonObj.get("id")));
                            resolveMultiCtxIds(ruleExp, parentCtxPath, currCtxJsonObj, dataJson, currCtxIds, md, ruleResList, breakIfAnyCtxPassed);
                            if(breakIfAnyCtxPassed && !ruleResList.isEmpty() && ruleResList.getLast().ruleResult){
                                break;
                            }
                        }
                    }
                }
            } else if(ctxJsonObj.get(currCtxPath) != null && ctxJsonObj.get(currCtxPath) instanceof JSONObject currCtxJsonObj){
                resolveMultiCtxIds(ruleExp, parentCtxPath, currCtxJsonObj, dataJson, parentCtxIds, md, ruleResList, breakIfAnyCtxPassed);
            }
        }
    }

    private boolean evaluateRuleExpression(JSONObject ruleExp, JSONObject dataJson, Map<String, String> ctxIds, ModuleMetadata md){
        boolean expPassed = true;
        String logic = "OR".equals(String.valueOf(ruleExp.get(RULE_JSON_LOGIC))) ? "OR" : "AND";
        JSONArray conditions = (JSONArray) ruleExp.get(RULE_JSON_COND);
        JSONArray childExps = (JSONArray) ruleExp.get(RULE_JSON_EXP);

        if(ruleExp.get(RULE_JSON_COND) != null && ruleExp.get(RULE_JSON_COND) instanceof JSONArray condArray){
            conditions = condArray;
        }
        if(ruleExp.get(RULE_JSON_EXP) instanceof JSONArray expArray){
            childExps = expArray;
        }

        for(Object condObj : conditions){
            JSONObject condition = (JSONObject) condObj;
            boolean condPassed = evaluateRuleCondition(condition, dataJson, ctxIds, md);
            if((condPassed && "OR".equals(logic)) ||(!condPassed && "AND".equals(logic))){
                expPassed = false;
                break;
            }
        }

        if(expPassed){
            for(Object expObj : childExps){
                JSONObject exp = (JSONObject) expObj;
                boolean childExpPass = evaluateRuleExpression(exp, dataJson, ctxIds, md);
                if((childExpPass && "OR".equals(logic)) ||(!childExpPass && "AND".equals(logic))){
                    expPassed = false;
                    break;
                }
            }
        }
        return expPassed;
    }

    private boolean evaluateRuleCondition(JSONObject condition, JSONObject dataJson, Map<String, String> ctxIds, ModuleMetadata md){

        String lhsVal = "";
        String lhsFieldId = condition.get(RULE_JSON_LHS_FL) != null ?String.valueOf(condition.get(RULE_JSON_LHS_FL)) : null;
        String operator = condition.get(RULE_JSON_LOGIC) != null ?String.valueOf(condition.get(RULE_JSON_LOGIC)) : RE_OP_EQ;
        String rhsVal = condition.get(RULE_JSON_RHS) != null ?String.valueOf(condition.get(RULE_JSON_RHS)) : null;
        String rhsFieldId = condition.get(RULE_JSON_RHS_FL) != null ?String.valueOf(condition.get(RULE_JSON_RHS_FL)) : null;
        Map<String, ColumnMetadata> flMap = md.getAllFieldsIndex();
        ColumnMetadata lhsCol = null;
        ColumnMetadata rhsCol = null;
        if(flMap != null && flMap.containsKey(lhsFieldId)){
            lhsCol = flMap.get(lhsFieldId);
        }
        if(lhsCol == null){
            return true;
        }

        //TO-DO if the lhs field path is not aligned with rule multi-context path then get the data based on lhf type anyOrAll
        String lhsPath = lhsCol.getFieldPath();
        if(isMultiCtxPathsResolved(lhsPath, ctxIds)){
            lhsVal = getFieldDataByPath(lhsCol.getFieldPath(), dataJson, ctxIds, false);
        } else {
            lhsVal = getFieldDataByPath(lhsCol.getFieldPath(), dataJson, ctxIds, true);
        }

        if(rhsFieldId != null && flMap.containsKey(rhsFieldId)){
            rhsCol = flMap.get(rhsFieldId);
            rhsVal = getFieldDataByPath(rhsCol.getFieldPath(), dataJson, ctxIds, true);
        }

        return evaluateRuleConditionByData(lhsVal, operator, rhsVal, "ANY");
    }
    private boolean evaluateRuleConditionByData(String lhsData, String operator, String rhsData, String matchAnyOrAll){
        String[] lhsArr = lhsData.split("\\|");
        String rhsArr = "|"+rhsData + "|";
        boolean condPassed = true;
        switch (operator){
            case RE_OP_EQ:
            case RE_OP_NEQ:
            case RE_OP_IN:
            case RE_OP_NOT_IN:
                for (String ld : lhsArr){
                    if(!rhsArr.contains("|" + ld + "|")){
                        condPassed = false;
                        break;
                    }
                }
                condPassed = RE_OP_NEQ.equals(operator) || RE_OP_NOT_IN.equals(operator) ? !condPassed : condPassed;
                break;
        }


        return condPassed;

    }

    private boolean isMultiCtxPathsResolved(String ctxPath, Map<String, String> ctxIds) {
        if(!ctxPath.contains("$")){
            return true;
        }

        List<String> repPats = getRepPathList(ctxPath);
        for(String repPat : repPats){
            if(!ctxIds.containsKey(repPat)){
                return false;
            }
        }
        return true;
    }

    private List<String> getRepPathList(String ctxPath){
        String[] paths = ctxPath.split("\\|");
        List<String> repPaths = new ArrayList<>();
        for(String path : paths){
            if(path.contains("$")){
                repPaths.add(path);
            }
        }

        return repPaths;
    }


    private String getFieldDataByPath(String fieldPath, JSONObject dataJson, Map<String, String> ctxIds, boolean resolveMultiCtxIds){
        List<String> flData = new ArrayList<>();
        String ctxPath = fieldPath.contains(".") ? fieldPath.substring(0, fieldPath.lastIndexOf(".")) : null;
        String fieldName = fieldPath.substring(fieldPath.lastIndexOf(".") + 1);

        if(ctxPath != null){
            List<JSONObject> ctxObjList = getCtxObjByPath(ctxPath, dataJson, ctxIds, resolveMultiCtxIds);
            for(JSONObject o : ctxObjList){
                if(o.get(fieldName) != null){
                    flData.add(String.valueOf(o.get(fieldName)));
                }
            }
        } else {
            if(dataJson.get(fieldName) != null){
                flData.add(String.valueOf(dataJson.get(fieldName)));
            }
        }
        return String.join("|", flData);
    }

    private List<JSONObject> getCtxObjByPath(String ctxPath, JSONObject dataJson, Map<String, String> ctxIds, boolean resolveMultiCtx ){

        String[] paths = ctxPath.split("\\.");
        List<JSONObject> dataObjArr = new ArrayList<>();
        List<String> flData = new ArrayList<>();

        dataObjArr.add(dataJson);
        for(String path : paths){
            List<JSONObject> currDataObjArr = new ArrayList<>();
            for(JSONObject dataObj : dataObjArr){
                if(dataObj.get(path) == null){
                    continue;
                }
                if(path.endsWith("$") && dataObj.get(path) instanceof JSONArray mcObjArray){
                    if(!resolveMultiCtx && !ctxIds.containsKey(path)){
                        continue;
                    }
                    for (Object o : mcObjArray){
                        currDataObjArr.add((JSONObject) o);
                    }
                } else if(dataObj.get(path) instanceof JSONObject){
                    dataObj = (JSONObject) dataObj.get(path);
                    currDataObjArr.add(dataObj);
                }
            }
            dataObjArr = currDataObjArr;
        }

        return dataObjArr;
    }
}
