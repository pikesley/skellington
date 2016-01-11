module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates rspec files' do
      subject.generate 'dummy_app'
      expect('dummy_app/spec/spec_helper.rb').to contain (
      """
      require 'coveralls'
      Coveralls.wear_merged!

      require 'dummy_app'

      RSpec.configure do |config|
        config.expect_with :rspec do |expectations|
          expectations.include_chain_clauses_in_custom_matcher_descriptions = true
        end

        config.mock_with :rspec do |mocks|
          mocks.verify_partial_doubles = true
        end

        config.order = :random
      end
      """
      )

      expect('dummy_app/spec/dummy_app/dummy_app_spec.rb').to contain (
      """
      module DummyApp
        describe App do
          it 'knows the truth' do
            expect(true).to eq true
          end
        end
      end
      """
      )
    end
  end
end
