module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a .ruby-version' do
      subject.options = { framework: 'jekyll' }
      expect { subject.generate 'dummy_app' }.to produce_file 'dummy_app/.ruby-version'
      expect('dummy_app/.ruby-version').to have_content (
      """
      /[0-9]*\\.[0-9]*\\.[0-9]*/
      """
      )
    end
  end
end
