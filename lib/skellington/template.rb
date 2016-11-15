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
      File.join File.dirname(__FILE__), '..', 'common', 'templates'
    end

    def templates_dir
      File.join File.dirname(__FILE__), '..', @generator.framework, 'templates'
    end

    def write
      print "Generating #{Skellington.unslash outpath}..."
      FileUtils.mkdir_p File.dirname outpath
      File.open outpath, 'w' do |f|
        f.write self
      end
      puts 'done'
    end

    def to_s
      path = "#{templates_dir}/#{@name}"
      if @generator.files.dig(@name, 'common')
        path = "#{common_templates}/#{@generator.files[@name]['common']}"
      end

      begin
        t = File.read(File.open(path))
      rescue Errno::ENOENT
        begin
          t = File.read(File.open("#{common_templates}/#{@name}"))
        rescue Errno::ENOENT
          t = ''
        end
      end
      Erubis::Eruby.new(t).evaluate(gen: @generator)
    end
  end
end
