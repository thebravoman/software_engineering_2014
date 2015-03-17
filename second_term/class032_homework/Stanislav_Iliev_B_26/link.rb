def make_link(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

all_files = Dir.entries(ARGV[0])[2..-1]

Dir.glob(ARGV[0] + '/*.html') do |file_name|
	file_contents = File.read(file_name)
	
	all_files.each do |file|
		filename = File.basename(file, '.html')
		file_contents = file_contents.gsub(filename, make_link(filename))
	end
	
	File.write(file_name, new_text)
end
