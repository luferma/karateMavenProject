Feature: To test and end point of the application
  To test different end point with different format supported by the application

  Background: Setup URL base path
    Given url "http://localhost:9999"
    And print "--------Background keyword-----------"

  Scenario: To test the get end point with JSON data
       And path "/normal/webapi/all"
       And header Accept = "application/json"
       When method get
       Then status 200
       And print response
       And match response ==
       """
       [
         {
           "jobId": 1,
           "jobTitle": "Software Engg",
           "jobDescription": "To develop andriod application",
           "experience": [
             "Google",
             "Apple",
             "Mobile Iron"
           ],
           "project": [
             {
               "projectName": "Movie App",
               "technology": [
                 "Kotlin",
                 "SQL Lite",
                 "Gradle"
               ]
             }
           ]
         }
       ]
       """

  Scenario: To test the get end point with XML data
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And print response
    And match response ==
    """
    <List>
    <item>
    <jobId>1</jobId>
    <jobTitle>Software Engg</jobTitle>
    <jobDescription>To develop andriod application</jobDescription>
    <experience>
    <experience>Google</experience>
    <experience>Apple</experience>
    <experience>Mobile Iron</experience>
    </experience>
    <project>
    <project>
    <projectName>Movie App</projectName>
    <technology>
    <technology>Kotlin</technology>
    <technology>SQL Lite</technology>
    <technology>Gradle</technology>
    </technology>
    </project>
    </project>
    </item>
    </List>
    """

  Scenario: To test the get end point with JSON data and validate a specific property
    And path "/normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep {"project":[{"projectName": "Movie App"}]}
    And match header Content-Type == "application/json"
    And match header Connection == "keep-alive"