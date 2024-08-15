package com.api.automation.requestFeaturesFiles;

import com.intuit.karate.junit5.Karate;

class postRunner {
    
    @Karate.Test
    Karate testPostRequest() {
        return Karate.run("postRequest").relativeTo(getClass());
    }
}
