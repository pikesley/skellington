Feature: Generate skellington

  Scenario: generate Gemfile
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/Gemfile" should exist
    And the file "dummy_gem/Gemfile" should contain:
    """
    source 'https://rubygems.org'

    ruby '
    """

    And the file "dummy_gem/Gemfile" should contain:
    """
    gem 'sinatra'
    gem 'thin'
    gem 'rake'

    group :test do
      gem 'cucumber'
      gem 'capybara'
      gem 'guard-cucumber'
      gem 'cucumber-api-steps', require: false
    end
    """