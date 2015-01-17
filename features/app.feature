Feature: Generate skellington

  Scenario: generate app file
    When I successfully run `skellington generate dummy_gem`
    Then a directory named "dummy_gem/lib/" should exist
    And a file named "dummy_gem/lib/dummy_gem.rb" should exist
    And the file "dummy_gem/lib/dummy_gem.rb" should contain:
    """
    require 'sinatra/base'

    class DummyGem < Sinatra::Base
      get '/' do
        'Hello from DummyGem'
      end

      # start the server if ruby file executed directly
      run! if app_file == $0
    end
    """
