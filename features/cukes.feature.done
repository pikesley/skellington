Feature: Generate skellington

  Scenario: generate feature
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/features" should exist
    And a file named "dummy_app/features/dummy_app.feature" should exist
    And the file "dummy_app/features/dummy_app.feature" should contain:
    """
    Feature: Make sure DummyApp is plumbed in correctly

      Scenario: Get root
        When I send a GET request to "/"
        Then the response status should be "200"
    """

  Scenario: generate env.rb
    When I successfully run `skellington generate dummy_app`
    And a file named "dummy_app/features/support/env.rb" should exist
    And the file "dummy_app/features/support/env.rb" should contain:
    """
    ENV['RACK_ENV'] = 'test'

    require File.join(File.dirname(__FILE__), '..', '..', 'lib/dummy_app.rb')

    require 'capybara'
    require 'capybara/cucumber'
    require 'rspec'
    require 'cucumber/api_steps'

    Capybara.app = DummyApp

    class DummyAppWorld
      include Capybara::DSL
      include RSpec::Expectations
      include RSpec::Matchers

      def app
        DummyApp
      end
    end

    World do
      DummyAppWorld.new
    end
    """

  Scenario: generate 'step_defintions' directory
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/features/step_definitions" should exist
    And a file named "dummy_app/features/step_definitions/dummy_app_steps.rb" should exist
