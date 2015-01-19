Feature: Generate skellington

  Scenario: generate Procfile
    When I successfully run `skellington generate dummy_app`
    Then a file named "dummy_app/Procfile" should exist
    And the file "dummy_app/Procfile" should contain:
    """
    web: bundle exec ruby lib/dummy_app.rb
    """
