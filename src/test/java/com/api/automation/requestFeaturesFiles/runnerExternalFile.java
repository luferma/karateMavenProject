package com.api.automation.requestFeaturesFiles;

import com.intuit.karate.junit5.Karate;

class runnerExternalFile {
    
    @Karate.Test
    Karate testGetRequest() {
        return Karate.run("validationExternalFile").relativeTo(getClass());
    }
}
