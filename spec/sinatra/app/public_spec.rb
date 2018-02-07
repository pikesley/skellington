module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates placeholders for static files' do
        subject.generate 'dummy-app'

        expect(File).to exist 'dummy_app/public/js/dummy_app.js'
        expect(File).to exist 'dummy_app/public/assets/favicon.ico'
      end
    end
  end
end
