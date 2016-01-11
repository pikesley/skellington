module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates some cucumber file' do
      subject.generate 'dummy_app'
      expect('dummy_app/features/dummy_app.feature').to contain (
      """
      Feature: Make sure DummyApp is plumbed in correctly

        Scenario: Get root
          When I send a GET request to \"/\"
          Then the response status should be \"200\"
      """
      )

      expect('dummy_app/features/support/env.rb').to contain (
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
      )

      expect(File).to exist 'dummy_app/features/step_definitions/dummy_app_steps.rb'
    end
  end
end
