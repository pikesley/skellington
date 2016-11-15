module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'creates a favicon' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy-app'

      expect(File).to exist 'dummy_app/assets/favicon.ico'
    end
  end
end
