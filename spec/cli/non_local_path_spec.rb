module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates an app at a non-local path' do
      subject.generate 'subdir/some_app'
      expect('subdir/some_app/lib/some_app.rb').to contain (
      """
      require 'sinatra/base'

      class SomeApp < Sinatra::Base
        get '/' do
          @content = '<h1>Hello from SomeApp</h1>'
          @title = 'SomeApp'
          erb :index, layout: :default
        end

        # start the server if ruby file executed directly
        run! if app_file == $0
      end
      """
      )

      expect('subdir/some_app/config.ru').to contain (
      """
      require 'rubygems'
      require File.join(File.dirname(__FILE__), 'lib/some_app.rb')

      run SomeApp
      """
      )
    end
  end
end
