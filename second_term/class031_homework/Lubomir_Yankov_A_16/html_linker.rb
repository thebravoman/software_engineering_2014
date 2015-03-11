require 'active_support/inflector'

class Linker
	
	def get_file_name(path)
		array = []
		Dir.glob("#{path}/*.html") do |file|
			array << file.split("/").last.split(".").first.to_s
		end
		array
	end

	def get_file_content(file)
		string = File.open(file, 'rb') { |file| file.read }
	end
	
	def parse_dir(path, files)
		Dir.glob("#{path}/*.html") do |file|
			string = get_file_content(file)
			files.each do |key|
				string = check_keywords(string, key, file)	
			end
			write_changes(file, string)
		end
	end

	def check_keywords(string, key, file)
		if (string.include? key.pluralize) && (key.pluralize != file.split("/").last.split(".").first.to_s.pluralize)
			string = string.sub(key.pluralize, "<a href=\"#{key}.html\">#{key}</a>")
		elsif (string.include? key) && (key != file.split("/").last.split(".").first.to_s)
			string = string.sub(key, "<a href=\"#{key}.html\">#{key.pluralize}</a>")
		elsif (string.include? key.pluralize.capitalize) && (key.pluralize.capitalize != file.split("/").last.split(".").first.to_s.pluralize.capitalize)
			string = string.sub(key.pluralize.capitalize, "<a href=\"#{key}.html\">#{key.pluralize.capitalize}</a>")
		elsif (string.include? key.capitalize) && (key.capitalize != file.split("/").last.split(".").first.to_s.capitalize)
			string = string.sub(key.capitalize, "<a href=\"#{key}.html\">#{key.capitalize}</a>")
		end
		string
	end

	def write_changes(file, string)
		File.open(file, "wb") do |f|
			f.write(string)
		end
	end

	def link_them(path)
		files = get_file_name(path)
		parse_dir(path, files)
	end

end
htmls = Linker.new
htmls.link_them(ARGV[0])
