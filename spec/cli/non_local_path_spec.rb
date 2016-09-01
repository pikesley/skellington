module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates an app at a non-local path' do
      subject.generate 'subdir/some_app'
      expect('subdir/some_app/lib/some_app.rb').to have_content (
      """
      require 'sinatra/base'
      require 'tilt/erubis'
      require 'json'
      require 'yaml'

      require_relative 'some_app/helpers'
      require_relative 'some_app/racks'

      module SomeApp
        class App < Sinatra::Base
          helpers do
            include SomeApp::Helpers
          end

          get '/' do
            headers 'Vary' => 'Accept'

            respond_to do |wants|
              wants.html do
                @content = '<h1>Hello from SomeApp</h1>'
                @title = 'SomeApp'
                erb :index, layout: :default
              end

              wants.json do
                {
                  app: 'SomeApp'
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

      expect('subdir/some_app/config.ru').to have_content (
      """
      require File.join(File.dirname(__FILE__), 'lib/some_app.rb')

      run SomeApp::App
      """
      )
    end
  end
end
