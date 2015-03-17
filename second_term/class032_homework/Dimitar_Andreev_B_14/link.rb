
def makeLink(word)
	return "<a href=" + word + ".html>" + word + "</a>"
end
link=Array.new
Dir.glob(ARGV[0] + "/*.html") do |word_to_link|
	#split to word
	link << word_to_link.split("/").last.split(".").first
end

Dir.glob(ARGV[0] + "/*.html") do |file_name|
		#read the file
		new_contents=nil
  		text = File.read(file_name)
  		#find the words and make them links
		link.each do |word|
  		new_contents = text.gsub(word, makeLink(word))

  		# Write changes to the file
		end
  		File.open(file_name, "w") {|file| file.puts new_contents }
end
