require 'uri'

def makelink(url)
   return "<a href=" + url + ".html" + " target=_blank>" + url + "</a>"
end

def get_file_name(file)
   return file.split("/").last.split(".").first
end

Dir.glob(ARGV[0]+"/*.*").each do |file_for_word|
	word = get_file_name(file_for_word)
	Dir.glob(ARGV[0]+"/*.*").each do |file|
		text = File.read(file)
		lines = text.split("\n")
		new_content = ""
		lines.each do |line|
			if (!(word == get_file_name(file)) && !text.include?(makelink(word)) && !line.include?("<h") && !new_content.include?(makelink(word)))
				line.sub!(word, makelink(word))		
			end
			new_content << line + "\n"
		end
		File.open(file, "w+") { |f| f << new_content }	
	end
end
