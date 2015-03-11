require './collect_pages.rb'
require 'nokogiri'
require 'active_support/core_ext/string'

class LinkPages

	private def check_if_singular str
		singular_test = test_singularity str
		if singular_test == false
			str = str.singularize
		end
		str
	end

	private def test_singularity(str)
		str.pluralize != str && str.singularize == str
	end

	private def replace key, w
		linking_url = key.split("/").last

		without_punctuation = w.gsub(/\W+/, '')
		without_punctuation = check_if_singular without_punctuation

		if without_punctuation.casecmp(@pages[key]["main_descriptive_word"]) == 0
			w = "<a href=\"#{linking_url}\">#{w}</a>"
		end
		w
	end

	private def relation
		long_words = {}
		@pages.each do |key, value|
			@pages[key].each do |k, v|
				if k == "main_descriptive_word" 
					if v.scan(/ /).length > 0
						long_words["#{v}"] = "#{key}"
					end
				end
			end
		end
		long_words
	end

	private def check_if_in_limits incl, w 
		if incl == false
			if w.include? "<body>"
				incl = true
			end
		else 
			if w.include? "</body>"
				incl = false
			end
		end
		incl
	end

	private def generate_replacement_array file_name
		changed_words = []
		incl = false
		f = File.read(file_name)
		f.each_line { |line|
			words = line.split
			words.each { |w|
				@pages.each do |key, value|
					incl = check_if_in_limits incl, w
					if incl 
						w = replace key, w
					else
						next
					end
				end
				changed_words << w
			}
		}
		changed_words = changed_words.join(" ")
		changed_words
	end	

	private def page_lookup file_name
		changed_words = generate_replacement_array file_name
		File.open(file_name, "w") do |file|
			file << changed_words
		end
	end

	private def sorted_keywords_array file_name
		keywords = []
		keywords = @pages[file_name]["keywords"]
		keywords.sort_by!{ |m| m.downcase }
		@pages[file_name]["keywords"] = keywords
		@pages
	end	

	def initialize
		location = ARGV[0]

		collect_info_about_pages = PageCollector.new location
		@pages = collect_info_about_pages.get_page_info
		relation 
		@pages.each do |k,v|
			sorted_keywords_array k
			page_lookup k
			# break
		end
	end

end

LinkPages.new