
def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

path = Dir.glob(ARGV[0] + "/*.html")

words_to_link = path.map { |arr| File.basename arr, ".*" }

path.each do |file|
	text = File.read(file)
	words_to_link.each do |word|
		text.gsub!(word, makeLink(word))
	end
	File.open(file, "w") {|file_to_write| file_to_write.puts text }
end


# <a href="atom.html"> atom </a>