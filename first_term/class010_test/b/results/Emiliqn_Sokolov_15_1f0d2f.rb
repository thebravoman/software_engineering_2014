#Develop a program named FirstName_LastName_ClassNumber_1f0d2f.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 5 letters in their second name;
#4. Sort the result by First name DESC.
#5. Produce a result in CSV format named result.csv:

#		FirstName1,LastName1
		#FirstName2,LastName2
		#...
		#FirstNameN,LastNameN
		
		
require 'csv'
names_hash = Hash.new	
		
Dir.glob("#{ARGV[0]}/*.rb") do |file_1| 
	if(file_1.split("/").last.split("_").length == 3)
	
		first_name = file_1.split(/\//).last.split(/_/).first
		last_name = file_1.split(/\//).last.split(/_/, 2).last.split("_").first
		if last_name.length == 5
			names_hash[first_name] = last_name
		end
	end
end
CSV.open("result.csv", "w") do |csv|
	names_hash.sort_by{|key,val| key}.reverse.each do |element|
		csv << element
	end
end
