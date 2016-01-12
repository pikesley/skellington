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
        require 'cucumber/rake/task'
        require 'coveralls/rake/task'
        require 'jasmine'
        load 'jasmine/tasks/jasmine.rake'

        Cucumber::Rake::Task.new
        RSpec::Core::RakeTask.new
        Coveralls::RakeTask.new

        task :default => [:cucumber, :spec, 'jasmine:ci', 'coveralls:push']
      end
      """
      )
    end
  end
end
