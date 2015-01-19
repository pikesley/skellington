module Skellington
  class Generator
    attr_accessor :config, :path, :camelname

    def initialize path
      @path = path
      FileUtils.mkdir_p @path

      @camelname = Skellington.camelise(@path)

      @config = YAML.load File.read File.join File.dirname(__FILE__), '..', '..', 'config/config.yaml'

      @files = @config['files']
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
      #  t.params = v[:params]
        t.obj = self
        t.outpath = "#{@path}/#{k}"
        if v
          if v['outpath']

            subs = v['outpath'].split '/'
            t.outpath = "#{@path}/#{v[:outpath]}" if v['outpath']
            t.outpath = "#{@path}/#{k.sub(subs[0], @path)}" if v['outpath']


          end
        end
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
      t.obj = self
      puts t.to_s
      puts ''
    end
  end
end
