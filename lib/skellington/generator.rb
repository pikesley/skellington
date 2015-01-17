module Skellington
  class Generator
    def initialize path
      @path = path
      FileUtils.mkdir_p @path

      @config = YAML.load File.read(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
      gemfile
      rakefile
      procfile
    end

    def gemfile
      template 'Gemfile', config: @config
    end

    def rakefile
      template 'Rakefile', camel_case_name: @path
    end

    def procfile
      template 'Procfile', camel_case_name: @path
    end

    def templates_dir
      File.join(File.dirname(__FILE__), '..', 'templates')
    end

    def template name, params = {}
      t = File.read(File.open("#{templates_dir}/#{name}.eruby"))
      f = File.open "#{@path}/#{name}", 'w'
      f.write Erubis::Eruby.new(t).result(params)
      f.close
    end
  end
end
