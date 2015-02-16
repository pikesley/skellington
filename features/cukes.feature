Feature: Generate skellington

  Scenario: generate feature
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/features" should exist
    And a file named "dummy_app/features/dummy_app.feature" should exist
    And the file "dummy_app/features/dummy_app.feature" should contain:
    """
    Feature: Make sure it's plumbed in correctly

      Scenario: Get root
        When I send a GET request to "/"
        Then the response status should be "200"
    """

  Scenario: generate env.rb
    When I successfully run `skellington generate dummy_app`
    And a file named "dummy_app/features/support/env.rb" should exist
    And the file "dummy_app/features/support/env.rb" should contain:
    """
    DummyApp
    """

  Scenario: generate 'step_defintions' directory
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/features/step_definitions" should exist
    And a file named "dummy_app/features/step_definitions/dummy_app_steps.rb" should exist
