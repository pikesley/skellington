module Skellington
  class CLI < Thor
    desc 'generate', 'Generate a skeleton Sinatra app'
    def generate path
      @g = Generator.new path
    end
  end
end
