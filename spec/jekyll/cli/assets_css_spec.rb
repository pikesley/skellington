module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'sets us sass' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect('dummy_app/assets/application.scss').to have_content (
      """
      ---
      ---

      @import 'bootstrap-custom';
      @import 'bootstrap';
      @import 'fonts';
      """
      )
    end
  end
end
