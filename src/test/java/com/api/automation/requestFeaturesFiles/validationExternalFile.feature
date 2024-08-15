Feature: To test and end point of the application
  To test different end point with different format supported by the application

  Background: Setup URL base path
    Given url "http://localhost:9999"
    And print "--------Background keyword-----------"

  Scenario: To test the get end point with JSON data and validate from file
       And path "/normal/webapi/all"
       And header Accept = "application/json"
       When method get
       Then status 200
       # Create a variable to store the data from external file
       * def actualResponse = read("/JsonFile.json")
       And print "External file content ==> ", actualResponse
       And match response == actualResponse

  Scenario: To test the get end point with XML data and validate from file
    And path "/normal/webapi/all"
    And header Accept = "application/xml"
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("/XmlFile.xml")
    And print "External file content ==> ", actualResponse
    And match response == actualResponse