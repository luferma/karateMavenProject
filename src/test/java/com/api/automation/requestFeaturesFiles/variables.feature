Feature: Variables Creation in Karate Framework

  Background:  Create and Initialize Variables
    * def app_name = "Google"
    * def page_lode_timeout = 20

  #<Gherkin Keyword> <def> <Variable_name> = <Value>
  # * <def> <variable_name> = <value>

  Scenario: To create a Variable
    # Use Variable for repeating value
    # Storing the data from a external file
    # In the matcher expression
    # Passing the Data from one feature file to another

    Given def var_int = 10
    And def var_string = "Karate"
    Then print "Int Variable ==> ", var_int
    And print "String Variable ==> ", var_string
    * def var_int_2 = var_int + 10
    And print "New Variable ==> ", var_int_2
    And print "Backgorund Variable ==> ", app_name