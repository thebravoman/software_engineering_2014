#Develop a program named FirstName_LastName_ClassNumber_f844cc.rb
#
#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 5 letters in their second name;
#4. Sort the result by First name DESC.
#5. Produce a result in CSV format named result.csv:
#
#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN

require 'csv'
name_hash = Hash.new()
i = 0

Dir.glob("#{ARGV[0]}/**") do |file|
	first_name = file.split(/\//).last.split(/_/).first.capitalize
	last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first.capitalize
	if last_name.length == 5
		name_hash[first_name] = last_name
	end
	p name_hash
end

CSV.open("result.csv", "w") do |csv|
	name_hash.sort_by{|key,val| val}.each do |element|
		csv << element
	end
end

p name_array
