require 'spec_helper'

module Skellington
  describe Template do
    before :each do
      @g = Generator.new 'dummy_gem'
      @t = Template.new 'Rakefile', @g
#      @t.params = { filename: 'dummy_gem' }
#      @t.obj = @g
    end

    it 'has a name' do
      expect(@t.name).to eq 'Rakefile'
    end

    it 'takes variables' do
      expect(@t.params[:filename]).to eq 'dummy_gem'
    end

    it 'produces output' do
      expect(@t.to_s).to match /require File.join\(File.dirname\(__FILE__\), 'lib\/dummy_gem.rb'\)/
    end

    it 'writes to a file' do
      @t.write
      expect(File).to exist 'tmp/Rakefile'
    end

    it 'behaves well with a more complex name' do
    #  @t.outpath = 'tmp/features/dummy_gem.feature'
      @t.write
      expect(File).to exist 'tmp/features/dummy_gem.feature'
    end
  end
end
