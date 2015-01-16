require 'spec_helper'

module Skellington
  describe Generator do
    before :each do
      @g = Generator.new 'tmp/project'
    end

    it 'creates a Gemfile' do
      expect(File).to exist 'tmp/project/Gemfile'
    end
  end
end
