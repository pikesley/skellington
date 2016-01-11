module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Gemfile' do
      subject.generate 'dummy_app'
      expect('dummy_app/Gemfile').to contain (
      """
      source 'https://rubygems.org'

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
      )
    end
  end
end
