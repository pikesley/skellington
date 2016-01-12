require 'skellington'
require 'coveralls'

Coveralls.wear_merged!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random

  # Use tmp/ to write skellington
  $pwd = FileUtils.pwd
  config.before(:each) do
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir_p 'tmp'
    FileUtils.cd 'tmp'
  end

  config.after(:each) do
    FileUtils.cd $pwd
  end

  # Suppress CLI output. This *will* fuck with Pry
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    # Redirect stderr and stdout
    $stderr = File.new '/dev/null', 'w'
    $stdout = File.new '/dev/null', 'w'
  end

  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
