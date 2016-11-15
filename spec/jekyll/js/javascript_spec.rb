module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'installs bootstrap' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect(File).to exist 'dummy_app/js/dummy_app.js'
    end
  end
end
