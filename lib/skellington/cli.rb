module Skellington
  class CLI < Thor
    desc 'version', 'Print the version'
    def version
      puts "skellington version #{VERSION}"
    end
    map %w(-v --version) => :version

    desc 'generate some_path', 'Generate a skeleton Sinatra app named SomePath at some_path'
    method_option :licensor,
                  aliases: '-l',
                  description: 'Name to insert into the license file'
    def generate wormname
      @g = Generator.new wormname
      @g.licensor = options[:licensor]
      @g.run
    end

    desc 'postinstall', 'Show some helpful hints'
    def postinstall
      s = 'For some other things you might find useful, see this gist:'
      s << "\n\n"
      s << '    https://gist.github.com/pikesley/1789cab7b10f0d8765d4'
      puts s
    end
  end
end
