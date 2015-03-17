files = Array.new

def file_name file
	File.basename(file, '.html')
end

def make_link word
	'<a href=' + word + '.html>' + word + '</a>'	
end

Dir.glob(ARGV[0] + '/*.html') { |word_to_link| files << word_to_link }

files.each do |file|
	text 		= File.read file
	filename 	= file_name file
	new_content = text.gsub!(filename, make_link(filename))
	File.open(file, 'w') { |opened_file| opened_file << new_content }
end