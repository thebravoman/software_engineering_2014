# Develop a program named FirstName_LastName_ClassNumber_68a91571.rb

# 1. You are given an argument for a folder with files.
# 1.1. If there are other arguments they should be discarded..
# 2. In this folder there is a CSV file, containing file names, along with other file formats.
# 3. Parse the CSV file.
# 4. Find all files that have 3 "-" in them including extensions.
# 5. Calculate their file name length including extensions.
# 6. Sort the result by File Name DESC.
# 7. Produce a result in JSON format named 68a91571.json:

# 	{
# 		"File1":"Length1"
# 		"File2":"Length2"
# 		...
# 		"FileN":"LengthN"
# 	}

require 'json'
require 'builder'

file_ct = ""
result = Hash.new
glob_counter = 0
Dir.glob("#{ARGV[0]}*.csv") do |file| 
	glob_counter += 1
	if glob_counter <= 1
		@file_name = file
	else
		break
	end
end
File.open(@file_name, "r") do |csv|
		file_ct = csv.read
end
file_ct = file_ct.split(/\n/)
file_ct.each do |blah|
	if blah.count('-') == 3
		blah = blah.gsub(",", "")
		result["#{blah}"] = blah.length
	end
end
File.open("68a91571.json","w") do |f|
	f.write "{\n"
	Hash[result.sort_by { |first, last| first }.reverse].each do |first, last|
		f.write "\"#{first}\":\"#{last}\"\n"
	end
	f.write "}"
end
