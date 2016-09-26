module Skellington
  class Generator
    attr_reader :path, :filename, :camelname, :files, :gems, :framework
    attr_accessor :licensor

    def initialize path, options = {}
      @framework = options[:framework] ? options[:framework] : 'sinatra'
      @full_path = path
      @path = File.dirname @full_path
      @filename = File.basename(@full_path)
      @camelname = Skellington.camelise(wormname)
      @gems = config[@framework]['gems']
      @files = config[@framework]['files']
    end

    def config
      @config ||= YAML.load File.read File.join File.dirname(__FILE__), '..', '..', 'config/config.yaml'
    end

    def run
      if File.exist? @full_path
        $stderr.puts "Path '#{@full_path}' already exists. Quitting"
        exit 1
      end

      generate
      git_init
      post_run
    end

    def generate
      @files.each do |k, v|
        t = Template.new k, self
        t.write
      end

      if @framework == 'jekyll'
        root = "#{self.path}/#{self.wormname}"

        FileUtils.mkdir_p "#{root}/javascripts"
        FileUtils.cp_r "#{Bootstrap.assets_path}/javascripts/bootstrap", "#{root}/javascripts"
        FileUtils.cp "#{Bootstrap.assets_path}/javascripts/bootstrap.min.js", "#{root}/javascripts"

        FileUtils.mkdir_p "#{root}/_sass"
        FileUtils.cp_r "#{Bootstrap.assets_path}/stylesheets/bootstrap", "#{root}/_sass"
        FileUtils.cp "#{Bootstrap.assets_path}/stylesheets/_bootstrap.scss", "#{root}/_sass/bootstrap.scss"

        FileUtils.cp_r "#{FontAwesome::Sass.assets_path}/fonts", "#{root}/"
        FileUtils.cp_r "#{FontAwesome::Sass.assets_path}/stylesheets/font-awesome", "#{root}/_sass"
        FileUtils.cp "#{FontAwesome::Sass.assets_path}/stylesheets/_font-awesome.scss", "#{root}/_sass/font-awesome.scss"
      end
    end

    def wormname
      @filename.gsub('-', '_')
    end

    def renamed
      @filename != wormname
    end

    def git_init
      Git.init wormname
    end

    def post_run
      t = Template.new 'post-run', self
      puts t.to_s
    end
  end
end
