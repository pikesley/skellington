require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new

namespace :specs do
  desc 'run the trustworthy specs'
  task :safe do
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.rspec_opts = "--tag ~troublesome"
    end
    Rake::Task['spec'].execute
  end

  desc 'run the shonky specs'
  task :shaky do
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.rspec_opts = "--tag troublesome"
    end
    Rake::Task['spec'].execute
  end

  desc 'run all the specs'
  task :all do
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.rspec_opts = "--tag troublesome"
    end
    
    RSpec::Core::RakeTask.new(:spec) do |t|
      t.rspec_opts = "--tag ~troublesome"
    end

    Rake::Task['spec'].execute
  end
end

task :default => ['specs:all', 'coveralls:push']
