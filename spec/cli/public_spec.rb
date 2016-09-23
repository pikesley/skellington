module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates placeholders for static files' do
      expect { subject.generate 'dummy_app' }.to produce_file 'dummy_app/public/css/styles.css'
      expect(File).to exist 'dummy_app/public/js/dummy_app.js'
      expect(File).to exist 'dummy_app/public/assets/favicon.ico'
      expect('dummy_app/public/sass/styles.scss').to have_content (
      """
      @import 'bootstrap';
      @import 'fonts';
      @import 'variables';
      @import 'footer';
      @import 'github-corner';

      h1 {
        color: $brand-primary;
        font-family: $font-primary;
      }
      """
      )

      expect('dummy_app/public/sass/_variables.scss').to have_content (
      """
      $footer-height: 40px;
      $brand-primary: #fa8100;
      """
      )

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

        margin-top: $padding-large-vertical;
        background: $brand-primary;
        color: white;
        height: $footer-height;

        padding: $padding-large-vertical $padding-large-horizontal;

        a {
          color: white;
        }
      }
      """
      )

      expect('dummy_app/public/sass/_github-corner.scss').to have_content (
      """
      .octo-background {
        fill: $brand-primary;
      }

      .octo-arm, .octo-body {
        fill: white;
      }

      .github-corner:hover .octo-arm {
        animation: octocat-wave 560ms ease-in-out
      }

      @keyframes octocat-wave {
        0%, 100% {
          transform: rotate(0)
        }

        20%, 60% {
          transform: rotate(-25deg)
        }

        40%, 80% {
          transform: rotate(10deg)
        }
      }

      @media (max-width: 500px) {
        .github-corner:hover .octo-arm {
          animation: none
        }

        .github-corner .octo-arm {
          animation: octocat-wave 560ms ease-in-out
        }
      }
      """
      )

      expect('dummy_app/public/sass/_fonts.scss').to have_content (
      """
      @import 'https://fonts.googleapis.com/css?family=Lobster';
      $font-primary: 'Lobster';
      """
      )
    end
  end
end
