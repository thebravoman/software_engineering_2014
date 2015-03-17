#usage: ruby <name of this file> <path to folder with html docs to link>

def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

keywords = {}

Dir.glob(ARGV[0] + "/*.html") do |word|
	key = word.split("/").last.split(".").first;
	keywords[key] = makeLink(key);
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	text = File.read(file_name)
	keywords.keys.each do |key|
		text = text.gsub(key, keywords[key])
	end
	new_content = text
	File.open(file_name, "w") {|file| file.puts new_content}
end
