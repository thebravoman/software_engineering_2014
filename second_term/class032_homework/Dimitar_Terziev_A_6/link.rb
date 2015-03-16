
def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

links = Array.new
Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
	#split to word
	word_to_link = File.basename word_to_link.split('.html').first
	links << word_to_link
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
	#read the file 
	text = File.read(file_name)
	#find the words and make them links
	new_contents = text
	links.each do |word_to_link|
		new_contents.gsub!(word_to_link, makeLink(word_to_link))
	end
	# Write changes to the file
	File.open(file_name, "w") {|file| file.puts new_contents }
	
end
