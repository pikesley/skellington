module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect('dummy_app/_sass/bootstrap.scss').to have_content (
      """
      /*!
       * Bootstrap v3.3.7 (http://getbootstrap.com)
       * Copyright 2011-2016 Twitter, Inc.
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

      $brand-primary: $rgba-primary-0;
      //$brand-complement: $rgba-complement-0;
      //$brand-secondary-1: $rgba-secondary-1-0;
      //$brand-secondary-2: $rgba-secondary-2-0;

      $grey: rgb(127, 127, 127);
      $light-grey: lighten($grey, 25%);
      $dark-grey: darken($grey, 25%);
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
    end

    it 'sets up sass' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect('dummy_app/css/styles.scss').to have_content (
      """
      ---
      ---
      @import 'bootstrap';
      @import 'variables';
      @import 'fonts';
      @import 'colours';
      @import 'footer';
      //@import 'github-corner';

      h1 {
        color: $brand-primary;
        font-family: $font-primary;
      }
      """
      )
    end
  end
end
