#==begin
#Develop a program named FirstName_LastName_ClassNumber_bce70c.rb
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
#==end

require 'csv'

hash = Hash.new

Dir.glob("#{ ARGV[0] }/*") do |name|
	name = name.split("/").last
	short_name = name.split('_')[1]
	if short_name.length == 5
		hash[name] = short_name
	end
end

CSV.open("result.csv", "w") do |csv|
	hash = hash.sort_by { |key, value| value }.reverse
	hash.each |key| do
		csv << key
	end
end
