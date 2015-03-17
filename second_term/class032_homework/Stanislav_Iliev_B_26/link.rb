def make_link(word)
	return "<a href=" + word + ".html>" + word + "</a>"	
end

all_files = Dir.entries(ARGV[0])[2..-1]

Dir.glob(ARGV[0] + '/*.html') do |file_name|
	i ||= 0
	filename = File.basename(all_files[i], '.html')
	new_text = File.read(file_name).gsub(filename, make_link(filename))
	File.write(file_name, new_text)
	i += 1
end
