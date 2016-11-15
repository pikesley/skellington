module Skellington
  describe CLI, troublesome: true do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap 4' do
      subject.options = { 'framework' => 'jekyll', 'bootstrap' => 4 }
      subject.generate 'dummy-app'

    #  expect(Dir).to exist 'dummy_app/javascripts/bootstrap'
    #  expect('dummy_app/javascripts/bootstrap.min.js').to have_content (
    #  """
    #  /*!
    #   * Bootstrap v4.0.0-alpha.5 (https://getbootstrap.com)
    #   * Copyright 2011-2016 The Bootstrap Authors (https://github.com/twbs/bootstrap/graphs/contributors)
    #   * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
    #   */
    #  """
    #  )

      expect(Dir).to exist 'dummy_app/_sass/bootstrap'
      expect('dummy_app/_sass/bootstrap.scss').to have_content (
      """
      /*!
       * Bootstrap v4.0.0-alpha.5 (https://getbootstrap.com)
       * Copyright 2011-2016 The Bootstrap Authors
       * Copyright 2011-2016 Twitter, Inc.
       * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
       */
      """
      )
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
      expect('dummy_app/_sass/fonts.scss').to have_content (
      """
      $font-primary: 'Ubuntu Mono';
      """
      )
    end
  end
end
