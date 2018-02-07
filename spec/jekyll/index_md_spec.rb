module Skellington
  describe CLI do
    context 'jekyll' do
      let :subject do
        described_class.new
      end

      it 'creates a default index page' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'

        expect('dummy_app/index.md').to have_content (
        """
        ---
        ---

        # Hello from DummyApp
        """
        )
      end
    end
  end
end
