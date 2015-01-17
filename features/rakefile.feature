Feature: Generate skellington

  Scenario: generate Rakefile
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/Rakefile" should exist
    And the file "dummy_gem/Rakefile" should contain:
    """
    require File.join(File.dirname(__FILE__), 'lib/dummy_gem.rb')

    unless ENV['RACK_ENV'] == 'production'
      require 'rspec/core/rake_task'
      require 'cucumber/rake/task'

      Cucumber::Rake::Task.new

      task :default => [:cucumber]
    end
    """
