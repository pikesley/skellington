module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates rspec files' do
      subject.generate 'dummy-app'
      expect('dummy_app/spec/spec_helper.rb').to have_content (
      """
      require 'coveralls'
      Coveralls.wear_merged!

      require 'rack/test'
      require 'dummy_app'

      RSpec.configure do |config|
        config.expect_with :rspec do |expectations|
          expectations.include_chain_clauses_in_custom_matcher_descriptions = true
        end

        config.mock_with :rspec do |mocks|
          mocks.verify_partial_doubles = true
        end

        config.order = :random

        include Rack::Test::Methods
        def app
          DummyApp::App
        end
      end
      """
      )

      expect('dummy_app/spec/dummy_app/dummy_app_spec.rb').to have_content (
      """
      module DummyApp
        JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

        describe App do
          it 'says hello' do
            get '/'
            expect(last_response).to be_ok
            expect(last_response.body).to match /Hello from DummyApp/
          end

          it 'serves JSON' do
            get '/', nil, JSON_HEADERS
            expect(last_response).to be_ok
            expect(JSON.parse last_response.body).to eq (
              {
                'app' => 'DummyApp'
              }
            )
          end
        end
      end
      """
      )

      expect('dummy_app/spec/dummy_app/helpers_spec.rb').to have_content (
      """
      class TestHelper
        include DummyApp::Helpers
      end

      module DummyApp
        describe Helpers do
          let(:helpers) { TestHelper.new }

          it 'says hello' do
            expect(helpers.hello).to eq 'Hello'
          end

          it 'has a config' do
            expect(CONFIG).to be_a Hash
          end
        end
      end
      """
      )

      expect('dummy_app/.rspec').to have_content (
      """
      --color
      --require spec_helper
      --format documentation
      """
      )
    end
  end
end
