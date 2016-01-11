Dir.entries('features').select { |f| f[-7..-1] == 'feature' }.each do |feature|
  outfile = "spec/cli/#{feature[0..-9]}_spec.rb".gsub('-', '_').gsub('.', '_')
  lines = File.readlines "features/#{feature}"
  outlines = ['']
  lines.each do |line|
    if line.match /Scenario/

    end
  end
  break
end
