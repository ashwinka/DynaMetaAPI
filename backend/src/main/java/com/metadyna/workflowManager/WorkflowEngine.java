
package com.metadyna.workflowManager;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class WorkflowEngine {

    public void initializeWorkflow(String dataRedId, String moduleId, String workflowId) {

    }

    public void initWorkflowTransition(String dataRedId, String moduleId, String workflowId, String activityId) {

    }

    public void completeWorkflowTransition(String dataRedId, String moduleId, String workflowId, String activityId) {

    }

    public void exitWorkflow(String dataRedId, String moduleId, String workflowId) {

    }
}
