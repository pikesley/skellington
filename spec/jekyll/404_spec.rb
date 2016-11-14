module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'has a 404 page' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect('dummy_app/404.md').to have_content (
      """
      ---
      title: 404
      permalink: /404.html
      ---

      # Nothing to see here
      """
      )
    end
  end
end
