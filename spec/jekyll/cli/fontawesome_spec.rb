module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs fontawesome' do
      subject.options = { framework: 'jekyll' }
      subject.generate 'dummy_app'

      expect(Dir).to exist 'dummy_app/fonts/font-awesome'
      expect('dummy_app/fonts/font-awesome/fontawesome-webfont.svg').to have_content (
      %{<?xml version="1.0" standalone="no"?>
      <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" >
      <svg xmlns="http://www.w3.org/2000/svg">
      <metadata></metadata>}
      )

      expect(Dir).to exist 'dummy_app/_sass/font-awesome'
      expect('dummy_app/_sass/font-awesome.scss').to have_content (
      """
      /*!
       *  Font Awesome 4.6.2 by @davegandy - http://fontawesome.io - @fontawesome
       *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)
       */
      """
      )
    end
  end
end
