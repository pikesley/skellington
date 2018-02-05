module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates a Gemfile' do
        subject.generate 'dummy-app'
        expect('dummy_app/Gemfile').to have_content (
        """
        source 'https://rubygems.org'

        /ruby '[0-9]*\\.[0-9]*\\.[0-9]*'/

        gem 'sinatra', '~> 1.4'
        gem 'rack-conneg'
        gem 'rack-tracker'
        gem 'rake'
        gem 'compass'
        gem 'bootstrap'
        gem 'erubis'
        gem 'puma'

        group :test do
          gem 'rspec'
          gem 'guard'
          gem 'guard-rspec'
          gem 'guard-jasmine'
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
end
