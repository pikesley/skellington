module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates a Procfile' do
        subject.generate 'dummy-app'
        expect('dummy_app/Procfile').to have_content (
        """
        web: bundle exec rackup -p $PORT
        """
        )
      end
    end
  end
end
