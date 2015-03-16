array_of_words = Array.new
i = 0 # array_of_words index

def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"
end

Dir.glob(ARGV[0] + "/*.html") do |link|
  #split to word
  array_of_words[i] = link.split("/").last.split(".").first
  i = i + 1
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
  content = File.read(file_name)
  #find the words and make them links
  array_of_words.each do |word|
    content.gsub!(word, makeLink(word))
  end
  File.open(file_name, "w") {|file| file.puts content}
end
