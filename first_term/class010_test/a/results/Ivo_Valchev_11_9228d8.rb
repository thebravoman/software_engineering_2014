b=ARGV[0]
hash=Hash.new
hash2=Hash.new
Dir.glob("#{ARGV[0]}*.*") do |text_file|
	file_name_extension = text_file.split("/").last
	file_name=text_file.split("/").last.split(".").first
	only_letter = true
	file_name.each_byte do |c|
		if !(c.chr =~/[a-zA-Z]/)
			only_letter = false
			break
		end
	end
	if only_letter
		hash[file_name_extension]=(file_name_extension.length/2).floor
	end
end

Dir.glob("#{ARGV[1]}*.*") do |text_file|
	file_name_extension = text_file.split("/").last
	file_name=text_file.split("/").last.split(".").first
	only_letter = true
	file_name.each_byte do |c|
		if !(c.chr =~/[a-zA-Z]/)
			only_letter = false
			break
		end
		
	end
	if only_letter and !hash.has_key?(file_name_extension)
		hash[file_name_extension]=(file_name_extension.length/2).floor
	end
end

hash=hash.sort.reverse

File.open("result.csv", "w") do |csv| 
	hash.each do |element|
		csv.puts"#{element[0]},#{element[1]}"
	end
end
