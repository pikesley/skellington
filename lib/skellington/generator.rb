module Skellington
  class Generator
    attr_reader :path, :filename, :camelname, :files, :gems

    def initialize path
      @full_path = path
      @path = File.dirname @full_path
      @filename = File.basename(@full_path)
      @camelname = Skellington.camelise(wormname)
      @gems = config['gems']
      @files = config['files']
    end

    def config
      @config ||= YAML.load File.read File.join File.dirname(__FILE__), '..', '..', 'config/config.yaml'
    end

    def run
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
