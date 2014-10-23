#Develop a program named FirstName_LastName_ClassNumber_41a1f0.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
#3. find all the students that have 10 symbols in their first name;
#4. Sort the result by Last Name DESC.
#5. Produce a result in CSV format named result.csv:

#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN


require 'csv'
a = Hash.new
path = ARGV[0]
Dir.glob(path + "**/*.rb") do |my_text_file|
	short_name = my_text_file.split('/').last.split('.').first
	name = short_name.split("_")[0]
	last = short_name.split("_")[1]
	name.to_s
	if (short_name.split("_").size == 3)&&(name.length == 10)
		a["#{name}"] = last
	end
end
CSV.open("result.csv", "w") do |csv|
	Hash[a.sort_by{|k,v|v}.reverse].each do |element|
		csv << element
	end
end
