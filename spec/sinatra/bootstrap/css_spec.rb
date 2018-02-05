module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap' do
      subject.generate 'dummy-app'

      expect(File).to exist 'dummy_app/public/sass/palettes/_default.scss'
      expect('dummy_app/public/sass/_colours.scss').to have_content (
      """
      @import 'palettes/default';

      //$brand-primary: $rgba-primary-0;
      //$brand-complement: $rgba-complement-0;
      //$brand-secondary-1: $rgba-secondary-1-0;
      //$brand-secondary-2: $rgba-secondary-2-0;

      $grey: rgb(127, 127, 127);
      $light-grey: lighten($grey, 25%);
      $dark-grey: darken($grey, 25%);

      $theme-colors: (
        primary: $rgba-primary-0,
        secondary: $rgba-secondary-1-0,
        // success: $green,
        // info: $cyan,
        // warning: $yellow,
        // danger: $red,
        // light: $gray-100,
        // dark: $gray-800
      )
      """
      )
      expect('dummy_app/public/sass/_fonts.scss').to have_content (
      """
      $font-primary: 'Ubuntu Mono';
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

      expect('dummy_app/public/sass/_nav.scss').to have_content (
      """
      .navbar-default {
        .navbar-nav {
          li {
            a {
              color: $brand-primary;
            }
          }
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

      .github-corner {
        svg {
          position: absolute;
          top: $navbar-height;
          right: 0;
        }
      }
      """
      )
    end

    it 'sets up sass' do
      subject.generate 'dummy-app'

      expect('dummy_app/public/sass/styles.scss').to have_content (
      """
      @import 'variables';
      @import 'colours';
      @import 'fonts';

      @import 'bootstrap';

      @import 'footer';
      //@import 'github-corner';

      h1 {
        color: map-get($theme-colors, primary);
        font-family: $font-primary;
      }
      """
      )
    end
  end
end
