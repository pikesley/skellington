Feature: Generate skellington

  Scenario: generate app at a non-local path
    When I successfully run `skellington generate subdir/some_app`
    Then a directory named "subdir/some_app/lib/" should exist
    And a file named "subdir/some_app/lib/some_app.rb" should exist
    And the file "subdir/some_app/lib/some_app.rb" should contain:
    """
    require 'sinatra/base'

    class SomeApp < Sinatra::Base
      get '/' do
        'Hello from SomeApp'
      end

      # start the server if ruby file executed directly
      run! if app_file == $0
    end
    """
    And a file named "subdir/some_app/config.ru" should exist
    And the file "subdir/some_app/config.ru" should contain:
    """
    require 'rubygems'
    require File.join(File.dirname(__FILE__), 'lib/some_app.rb')

    run SomeApp
    """
