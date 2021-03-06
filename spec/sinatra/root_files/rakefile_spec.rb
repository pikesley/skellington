module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Rakefile' do
      subject.generate 'dummy-app'
      expect('dummy_app/Rakefile').to have_content (
      """
      require File.join(File.dirname(__FILE__), 'lib/dummy_app.rb')

      unless ENV['RACK_ENV'] == 'production'
        require 'rspec/core/rake_task'
        require 'coveralls/rake/task'
        require 'jasmine'
        load 'jasmine/tasks/jasmine.rake'

        RSpec::Core::RakeTask.new
        Coveralls::RakeTask.new

        task :default => [:spec, 'jasmine:ci', 'coveralls:push']
      end

      namespace :run do
        desc 'start app'
        task :app do
          sh 'rackup -o 0.0.0.0'
        end

        desc 'clean-up and run compass'
        task :sass do
          sh 'compass clean && compass watch'
        end
      end
      """
      )
    end
  end
end
