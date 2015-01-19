require 'sinatra/base'

class Derp < Sinatra::Base
  get '/' do
    'Hello from Derp'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
