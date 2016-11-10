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
      expect('dummy_app/_sass/colours.scss').to have_content (
      """
      $brand-primary: rgba(250, 129, 0, 1);
      """
      )
      expect('dummy_app/_sass/fonts.scss').to have_content (
      """
      @import url(//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css);
      @import url(//fonts.googleapis.com/css?family=Ubuntu+Mono);

      $font-primary: 'Ubuntu Mono';
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
      @import 'colours';
      @import 'fonts';
      """
      )
    end
  end
end
