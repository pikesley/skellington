Feature: Generate skellington

  Scenario: generate .ruby-version
    When I successfully run `skellington generate dummy_app`
    Then a file named "dummy_app/.ruby-version" should exist
    And the file "dummy_app/.ruby-version" should match /[0-9].[0-9].[0-9]/
