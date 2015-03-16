linked_words = Array.new
i = 0

def makeLink word
	 "<a href=" + word + ".html>" + word + "</a>"	
end

def parse file
	 file.split("/").last.split(".").first
end

	
Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
		word_to_link = parse(word_to_link)
		linked_words[i] = word_to_link
		i += 1
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
		text = File.read(file_name)
	  	#find the words and make them links
	  	linked_words.each { |word| text.gsub!(word, makeLink(word)) }
		File.open(file_name, "w") {|file| file.puts text }
end