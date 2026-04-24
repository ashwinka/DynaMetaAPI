package com.metadyna.metadata.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class AppRules {
    private String  id;
    private String  moduleId;
    private String  ruleId;
    private int     version;
    private String  description;
    private String  status;          //DRAFT,PUBLISHED
    private String  isActive;        //Y,N
    private String  ruleType;        //CONDITIONAL,VALIDATION,RENDERER,DERIVATIONS,WORKFLOW

    private String  triggerFields;
    private String  contextPath;
    private String  ruleParameters;
    private String  ruleExpression;  //{logic:"AND", conditions: [{lhsFieldId:"432004", operator:"eq", rhsValue:"Y"}], expression:[{logic:"OR", conditions: [{lhsFieldId:"age_400034", operator:"gt", rhsValue:"10"}, {lhsFieldId:"sex_400035", operator:"eq", rhsValue:"F"}], expression:[]]}

}
