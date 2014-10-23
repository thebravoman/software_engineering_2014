#Develop a program named FirstName_LastName_ClassNumber_d77aee.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file #must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
#3. Calculate the length of their names (including extensions).;
#4. Sort the result by length ;
#5. Produce a result in CSV format named result.csv:
#
#			File1,3
#			File2,4
#			...
#			FileN,3

require 'csv'

first_folder = ARGV.shift
second_folder = ARGV.shift || "err"
names_hash = Hash.new

Dir.glob(first_folder+"/*.*").each do |text_file|
	text_file = text_file.split("/").last
	if (text_file.split("_").length == 3) then
		first_name = text_file.split("_")[0]
		second_name = text_file.split("_")[1]
		diggit = text_file.split("_")[2].split(/\./).first
		if (diggit.to_i.to_s != diggit) then names_hash[text_file] = text_file.length end
		if (first_name =~ /\d/) then names_hash[text_file] = text_file.length end
		if (second_name =~ /\d/) then names_hash[text_file] = text_file.length end
	else 	
		names_hash[text_file] = text_file.length
	end
end

if second_folder != "err"
	Dir.glob(second_folder+"/*.*").each do |text_file|
		text_file = text_file.split("/").last
		if (text_file.split("_").length == 3) then
			first_name = text_file.split("_")[0]
			second_name = text_file.split("_")[1]
			diggit = text_file.split("_")[2].split(/\./).first
			if (diggit.to_i.to_s != diggit) then names_hash[text_file] = text_file.length end
			if (first_name =~ /\d/) then names_hash[text_file] = text_file.length end
			if (second_name =~ /\d/) then names_hash[text_file] = text_file.length end
		else 	
			names_hash[text_file] = text_file.length
		end
	end
end

names_hash = Hash[names_hash.sort_by{|k,v| k} ]
names_hash = Hash[names_hash.sort_by{|k,v| v} ]

puts names_hash

CSV.open("result.csv","w") do |csv|
	names_hash.each do |element|
		csv << element
	end
end
