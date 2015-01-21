require 'spec_helper'

module Skellington
  describe Skellington do
    it 'camelises a worm_case string' do
      expect(Skellington.camelise 'worm_case').to eq 'WormCase'
    end

    it 'removes a leading ./' do
      expect(Skellington.unslash './word').to eq 'word'
      expect(Skellington.unslash 'another_word').to eq 'another_word'
    end
  end
end
