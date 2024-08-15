package com.api.automation.requestFeaturesFiles;

import com.intuit.karate.junit5.Karate;

class runnerFeature {
    
    @Karate.Test
    Karate testGetRequest() {
        return Karate.run("getRequest", "validateGetResponse", "jsonArrayValidation", "variables").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGetRequestMethod() {
        return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
    }
}
