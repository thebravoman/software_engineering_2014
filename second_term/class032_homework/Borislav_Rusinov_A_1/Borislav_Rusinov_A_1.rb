extension = 'html'

def make_link word, extension
  '<a href=' + word + '.' + extension + '>' + word + '</a>'	
end

def word_from_filename file
  File.basename file, File.extname(file)
end

directory = Dir.glob "#{ARGV[0]}/*.#{extension}"

linked_words = []
directory.each do |file|
  linked_words << (filename_word file)
end

directory.each do |file|
  file_content = File.read file

  linked_words.each do |link|
    file_content.gsub! link, make_link(link, extension)
  end
  
  File.open(file, 'w') { |file| file << file_content }
end
