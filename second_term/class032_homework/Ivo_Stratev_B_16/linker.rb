def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

def wordsToLink()
	result = []
	Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
		word_to_link = word_to_link.split("/").last.split(".").first
		result.push(word_to_link)
	end
	return result
end

words = wordsToLink()

Dir.glob(ARGV[0] + "/*.html") do |file_name|
  	text = File.read(file_name)
  	words.each do |word|
  		text = text.gsub(word, makeLink(word))
  	end
	File.write(file_name, test)	
end
