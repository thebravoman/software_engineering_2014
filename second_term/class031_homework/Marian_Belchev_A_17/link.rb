class Link

	def initialize directory
		@directory = directory
		@all_files = Hash.new
	end

	def link_files
		get_names_and_urls get_files
		
		get_files.each do |name, url|
			file_content = File.read @directory + url
			replace_words name, file_content
			update_file url, file_content
		end
	end

private
	def update_file url, file_content
		File.open("#{@directory}/#{url}", 'w') { |file| file << file_content }	
	end

	def replace_words file_name, file_content
		get_files.each do |name, url|
			name_check = /#{name}\.?/i
			if file_content =~ name_check && file_name != name
				file_content.gsub!(name_check) {|founded| "<a href=\"#{url}\">#{founded}</a>"}
			end
		end		
	end

	def get_names_and_urls files
		Dir.glob("#{@directory}/*.html") { |file| files[get_filename get_url file] = get_url file }
	end

	def get_filename file
		file.split('.').first
	end

	def get_url file
		file.split('/').last
	end

	def get_files
		@all_files
	end

end