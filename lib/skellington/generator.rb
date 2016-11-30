module Skellington
  class Generator
    attr_reader :path,
                :filename,
                :originalname,
                :camelname,
                :files,
                :gems,
                :framework,
                :bootstrap
    attr_accessor :licensor

    def initialize path, options = {}
      @framework = options.fetch('framework', 'sinatra')
      @bootstrap = options.fetch('bootstrap', 3).to_s
      @full_path = path
      @path = File.dirname @full_path
      @filename = File.basename(@full_path)
      @originalname = @filename
      @camelname = Skellington.camelise(wormname)
      @gems = config[@framework]['gems']
      @files = config[@framework]['files'].merge Hash[config['common']['files'].map { |f| [f, nil] }]
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
      strap_boots
      git_init
      post_run
    end

    def generate
      @files.each do |k, v|
        t = Template.new k, self
        t.write
      end
    end

    def strap_boots
      if @framework == 'jekyll'
        if @bootstrap == '4'
          Object.send(:remove_const, :Bootstrap)
          require 'bootstrap'
        end

        root = "#{self.path}/#{self.wormname}"

        FileUtils.mkdir_p "#{root}/_sass"
        FileUtils.cp_r "#{Bootstrap.assets_path}/stylesheets/bootstrap", "#{root}/_sass"
        FileUtils.cp "#{Bootstrap.assets_path}/stylesheets/_bootstrap.scss", "#{root}/_sass/bootstrap.scss"
      end
    end

    def wormname
      @wormname ||= @filename.gsub('-', '_')
    end

    def renamed
      @filename != wormname
    end

    def git_init
      Git.init "#{@path}/#{wormname}"
    end

    def post_run
      t = Template.new 'post-run', self
      puts t.to_s
    end
  end
end
