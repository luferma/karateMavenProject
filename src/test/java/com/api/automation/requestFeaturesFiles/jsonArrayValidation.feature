Feature: To test and end point of the application
  To test different end point with different format supported by the application

  Background: Setup URL base path
    Given url "http://localhost:9999"
    And print "--------Background keyword-----------"

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
    #validate the size of array
    And match response.[0].jobId == 1
    And match response.[0].experience[0] == 'Google'
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    #using wild card character
    And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
    And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    #using contains keyword
    And match response.[0].experience[*] contains ['Apple','Mobile Iron']
    And match response.[0].project[0].technology[*] contains ['SQL Lite']
    And match response.[*].jobId contains 1