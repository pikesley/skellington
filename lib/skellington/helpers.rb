module Skellington
  def self.camelise worm_case
    parts = worm_case.split '_'
    parts.map! { |word| "#{word[0].upcase}#{word[1..-1]}" }
    parts.join ''
  end
end
