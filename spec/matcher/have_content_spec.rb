describe 'Matcher' do
  context 'simple matches' do
    it 'matches a file and a string' do
      dump 'A string'
      expect('matcher').to have_content 'A string'
    end

    it 'matches two strings ignoring extra whitespace' do
      dump ' Leading space'
      expect('matcher').to have_content 'Leading space'

      dump 'Trailing space '
      expect('matcher').to have_content 'Trailing space'

      dump ' Space at both ends '
      expect('matcher').to have_content 'Space at both ends'
    end

    it 'does not match wrong strings' do
      dump 'A string'
      expect('matcher').to_not have_content 'A different string'
    end
  end

  context 'multi-line matches' do
    it 'matches on multi-line files' do
      dump """
      foo
      bar
      baz
      """
      expect('matcher').to have_content (
      """
      foo
      bar
      baz
      """
      )
    end

    it 'matches multi-line, ignoring extraneous whitespace' do
      dump """
      odd
        spacing
          here
      """
      expect('matcher').to have_content (
      """
      odd
      spacing
      here
      """
      )
    end

    it 'ignores blank lines' do
      dump """

      this
      has
    a blank
      """
      expect('matcher').to have_content (
      """
      this
      has
      a blank
      """
      )
    end

    it 'even blank lines in the middle of the file' do
      dump """
      this
      is

      a
      file
      """
      expect('matcher').to have_content (
      """
      this
      is
      a
      file
      """
      )
    end
  end

  context 'regular expressions' do
    it 'matches on a regex' do
      dump 'partial match'
      expect('matcher').to have_content '/partial/'
    end

    it 'matches on a regex somewhere in a file' do
      dump """
      source 'https://rubygems.org'

      ruby '2.3.0'

      gem 'skellington'
      """
      expect('matcher').to have_content (
      """
      source 'https://rubygems.org'

      /ruby '[0-9]*\.[0-9]*\.[0-9]*'/

      gem 'skellington'
      """
      )
    end

    it 'fails on a non-match' do
      dump """
      foo
        ruby '2.3.0'
      bar
      """
      expect('matcher').to_not have_content (
      """
      foo
      ruby 2.3.0
      bar
      """
      )
    end
  end
end

def dump content
  File.open 'matcher', 'w' do |f|
    f.write content
  end
end
