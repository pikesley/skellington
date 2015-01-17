Feature: Generate skellington

  Scenario: git init the repo
    When I successfully run `skellington generate dummy_gem`
    Then a directory named "dummy_gem/.git/" should exist
