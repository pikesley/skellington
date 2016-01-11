module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'app file' do
      subject.generate 'dummy_app'
      expect('dummy_app/lib/dummy_app.rb').to contain (
      """
      require 'sinatra/base'

      class DummyApp < Sinatra::Base
        get '/' do
          @content = '<h1>Hello from DummyApp</h1>'
          @title = 'DummyApp'
          erb :index, layout: :default
        end

        # start the server if ruby file executed directly
        run! if app_file == $0
      end
      """
      )
    end
  end
end
