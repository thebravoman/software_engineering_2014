
def makeLink word
	return "<a href=\"" + word + ".html\">" + word + "</a>"	
end

searched_word=[]

Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
	searched_word << word_to_link.split("/").last.split(".").first
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	text = File.read(file_name)
	searched_word.each_char do |chr|
		File.open(file_name, "w") {|file| file.puts text.gsub!(chr, makeLink(@searched_word)) }
	end
end