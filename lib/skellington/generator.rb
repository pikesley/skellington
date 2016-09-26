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
