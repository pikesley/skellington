module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates some cucumber file' do
      expect { subject.generate 'dummy_app' }.to produce_file 'dummy_app/features/step_definitions/dummy_app_steps.rb'

      expect('dummy_app/features/dummy_app.feature').to have_content (
      """
      Feature: Make sure DummyApp is plumbed in correctly

        Scenario: Get root
          When I send a GET request to \"/\"
          Then the response status should be \"200\"
      """
      )

      expect('dummy_app/features/json.feature').to have_content (
      """
      Feature: Get JSON

      Background:
        Given I send and accept JSON

      Scenario: Get JSON for a repo
        When I send a GET request to \"/\"
        Then the response status should be \"200\"
        And the JSON response should have \"$app\" with the text \"DummyApp\"
      """
      )

      expect('dummy_app/features/support/env.rb').to have_content (
      """
      ENV['RACK_ENV'] = 'test'
      require 'coveralls'
      Coveralls.wear!
      
      require File.join(File.dirname(__FILE__), '..', '..', 'lib/dummy_app.rb')

      require 'capybara'
      require 'capybara/cucumber'
      require 'rspec'
      require 'cucumber/api_steps'
      require 'active_support/core_ext/object/blank'

      Capybara.app = DummyApp

      class DummyAppWorld
        include Capybara::DSL
        include RSpec::Expectations
        include RSpec::Matchers

        def app
          DummyApp::App
        end
      end

      World do
        DummyAppWorld.new
      end
      """
      )
    end
  end
end
