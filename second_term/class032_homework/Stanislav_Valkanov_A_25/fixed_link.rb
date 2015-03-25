word_to_link = Array.new

def makeLink word
	"<a href=" + word + ".html>" + word + "</a>"	
end

Dir.glob(ARGV[0] + "/*.html") do |path|
	word_to_link << File.basename(path, ".html")
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|

	text = File.read(file_name)
	test_word = File.basename(file_name, ".html")

	word_to_link.each do |word|
		if (word != test_word)
			text = text.gsub(word, makeLink(word))
		end
	end
	File.open(file_name, "w") {|file| file.write text }
end