module Skellington
  class Generator
    def initialize path
      @path = path
      FileUtils.mkdir_p @path

      @config = YAML.load File.read(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
      gemfile
      rakefile
      procfile
      config_ru
    end

    def gemfile
      template 'Gemfile', config: @config
    end

    def rakefile
      template 'Rakefile', filename: @path
    end

    def procfile
      template 'Procfile', filename: @path
    end

    def config_ru
      template 'config.ru', filename: @path, camel_name: Skellington.camelise(@path)
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

  def self.camelise worm_case
    parts = worm_case.split '_'
    parts.map! { |word| "#{word[0].upcase}#{word[1..-1]}" }
    parts.join ''
  end
end
