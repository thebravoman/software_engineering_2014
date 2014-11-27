=begin
Develop a program named FirstName_LastName_ClassNumber_eda227.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by First name ASC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end

require 'csv'

names_hash = Hash.new()
first_folder_files = Array.new()
second_folder_files = Array.new()

first_folder = ARGV.shift
second_folder = ARGV.shift

Dir.glob(first_folder+"/*.*/").each do |file|
	file_name = file.split("/\//").last
	file_name = file_name.split(/\./).first
	if (file_name.split("_").length == 3)
		diggit = file_name.split("_")[2]
		if diggit.to_i.to_s == diggit
			first_folder_files.push(file_name)
		end
	end
end

Dir.glob(second_folder+"/*.*/").each do |file|
	file_name = file.split("/\//").last
	file_name = file_name.split(/\./).first
	if (file_name.split("_").length == 3)
		diggit = file_name.split("_")[2]
		if diggit.to_i.to_s == diggit
			second_folder_files.push(file_name)
		end
	end
end

first_folder_files.each do |element|
	exists_twice = false
	first_name_1 = element.split("_")[0]
	last_name_1 = element.split("_")[1]

	second_folder_files.each do |element2|
		first_name_1 = element2.split("_")[0]
		last_name_1 = element2.split("_")[1]
		if first_name_2 + last_name_2 == first_name_1 + last_name_1
			exists_twice = true
		end
	end

	if exists_twice == false
		names_hash[last_name_1] = first_name_1
	end
end

names_hash = Hash[names_hash.sort_by{|k,v| v}]

CSV.open("result.csv","w") do |csv|
	names_hash.each do |e|
		csv << e
	end
end