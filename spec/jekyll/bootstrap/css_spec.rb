module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy-app'

      expect('dummy_app/_sass/bootstrap.scss').to have_content (
      """
      /*!
       * Bootstrap v4.0.0 (https://getbootstrap.com)
       * Copyright 2011-2018 The Bootstrap Authors
       * Copyright 2011-2018 Twitter, Inc.
       * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
       */
      """
      )

      expect('dummy_app/_sass/variables.scss').to have_content (
      """
      $footer-height: 40px;
      """
      )

      expect('dummy_app/_sass/fonts.scss').to have_content (
      """
      $font-primary: 'Ubuntu Mono';
      """
      )

      expect(File).to exist 'dummy_app/_sass/palettes/default.scss'
      expect('dummy_app/_sass/colours.scss').to have_content (
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

      expect('dummy_app/_sass/footer.scss').to have_content (
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

    it 'sets up sass' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy-app'

      expect('dummy_app/css/styles.scss').to have_content (
      """
      ---
      ---
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
