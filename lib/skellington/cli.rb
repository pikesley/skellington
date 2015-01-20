module Skellington
  class CLI < Thor
    desc 'version', 'Print the version'
    def version
      puts "skellington version #{VERSION}"
    end
    map %w(-v --version) => :version

    desc 'generate some_path', 'Generate a skeleton Sinatra app named SomePath at some_path'
    def generate wormname
      @g = Generator.new wormname
      @g.run
    end
  end
end
