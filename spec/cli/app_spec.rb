module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates an app file' do
      subject.generate 'dummy_app'
      expect('dummy_app/lib/dummy_app.rb').to contain (
      """
      require 'sinatra/base'
      require 'tilt/erubis'

      require_relative 'dummy_app/racks'
      require_relative 'dummy_app/helpers'

      module DummyApp
        class App < Sinatra::Base
          helpers do
            include DummyApp::Helpers
          end

          get '/' do
            respond_to do |wants|
              wants.html do
                @content = '<h1>Hello from DummyApp</h1>'
                @title = 'DummyApp'
                erb :index, layout: :default
              end

              wants.json do
                {
                  app: 'DummyApp'
                }.to_json
              end
            end
          end

          # start the server if ruby file executed directly
          run! if app_file == $0
        end
      end
      """
      )

      expect('dummy_app/lib/dummy_app/racks.rb').to contain (
      """
      require 'rack/conneg'

      module DummyApp
        class App < Sinatra::Base
          set :public_folder, 'public'
          set :views, 'views'

          use Rack::Conneg do |conneg|
            conneg.set :accept_all_extensions, false
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
