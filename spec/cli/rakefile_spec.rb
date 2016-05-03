module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Rakefile' do
      subject.generate 'dummy_app'
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

      task :run do
        sh 'bundle exec compass watch . &'
        sh 'bundle exec rackup'
      end
      """
      )
    end
  end
end
