module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates placeholders for static files' do
      expect { subject.generate 'dummy_app' }.to produce_file 'dummy_app/public/css/styles.css'
      expect(File).to exist 'dummy_app/public/js/dummy_app.js'
      expect(File).to exist 'dummy_app/public/assets/favicon.ico'
      expect('dummy_app/public/sass/styles.scss').to have_content (
      """
      @import 'bootstrap';
      """
      )
    end
  end
end
