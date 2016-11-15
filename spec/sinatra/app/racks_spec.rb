module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates an app file' do
      subject.generate 'dummy-app'
      expect('dummy_app/lib/dummy_app/racks.rb').to have_content (
      """
      require 'rack/conneg'
      require 'rack/tracker'

      module DummyApp
        class App < Sinatra::Base
          set :public_folder, 'public'
          set :views, 'views'

          if CONFIG['google-analytics-tag']
            use Rack::Tracker do
              handler :google_analytics, { tracker: CONFIG['google-analytics-tag'] }
            end
          end

          use Rack::Conneg do |conneg|
            conneg.set :accept_all_extensions, true
            conneg.set :fallback, :html
            conneg.ignore_contents_of 'public'
            conneg.provide [
              :html,
              :json
            ]
          end

          before do
            if negotiated?
              content_type negotiated_type
            end
          end
        end
      end
      """
      )
    end
  end
end
