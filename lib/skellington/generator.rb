module Skellington
  class Generator
    def initialize path
      @path = path
      puts path
      FileUtils.mkdir_p @path
      gemfile
    end

    def gemfile
      f = File.open "#{@path}/Gemfile", 'w'
      f.write "source 'https://rubygems.org'"
      f.close
    end
  end
end
