module Skellington
  describe Skellington do
    it 'camelises a worm_case string' do
      expect(Skellington.camelise 'worm_case').to eq 'WormCase'
    end

    it 'removes a leading ./' do
      expect(Skellington.unslash './word').to eq 'word'
      expect(Skellington.unslash 'another_word').to eq 'another_word'
    end

    it 'generates a JS lib import line for Sinatra' do
      data = YAML.load("""
- name:    bootstrap
  url:     //maxcdn.bootstrapcdn.com/bootstrap/VERSION/js/bootstrap.min.js
  version: 4.0.0
  hash:    sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl
      """)[0]

      expect(Skellington.js_for_sinatra data).to eq (
        """  bootstrap: {
    url:  '//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js',
    hash: 'sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl'
  }"""
      )
    end

    it 'generates a JS lib import line for Jekyll' do
      data = YAML.load("""
- name:    bootstrap
  url:     //maxcdn.bootstrapcdn.com/bootstrap/VERSION/js/bootstrap.min.js
  version: 4.0.0
  hash:    sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl
      """)[0]

      expect(Skellington.js_for_jekyll data).to eq (
        """  - name: bootstrap
    url:  //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js
    hash: sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"""
      )
    end
  end
end
