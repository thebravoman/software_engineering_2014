#ruby link.rb folder_with_files files_type[optional]

abort("ruby link.rb folder_with_files files_type[optional]") if not ARGV[0]
files_type = ARGV[1] || ".html"
target_dir = ARGV[0] + "/*" + files_type
words_to_links = {}

def makeLink(word, files_type)
	return "<a href=" + word + files_type + ">" + word + "</a>"	
end

Dir.glob(target_dir) do |path|
	word = File.basename(path, files_type)
	words_to_links[word] = makeLink(word, files_type)
end

Dir.glob(target_dir) do |path|
  		file_content = File.read(path)

		words_to_links.keys.each {|key| file_content = file_content.gsub(key, words_to_links[key]) }

  		File.open(path, "w") {|file| file.puts file_content }		
end
