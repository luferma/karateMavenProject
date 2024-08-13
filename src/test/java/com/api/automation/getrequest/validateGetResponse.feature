Feature: To validate the get endpoint
  To validate the get endpoint response

  Background: Setup URL base path
    Given url "http://localhost:9999"

  Scenario: To test the get end point with JSON data
       And path "/normal/webapi/all"
       And header Accept = "application/json"
       When method get
       Then status 200
       And print response

  Scenario: To test the get end point with XML data
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And print response

  Scenario: Math an especific value in the response
    And path "/normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'