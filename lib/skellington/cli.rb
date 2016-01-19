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

    desc 'postinstall', 'Show some helpful hints'
    def postinstall
      s = 'Some other things you might find useful (sweeten to taste):'
      s << "\n\n"
      s << '* Set up continuous integration in Travis:'
      s << "\n\n"
      s << '    travis init'
      s << "\n\n"
      s << '* Configure a Heroku app:'
      s << "\n\n"
      s << "    heroku apps:create YOUR-APP-NAME-HERE --region=eu"
      s << "\n\n"
      s << '* Get Travis to continuously deploy to Heroku:'
      s << "\n\n"
      s << '    travis setup heroku'
      s << "\n\n"
      s << "(This all depends on you having Travis and Heroku installed and configured)"

      puts s
    end
  end
end
