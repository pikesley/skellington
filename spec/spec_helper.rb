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

  config.before(:each) do
    FileUtils.rm_rf 'tmp'
    FileUtils.mkdir_p 'tmp'
    FileUtils.cd 'tmp'
  end

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

RSpec::Matchers.define :contain do |expected|
  match do |actual|
    x = expected.split("\n").map { |l| l.strip }.reject { |m| m == '' }
    a = File.readlines(actual).map { |l| l.strip }.reject { |m| m == '' }

    pass = true
    x.each_with_index do |e, i|
      if /^\/.*\/$/.match e.strip
        unless Regexp.new(e.strip[1..-2]).match a[i].strip
          pass = false
        end
      else
        unless e.strip == a[i].strip
          pass = false
        end
      end
    end
    pass
  end
end
