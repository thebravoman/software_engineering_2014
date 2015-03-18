def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

words = Hash.new

Dir.glob(ARGV[0] + "/*.html") do |word|
	key = word.split("/").last.split(".").first
	words[key] = makeLink(key)
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	text = File.read(file_name)
	words.keys.each do |key|
		text = text.gsub(key, words[key])
	end
	new_content = text
	File.open(file_name, "w") {|file| file << new_content}
end