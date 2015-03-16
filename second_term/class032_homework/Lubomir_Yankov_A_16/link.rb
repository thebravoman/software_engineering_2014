
def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

def get_keywords(path)
		keywords = []
		Dir.glob(path + "/*.html") do |file|
			keywords << file.split("/").last.split(".").first.to_s
		end
		keywords
end

keywords = get_keywords(ARGV[0])

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	text = File.read(file_name)
	keywords.each do |keyword|
		text = text.gsub(keyword, makeLink(keyword))
	end
	File.open(file_name, "w") {|file| file.puts text }
end

