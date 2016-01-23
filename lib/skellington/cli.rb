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
      s = <<HEREDOC
Some other things you might find useful (sweeten to taste):

* Set up continuous integration in Travis:

    gem install travis
    travis init
    git add .travis.yml

* Configure a Heroku app:

    gem install heroku
    heroku apps:create YOUR-APP-NAME-HERE --region=eu

* Get Travis to continuously deploy to Heroku:

    travis setup heroku

* Add some badges to your README

    gem install badgerbadgerbadger
    badger > README.md
    git add README.md
HEREDOC
      puts s
    end
  end
end
