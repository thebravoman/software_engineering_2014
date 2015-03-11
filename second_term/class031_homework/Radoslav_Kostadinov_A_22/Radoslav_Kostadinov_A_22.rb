require 'uri'

def makelink(url)
   return "<a href=" + url + ".html" + " target=_blank>" + url + "</a>"
end

def get_file_name(file)
   return file.split("/").last.split(".").first
end

Dir.glob(ARGV[0]+"/*.html*").each do |file_for_word|
	word = get_file_name(file_for_word)
	Dir.glob(ARGV[0]+"/*.html*").each do |file|
		text = File.read(file)
		if !text.include?(makelink(word)) && !(word == get_file_name(file)) 
			lines = text.split("\n")
			new_content = ""
			lines.each do |line|
				line.sub!(word, makelink(word))	if !line.include?("<h") && !new_content.include?(makelink(word))	
				new_content << line + "\n"
			end
			File.open(file, "w+") { |f| f << new_content }	
		end
	end
end
