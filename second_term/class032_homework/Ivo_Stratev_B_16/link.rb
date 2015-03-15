def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

def wordsToLink()
	result = Array.new
	i = 0
	Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
		word_to_link = word_to_link.split("/").last.split(".").first
		result[i] = word_to_link
		i = i + 1
	end
	return result
end

words = wordsToLink()

Dir.glob(ARGV[0] + "/*.html") do |file_name|
  	text = File.read(file_name)
  	words.each do |word|
  		text = text.gsub(word, makeLink(word))
  	end
  	File.open(file_name, "w") {|file| file.puts text }
		
end
