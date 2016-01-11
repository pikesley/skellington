module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Rakefile' do
      subject.generate 'dummy_app'
      expect('dummy_app/Rakefile').to contain (
      """
      require File.join(File.dirname(__FILE__), 'lib/dummy_app.rb')

      unless ENV['RACK_ENV'] == 'production'
        require 'rspec/core/rake_task'
        require 'cucumber/rake/task'

        Cucumber::Rake::Task.new

        task :default => [:cucumber]
      end
      """
      )
    end
  end
end
