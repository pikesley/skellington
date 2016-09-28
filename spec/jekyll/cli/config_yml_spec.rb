module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a _config.yml file' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'
      expect('dummy_app/_config.yml').to have_content (
      """
      ---
      defaults:
      - scope:
          path: ''
        values:
          layout: default
      permalink: pretty
      """
      )
    end
  end
end
