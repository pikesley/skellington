Feature: Generate skellington

  Scenario: generate Gemfile
    When I successfully run `skellington generate dummy_app`
    Then a file named "dummy_app/Gemfile" should exist
    And the file "dummy_app/Gemfile" should contain:
    """
    source 'https://rubygems.org'

    ruby '
    """

    And the file "dummy_app/Gemfile" should contain:
    """
    gem 'sinatra'
    gem 'thin'
    gem 'rake'

    group :test do
      gem 'cucumber'
      gem 'capybara'
      gem 'guard'
      gem 'guard-cucumber'
      gem 'pry'
      gem 'cucumber-api-steps', require: false
    end
    """
