require 'spec_helper'

module Skellington
  describe Skellington do
    it 'camelises a worm_case string' do
      expect(Skellington.camelise 'worm_case').to eq 'WormCase'
    end
  end
end
