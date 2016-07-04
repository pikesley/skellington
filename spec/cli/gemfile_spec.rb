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

      gem 'sinatra', '~> 1.4'
      gem 'rack-conneg'
      gem 'rack-google-analytics'
      gem 'rake'
      gem 'puma'
      gem 'compass'
      gem 'bootstrap-sass'

      group :test do
        gem 'rspec'
        gem 'guard'
        gem 'guard-rspec'
        gem 'guard-jasmine'
        gem 'capybara'
        gem 'coveralls'
        gem 'jasmine'
        gem 'pry'
        gem 'actionpack'
      end
      """
      )
    end
  end
end
