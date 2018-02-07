module Skellington
  describe CLI do
    context 'sinatra' do
      let :subject do
        described_class.new
      end

      it 'generates an app file' do
        subject.generate 'dummy-app'
        expect('dummy_app/lib/dummy_app.rb').to have_content (
        """
        require 'sinatra/base'
        require 'tilt/erubis'
        require 'json'
        require 'yaml'

        require_relative 'dummy_app/helpers'
        require_relative 'dummy_app/racks'

        module DummyApp
          class App < Sinatra::Base
            helpers do
              include DummyApp::Helpers
            end

            get '/' do
              headers 'Vary' => 'Accept'

              respond_to do |wants|
                wants.html do
                  @content = '<h1>Hello from DummyApp</h1>'
                  @title = 'DummyApp'
                  @github_url = CONFIG['github_url']
                  erb :index
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

            not_found do
              status 404
              @title = '404'
              erb :oops
            end
          end
        end
        """
        )
      end
    end
  end
end
