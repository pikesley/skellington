module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates placeholders for static files' do
      subject.options = { 'bootstrap' => '4' }
      subject.generate 'dummy_app'

      expect('dummy_app/public/sass/_footer.scss').to have_content (
      """
      html {
        position: relative;
        min-height: 100%;
      }

      body {
        margin-bottom: $footer-height;
      }

      .footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: $footer-height;
        line-height: $footer-height;
        text-align: center;
        background: $brand-primary;
      }
      """
      )
    end
  end
end
