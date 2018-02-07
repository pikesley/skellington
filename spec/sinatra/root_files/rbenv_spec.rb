module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates a .ruby-version' do
        expect { subject.generate 'dummy-app' }.to produce_file 'dummy_app/.ruby-version'
        expect('dummy_app/.ruby-version').to have_content (
        """
        /[0-9]*\\.[0-9]*\\.[0-9]*/
        """
        )
      end
    end
  end
end
