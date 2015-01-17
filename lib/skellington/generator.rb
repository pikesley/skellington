module Skellington
  class Generator
    def initialize path
      @path = path
      FileUtils.mkdir_p @path

      @config = YAML.load File.read File.join File.dirname(__FILE__), '..', '..', 'config/config.yaml'

      @files = {
        'Gemfile'=> {
          config: @config
        },
        'Rakefile' => {
          filename: @path
        },
        'Procfile' => {
          filename: @path
        },
        'config.ru' => {
           filename: @path,
           camel_name: Skellington.camelise(@path)
        },
        'features/first.feature' => {},
        'features/support/env.rb' => {
          filename: @path,
          camel_name: Skellington.camelise(@path)
        }
      }

      generate
    end

    def generate
      @files.each do |k, v|
        template k, v
      end
    end

    def templates_dir
      File.join File.dirname(__FILE__), '..', 'templates'
    end

    def template name, params = {}
      t = File.read(File.open("#{templates_dir}/#{name}.eruby"))
      FileUtils.mkdir_p("#{@path}/#{File.dirname name}")
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
