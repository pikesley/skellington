Feature: Generate skellington

  Scenario: git init the repo
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/.git/" should exist
