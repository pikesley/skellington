module Skellington
  class Template
    attr_reader :name
    attr_accessor :params, :outpath, :obj

    def initialize name, generator
      @name = name
      @generator = generator

      begin
        subs = @generator.files[@name]['outpath'].split '/'
        @outpath = "#{@generator.path}/#{@name.sub(subs[0], @generator.path)}"
      rescue NoMethodError
        @outpath = "#{@generator.path}/#{@name}"
      end

    end

    def templates_dir
      File.join File.dirname(__FILE__), '..', 'templates'
    end

    def write
      print "Generating #{@outpath}..."
      FileUtils.mkdir_p File.dirname @outpath
      f = File.open @outpath, 'w'
      f.write self
      f.close
      puts 'done'
    end

    def to_s
      t = File.read(File.open("#{templates_dir}/#{@name}.eruby"))
      #Erubis::Eruby.new(t).result(@params)
      Erubis::Eruby.new(t).evaluate(obj: @generator)
    end
  end
end
