require 'nokogiri'

class PageCollector 

	private def main_descriptive_word file_name
		page_title = file_name.split(".").first.split("/").last
		page_title.gsub!(/[-_]/, ' ')
		@pages[file_name]["main_descriptive_word"] = page_title
		@pages
	end


	private def title file_name
		page = open_file file_name
		title = page.at("title").children.to_s
		@pages[file_name]["title"] = title
		@pages
	end

	private def meta_keywords file_name
		i = 0
		# p "#{file_name}"
		@pages[file_name]["keywords"] = []
		page = open_file file_name
		keywords = page.at('meta[name="keywords"]')['content'].split(", ")
		keywords.each do |keyword|
			@pages[file_name]["keywords"][i] = keyword
			i+=1
		end		
		
		@pages
	end

	private def folder_lookup location
		@pages = {}
		
		Dir.glob("#{location}*.html") do |name|
			@pages[name] = {}
		end

		@pages
	end

	private def open_file file_name
		page = Nokogiri::HTML(open(file_name))
		page
	end	

	def get_page_info 
		@pages
	end

	def initialize loc
		folder_lookup loc
		@pages.each do |k,v|
			# puts "#{k} => #{v}"
			meta_keywords k
			title k
			main_descriptive_word k 
		end
	end

end