module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates placeholders for static files' do
      subject.options = { 'bootstrap' => '4' }
      subject.generate 'dummy-app'

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

        text-align: center;

        margin-top: $padding-large-vertical;
        background: map-get($theme-colors, primary);
        color: white;
        height: $footer-height;

        padding: $padding-large-vertical $padding-large-horizontal;

        ul {
          @extend .list-inline;
        }

        a {
          color: white;
        }
      }
      """
      )
    end
  end
end
