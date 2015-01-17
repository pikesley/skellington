Feature: Generate skellington

  Scenario: generate feature
    When I successfully run `skellington generate dummy_gem`
    Then a directory named "dummy_gem/features" should exist
    And a file named "dummy_gem/features/dummy_gem.feature" should exist
    And the file "dummy_gem/features/dummy_gem.feature" should contain:
    """
    Feature: Make sure it's plumbed in correctly

      Scenario: Get root
        When I send a GET request to "/"
        Then the response status should be "200"
    """

  Scenario: generate env.rb
    When I successfully run `skellington generate dummy_gem`
    And a file named "dummy_gem/features/support/env.rb" should exist
    And the file "dummy_gem/features/support/env.rb" should contain:
    """
    DummyGem
    """
