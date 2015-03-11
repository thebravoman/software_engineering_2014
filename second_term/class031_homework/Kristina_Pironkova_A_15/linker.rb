
def link(word) 
	return "<a href=" + word + ".html" + " target=_blank>" + word + "</a>"
end

def parse(file)
	return file.split("/").last.split(".").first
end

directory= ARGV[0]
Dir.glob("#{directory}/*.html").each do |file_name|
	word=parse(file_name)
	Dir.glob("#{directory}/*.html").each do |file|
		content = File.read(file)
		if word != parse(file) && !(content.include?(link(word)))
			content.gsub!(word,link(word))
		end
		File.open(file,"w") do |text|
		 text << content
		end
	end
end

