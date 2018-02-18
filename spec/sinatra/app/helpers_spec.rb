module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates an app file' do
        subject.generate 'dummy-app'
        expect('dummy_app/lib/dummy_app/helpers.rb').to have_content (
        """
        module DummyApp
          CONFIG = YAML.load_file('config/config.yml') || {}

          module Helpers
            def hello
              'Hello'
            end
          end
        end
        """
        )
      end
    end
  end
end
