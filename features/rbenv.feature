Feature: Generate skellington

  Scenario: generate .ruby-version
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/.ruby-version" should exist
    And the file "dummy_gem/.ruby-version" should match /[0-9].[0-9].[0-9]/
