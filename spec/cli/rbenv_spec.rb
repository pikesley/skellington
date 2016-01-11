module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a .ruby-version' do
      subject.generate 'dummy_app'
      expect(File).to exist 'dummy_app/.ruby-version'
      expect('dummy_app/.ruby-version').to contain (
      """
      /[0-9]*\.[0-9]*\.[0-9]*/
      """
      )
    end
  end
end
