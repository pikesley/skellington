module Skellington
  def self.camelise worm_case
    worm_case.split('_').map! { |word| "#{word[0].upcase}#{word[1..-1]}" }.join ''
  end
end
