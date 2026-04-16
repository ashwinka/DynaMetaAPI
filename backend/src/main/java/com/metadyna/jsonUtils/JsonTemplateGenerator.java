package com.metadyna.jsonUtils;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.file.Files;
import java.nio.file.Path;

public class JsonTemplateGenerator {
    private static Logger agLogger = LoggerFactory.getLogger(JsonTemplateGenerator.class);

    public static void main(String[] args){
        JSONParser p = new JSONParser();
        try{
            String uiMetadata = Files.readString(Path.of("C:\\Users\\00002441\\Documents\\GitHub\\LSMV_NEW\\CODING\\JAVA\\Main\\lsmv-web\\web\\src\\main\\resources\\reconciliation\\uiCnrMetadata.json"));
            JSONObject caseTemplate = JsonTemplateGenerator.generateJsonTemplate(uiMetadata);
            System.out.println(caseTemplate.toJSONString());
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    public static JSONObject generateJsonTemplate(String uiMetadataJsonStr) {
        JSONObject jsonTemplate = new JSONObject();
        JSONParser parser = new JSONParser();
        try {
            JSONObject uiMetadataJson = (JSONObject) parser.parse(uiMetadataJsonStr);
            iterateUiMetadataJson(jsonTemplate, uiMetadataJson);

            JSONArray extraTemplateFields = (JSONArray) uiMetadataJson.get("additionalTemplateFields");
            for(Object moreTempFlPathObj : extraTemplateFields){
                String moreTempFlPath = String.valueOf(moreTempFlPathObj);
                updateJsonTemplate(moreTempFlPath, jsonTemplate, false, false, false);
            }

        } catch (ParseException e) {
            agLogger.error("Error while generating the jsonTemplate", e);
        }
        return jsonTemplate;
    }

    private static void iterateUiMetadataJson(JSONObject jsonTemplate, JSONObject uiMetadataJson) {
        JSONObject fields = (JSONObject) uiMetadataJson.get("fields");
        JSONObject sections = (JSONObject) uiMetadataJson.get("sections");

        if(fields != null && !fields.isEmpty()){
            for (Object fieldId : fields.keySet()) {
                JSONObject fieldMd = (JSONObject) fields.get(fieldId);
                //TO-DO Handle NF/SF/ImplDate
                if(fieldMd.get("flpath") != null && !fieldMd.get("flpath").equals("")){
                    boolean nfField = false;
                    boolean sfField = false;
                    boolean impreciseField  = false;
                    if("true".equals(String.valueOf(fieldMd.get("nfField")))){
                        nfField = true;
                    }
                    if("true".equals(String.valueOf(fieldMd.get("sfField")))){
                        sfField = true;
                    }
                    if("true".equals(String.valueOf(fieldMd.get("impreciseField")))){
                        impreciseField = true;
                    }
                    updateJsonTemplate(String.valueOf(fieldMd.get("flpath")), jsonTemplate, nfField, sfField, impreciseField);
                }
            }
        }
        if(sections != null && !sections.isEmpty()){
            for (Object sectionId : sections.keySet()) {
                JSONObject sectionMd = (JSONObject) sections.get(sectionId);
                iterateUiMetadataJson(jsonTemplate, sectionMd);
            }
        }

    }

    private static void updateJsonTemplate(String fieldPath, JSONObject jsonTemplate, boolean nfField, boolean sfField, boolean impreciseField){
        String absPath = fieldPath.replace("$", ".").replace(".flpath", "");
        String[] pathSplit = absPath.split("\\.");
        JSONObject currTemplate = jsonTemplate;
        for(int i = pathSplit.length - 1; i > 0; i--){
            currTemplate.computeIfAbsent(pathSplit[i], k -> new JSONObject());
            currTemplate = (JSONObject) currTemplate.get(pathSplit[i]);
        }
        currTemplate.computeIfAbsent(pathSplit[0], k -> "");
        if(nfField){
            currTemplate.computeIfAbsent(pathSplit[0] + "NF", k -> "");
        }
        if(sfField){
            currTemplate.computeIfAbsent(pathSplit[0] + "SF", k -> "");
        }
        if(impreciseField){
            currTemplate.computeIfAbsent(pathSplit[0] + "Fmt", k -> "");
        }
    }

}
