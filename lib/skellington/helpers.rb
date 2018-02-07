module Skellington
  def self.camelise worm_case
    worm_case.split('_').map! { |word| "#{word[0].upcase}#{word[1..-1]}" }.join ''
  end

  def self.unslash word
    return word[2..-1] if word[0..1] == './'
    word
  end

  def self.js_for_sinatra data
    s = ['  %s: {' % data['name']]
    s.push "    url:  '%s'," % (data['url'].sub 'VERSION', data['version'])
    s.push "    hash: '%s'" % data['hash']
    s.push '  }'

    s.join "\n"
  end

  def self.js_for_jekyll data
    s = ['  - name: %s' % data['name']]
    s.push "    url:  %s" % (data['url'].sub 'VERSION', data['version'])
    s.push "    hash: %s" % data['hash'] if data['hash']

    s.join "\n"
  end
end
