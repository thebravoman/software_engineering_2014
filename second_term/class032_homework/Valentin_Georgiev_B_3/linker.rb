words_to_links = Array.new
words = 0
arg = ARGV[0] + "/*.html"

def makeLink word
	"<a href=" + word + ".html>" + word + "</a>"	
end
	
Dir.glob(arg) do |word_to_link|
	words_to_links[words] = word_to_link.split("/").last.split(".").first
	words += 1
end

Dir.glob(arg) do |file_name|
	text = File.read(file_name)
	words_to_links.each do |word| 
		text.gsub!(word, makeLink(word))
	end
	File.open(file_name, "w") {|file| file.puts text }
end
