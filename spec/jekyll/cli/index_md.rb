module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'creates a default index page' do
      subject.options = { framework: 'jekyll' }
      subject.generate 'dummy_app'
      expect(Dir).to exist 'dummy_app/index.md'

      expect('dummy_app/.gitignore').to have_content (
      """
      ---
      ---

      # Hold tight DummyApp
      """
      )
    end
  end
end
