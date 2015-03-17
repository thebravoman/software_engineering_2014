extension = 'html'

def make_link word, extension
  '<a href=' + word + '.' + extension + '>' + word + '</a>'	
end

def word_from_filename file
  File.basename file, File.extname(file)
end

glob_content = Dir.glob "#{ARGV[0]}/*.#{extension}"

words_to_link = []
glob_content.each do |f|
  words_to_link << (word_from_filename f)
end

glob_content.each do |f|
  content = File.read f
  words_to_link.each do |link|
    content.gsub! link, make_link(link, extension)
  end
  File.open(f, 'w') { |f| f << content }
end
