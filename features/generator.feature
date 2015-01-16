Feature: Generate skellington

  Scenario: generate Gemfile
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/Gemfile" should exist
    And the file "dummy_gem/Gemfile" should contain:
    """
    source 'https://rubygems.org'
    """
