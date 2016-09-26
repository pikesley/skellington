module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a config.ru file' do
      subject.generate 'dummy_app'
      expect('dummy_app/config.ru').to have_content (
      """
      require File.join(File.dirname(__FILE__), 'lib/dummy_app.rb')

      run DummyApp::App
      """
      )
    end
  end
end
