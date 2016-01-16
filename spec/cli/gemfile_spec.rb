module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Gemfile' do
      subject.generate 'dummy_app'
      expect('dummy_app/Gemfile').to have_content (
      """
      source 'https://rubygems.org'

      /ruby '[0-9]*\\.[0-9]*\\.[0-9]*'/

      gem 'sinatra'
      gem 'rack-conneg'
      gem 'rack-google-analytics'
      gem 'rake'
      gem 'puma'

      group :test do
        gem 'cucumber'
        gem 'rspec'
        gem 'guard'
        gem 'guard-rspec'
        gem 'guard-jasmine'
        gem 'guard-cucumber'
        gem 'capybara'
        gem 'coveralls'
        gem 'jasmine'
        gem 'pry'
        gem 'actionpack'
        gem 'cucumber-api-steps', require: false
      end
      """
      )
    end
  end
end
