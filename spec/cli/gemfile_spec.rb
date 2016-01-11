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

      /ruby [0-9]*\.[0-9]*\.[0-9]*/

      gem 'sinatra'
      gem 'puma'
      gem 'rake'
      gem 'rack-conneg'

      group :test do
        gem 'cucumber'
        gem 'capybara'
        gem 'coveralls'
        gem 'jasmine'
        gem 'rspec'
        gem 'guard-rspec'
        gem 'guard-jasmine'
        gem 'guard'
        gem 'guard-cucumber'
        gem 'pry'
        gem 'actionpack'
        gem 'cucumber-api-steps', require: false
      end
      """
      )
    end
  end
end
