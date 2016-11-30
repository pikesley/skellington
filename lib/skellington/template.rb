module Skellington
  class Template
    def initialize name, generator
      @name = name
      @generator = generator
    end

    def outpath
      @outpath ||= begin
        subs = @generator.files[@name]['outpath'].split '/'
        @outpath = "#{@generator.path}/#{@generator.send(subs[1].to_sym)}/#{@name.gsub(subs[0], @generator.send(subs[1].to_sym))}"
      rescue NoMethodError
        @outpath = "#{@generator.path}/#{@generator.wormname}/#{@name}"
      end
    end

    def common_templates
      File.join File.dirname(__FILE__), '..', 'templates', 'common'
    end

    def templates_dir
      File.join File.dirname(__FILE__), '..', 'templates', @generator.framework
    end

    def write
      print "Generating #{Skellington.unslash outpath}..."
      FileUtils.mkdir_p File.dirname outpath
      File.open outpath, 'w' do |f|
        f.write self
      end
      puts 'done'
    end

    def path
      [
        "#{templates_dir}/#{@name}",
        "#{common_templates}/#{@generator.files.dig(@name, 'common')}",
        "#{common_templates}/#{@name}"
      ].each do |maybe_path|
        return File.read(File.open(maybe_path)) if File.file? maybe_path
      end

      ''
    end

    def to_s
      Erubis::Eruby.new(path).evaluate(gen: @generator)
    end
  end
end
