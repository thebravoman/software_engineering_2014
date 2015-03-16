words_to_link = Array.new
number_word_to_link = 0

def make_link(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
	words_to_link[number_word_to_link] = word_to_link.split("/").last.split(".").first
	number_word_to_link += 1
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	text = File.read(file_name)
	#find the words and make them links
	words_to_link.each { |word| text.gsub!(word, makeLink(word)) }
	File.open(file_name, "w") { |file| file.puts text }
end
