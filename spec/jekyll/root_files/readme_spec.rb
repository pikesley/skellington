module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a README' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy-app'
      expect('dummy_app/README.md').to have_content (
      """
      # DummyApp
      """
      )
    end
  end
end
