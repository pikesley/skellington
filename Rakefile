require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
RSpec::Core::RakeTask.new

task :default => [:spec, 'coveralls:push']
