require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'yaml'

require_relative '<%= @gen.wormname %>/helpers'
require_relative '<%= @gen.wormname %>/racks'

module <%= @gen.camelname %>
  class App < Sinatra::Base
    helpers do
      include <%= @gen.camelname %>::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Hello from <%= @gen.camelname %></h1>'
          @title = '<%= @gen.camelname %>'
          @github_url = CONFIG['github_url']
          erb :index
        end

        wants.json do
          {
            app: '<%= @gen.camelname %>'
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
