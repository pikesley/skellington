RSpec::Matchers.define :have_content do |expected|
  match do |actual|
    actual = File.read actual

    pass = true
    expected.contentise.each_with_index do |line, index|
      unless line.matches actual.contentise[index]
        pass = false
      end
    end
    pass
  end

  failure_message do |actual|
    "expected #{expected} to match #{File.read actual}"
  end

  failure_message_when_negated do |actual|
    "expected #{expected} to not match #{File.read actual}"
  end

  description do
    'matches file content against expectation'
  end
end

class String
  def contentise
    # split into lines, strip spaces from ends, ding blank lines
    self.strip.split("\n").map { |l| l.strip }.reject { |l| l == '' }
  end

  def matches other
    if self.is_regex
      return self.to_regex.match other
    end
    self == other
  end

  def is_regex
    /^\/.*\/$/.match self.strip
  end

  def to_regex
    Regexp.new self[1..-2]
  end
end
