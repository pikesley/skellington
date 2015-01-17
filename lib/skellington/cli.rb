module Skellington
  class CLI < Thor
    desc 'generate PATH', 'Generate a skeleton Sinatra app at PATH'
    def generate path
      @g = Generator.new path
      @g.run

    end
  end
end
