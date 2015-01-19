module Skellington
  class CLI < Thor
    desc 'version', 'Print the version'
    def version
      puts "skellington version #{VERSION}"
    end
    map %w(-v --version) => :version

    desc 'generate PATH', 'Generate a skeleton Sinatra app at PATH'
    def generate path
      @g = Generator.new path
      @g.run
    end
  end
end
