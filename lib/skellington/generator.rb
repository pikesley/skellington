module Skellington
  class Generator
    def initialize path
      @path = path
      FileUtils.mkdir_p @path

      @config = YAML.load File.read File.join File.dirname(__FILE__), '..', '..', 'config/config.yaml'

      @files = {
        'Gemfile'=> {
          params: {
            config: @config
          }
        },
        'Rakefile' => {
          params: {
            filename: @path
          }
        },
        'Procfile' => {
          params: {
            filename: @path
          }
        },
        'config.ru' => {
          params: {
            filename: @path,
            camel_name: Skellington.camelise(@path)
          }
        },
        'features/first.feature' => {
          params: {},
          outpath: "features/#{@path}.feature"
        },
        'features/support/env.rb' => {
          params: {
            filename: @path,
            camel_name: Skellington.camelise(@path)
          }
        },
        'lib/app.rb' => {
          params: {
            camel_name: Skellington.camelise(@path)
          },
          outpath: "lib/#{@path}.rb"
        }
      }
    end

    def run
      generate
      git_init
      post_run
    end

    def generate
      puts ''
      @files.each do |k, v|
        t = Template.new k
        t.params = v[:params]
        t.outpath = "#{@path}/#{k}"
        t.outpath = "#{@path}/#{v[:outpath]}" if v[:outpath]
        print "Generating #{t.outpath}..."
        t.write
        puts 'done'
      end
    end

    def git_init
      Git.init @path
    end

    def post_run
      puts ''
      puts "Your new Sinatra app '#{Skellington.camelise(@path)}' has been created"
      t = Template.new 'post-run'
      t.params = { path: @path }
      puts t.to_s
      puts ''
    end
  end
end
