require 'active_support/core_ext/string'

def get_words file
	File.read(file).split(" ")
end

def get_file_name file
	file.scan(/[^\/\.]+/).first.downcase
end

html_files_path = ARGV[0] + "/*.html"

pages = []

Dir.glob(html_files_path) do |file|
	pages << get_file_name(file)
end

Dir.glob(html_files_path) do |file|
	temp = pages.clone
	temp.delete get_file_name(file)
	content = get_words file

	content.each do |current_word|
		word_ = current_word.gsub(/[\W+|^<>]/, '')
		word = word_.downcase.singularize
		if temp.delete word
			puts current_word.gsub!(word_, "<a href='#{ word }.html'>#{ word_ }</a>")
		end	
	end

	File.open(file, "w") { |file| file.write content.join(" ") }

end
