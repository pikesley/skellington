module Skellington
  class Template
    attr_reader :name
    attr_accessor :params, :outpath, :obj

    def initialize name
      @name = name
      @outpath = name
    end

    def templates_dir
      File.join File.dirname(__FILE__), '..', 'templates'
    end

    def write
      FileUtils.mkdir_p File.dirname @outpath
      f = File.open @outpath, 'w'
      f.write self
      f.close
    end

    def to_s
      t = File.read(File.open("#{templates_dir}/#{@name}.eruby"))
      #Erubis::Eruby.new(t).result(@params)
      Erubis::Eruby.new(t).evaluate(obj: @obj)
    end
  end
end
