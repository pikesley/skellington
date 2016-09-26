module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Gemfile' do
      subject.options = { framework: 'jekyll' }
      subject.generate 'dummy_app'
      expect('dummy_app/Gemfile').to have_content (
      """
      source 'https://rubygems.org'

      gem 'github-pages'
      gem 'bootstrap', '~> 4.0.0.alpha4'
      gem 'rake'
      """
      )
    end
  end
end
