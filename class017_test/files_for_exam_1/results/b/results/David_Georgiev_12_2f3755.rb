=begin
Develop a program named FirstName_LastName_ClassNumber_2f3755.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
4. Sort the result by File name DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'
	file_names = []
	file_names2 = []
	Dir.glob("#{ARGV[0]}/**/*.*") do |current_file|
		name = current_file.split('/').last.split(/\./)
			if not file_names2.include?([current_file.split('/').last.split(/\./).last.length,current_file.split('/').last.split(/\./).first]) then
				file_names2 << ([current_file.split('/').last.split(/\./).last.length,current_file.split('/').last.split(/\./).first])
			end
	end
	Dir.glob("#{ARGV[1]}/**/*.*") do |current_file|
	
		name = current_file.split('/').last.split(/\./)
			if not file_names2.include?([current_file.split('/').last.split(/\./).last.length,current_file.split('/').last.split(/\./).first]) then
				file_names2 << ([current_file.split('/').last.split(/\./).last.length,current_file.split('/').last.split(/\./).first])
			end
	end
	CSV.open("result.csv", "w") do |csv|
		file_names2.sort.each do |ex_length, file_name|
			digits = file_name.scan(/\d+/).join
			if digits.length == 7 then
				csv << ["#{file_name}","#{ex_length/2}"]
			end
		end
	end
