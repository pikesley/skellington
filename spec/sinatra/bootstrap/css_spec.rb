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

      $brand-primary: $rgba-primary-0;
      //$brand-complement: $rgba-complement-0;
      //$brand-secondary-1: $rgba-secondary-1-0;
      //$brand-secondary-2: $rgba-secondary-2-0;

      $grey: rgb(127, 127, 127);
      $light-grey: lighten($grey, 25%);
      $dark-grey: darken($grey, 25%);
      """
      )
      expect('dummy_app/public/sass/_fonts.scss').to have_content (
      """
      $font-primary: 'Ubuntu Mono';
      """
      )
    end

    it 'sets up sass' do
      subject.generate 'dummy-app'

      expect('dummy_app/public/sass/styles.scss').to have_content (
      """
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
