module Skellington
  def self.camelise worm_case
    worm_case.split('_').map! { |word| "#{word[0].upcase}#{word[1..-1]}" }.join ''
  end

  def self.unslash word
    return word[2..-1] if word[0..1] == './'
    word
  end
end
