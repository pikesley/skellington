module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a config.rb file' do
      subject.generate 'dummy_app'
      expect('dummy_app/config.rb').to have_content (
      """
      require 'bootstrap-sass'

      css_dir = 'public/css'
      sass_dir = 'public/sass'
      """
      )
    end
  end
end
