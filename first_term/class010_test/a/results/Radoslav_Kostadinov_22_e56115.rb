=begin
Develop a program named FirstName_LastName_ClassNumber_e56115.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ASC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'
file1 = []
file2 = []

path1 = ARGV[0]
path2 = ARGV[1]
i = 0
Dir.glob("#{path1}*.*") do |my_text_file| 
	s = my_text_file.split(/\//).last
	first_name = my_text_file.split("/").last.split("_").first
	last_name  = my_text_file.split("/").last.split("_",2).last.split("_").first
	number1  = my_text_file.split("/").last.split("_",2).last.split("_").last.split(".").first
	extension = my_text_file.split("/").last.split("_",2).last.split("_").last.split(".").last
	file_length = s.length
	

	if !(number1.to_i.to_s == number1) or !(s.count('_') == 2) or ((first_name == "" || first_name == " ") || (last_name == "" || last_name == " ")) or extension != "rb"
		file1[i] = Array.new
		file1[i][0] = s
		file1[i][1] = file_length
		i+=1
	end
end

i = 0
Dir.glob("#{path2}*.*") do |my_text_file| 
	s = my_text_file.split(/\//).last
	first_name = my_text_file.split("/").last.split("_").first
	last_name  = my_text_file.split("/").last.split("_",2).last.split("_").first
	number1  = my_text_file.split("/").last.split("_",2).last.split("_").last.split(".").first
	extension = my_text_file.split("/").last.split("_",2).last.split("_").last.split(".").last
	file_length = s.length

	if !(number1.to_i.to_s == number1) or !(s.count('_') == 2) or ((first_name == "" || first_name == " ") || (last_name == "" || last_name == " ")) or extension != "rb"
		file2[i] = Array.new
		file2[i][0] = s
		file2[i][1] = file_length
		i+=1
	end
end

file1 = file1.concat(file2).uniq.sort_by{|first,last| [last,first]}

CSV.open("result.csv", "w") do |csv|
	file1.each do |push|
		csv << push
	end
end

