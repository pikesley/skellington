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

      generate
    end

    def generate
      @files.each do |k, v|
        t = Template.new k
        t.params = v[:params]

        t.outpath = "#{@path}/#{k}"
        t.outpath = "#{@path}/#{v[:outpath]}" if v[:outpath]
        t.write
      end
    end
  end

  def self.camelise worm_case
    parts = worm_case.split '_'
    parts.map! { |word| "#{word[0].upcase}#{word[1..-1]}" }
    parts.join ''
  end
end
