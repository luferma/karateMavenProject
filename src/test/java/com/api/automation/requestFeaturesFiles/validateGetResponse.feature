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

  Scenario: Math an especific value in the response with JSON format
    And path "/normal/webapi/all"
    And header Accept = "application/json"
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'

  Scenario: Math an especific value in the response with XML format
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    #Skip response keyword
    And match /List/item/jobId == '1'
    #Travers the XMl similar to JSON
    And match response.List.item.experience.experience[0] == 'Google'
