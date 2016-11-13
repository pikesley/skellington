module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap' do
      subject.generate 'dummy_app'

      expect('dummy_app/public/sass/_colours.scss').to have_content (
      """
      $brand-primary: rgba(250, 129, 0, 1);
      """
      )
      expect('dummy_app/public/sass/_fonts.scss').to have_content (
      """
      $font-primary: 'Ubuntu Mono';
      """
      )
    end

    it 'sets up sass' do
      subject.generate 'dummy_app'

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
