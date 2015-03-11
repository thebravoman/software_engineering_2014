# ruby linker.rb full_path_to_files

require 'active_support/inflector'

def check(text, link, file_link, current_file)
	if text.include? link.capitalize.pluralize
		text.sub!(link.capitalize.pluralize, "<a href=\"#{file_link}\"> #{link.capitalize.pluralize} </a>")
		write_file("#{current_file}", text)
	elsif text.include? link.pluralize
		text.sub!(link.pluralize, "<a href=\"#{file_link}\"> #{link.pluralize} </a>")
		write_file("#{current_file}", text)
	elsif text.include? link.capitalize
		text.sub!(link.capitalize, "<a href=\"#{file_link}\"> #{link.capitalize} </a>")
		write_file("#{current_file}", text)
	elsif text.include? link
		text.sub!(link, "<a href=\"#{file_link}\"> #{link} </a>")			
		write_file("#{current_file}", text)
	end
end

def write_file(path, text)
	File.open(path, "w") do |content|
		content.puts text
	end
end

Dir.glob("#{ARGV[0]}" + "*") do |file_link|
	link = file_link.split("/").last.split(".").first.downcase
	Dir.glob("#{ARGV[0]}" + "*") do |current_file|
		if current_file != file_link
			text = File.read("#{current_file}")
			check(text, link, file_link, current_file)
		end
	end
end
