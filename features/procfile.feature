Feature: Generate skellington

  Scenario: generate Procfile
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/Procfile" should exist
    And the file "dummy_gem/Procfile" should contain:
    """
    web: bundle exec ruby lib/dummy_gem.rb
    """
