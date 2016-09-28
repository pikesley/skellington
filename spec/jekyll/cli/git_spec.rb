module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'initialises a git repo' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'
      expect(Dir).to exist 'dummy_app/.git'

      expect('dummy_app/.gitignore').to have_content (
      """
      _site/
      .sass-cache
      """
      )
    end
  end
end
