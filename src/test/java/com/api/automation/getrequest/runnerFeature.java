package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;

class runnerFeature {
    
    @Karate.Test
    Karate testGetRequest() {
        return Karate.run("getRequest", "validateGetResponse").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGetRequestMethod() {
        return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
    }

    @Karate.Test
    Karate testJsonArrayValidationMethod() {
        return Karate.run("classpath:com/api/automation/getrequest/jsonArrayValidation.feature");
    }

}
