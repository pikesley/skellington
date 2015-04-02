Feature: Generate skellington

  Scenario: generate app file
    When I successfully run `skellington generate dummy_app`
    Then a directory named "dummy_app/lib/" should exist
    And a file named "dummy_app/lib/dummy_app.rb" should exist
    And the file "dummy_app/lib/dummy_app.rb" should contain:
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
