#Develop a program named FirstName_LastName_ClassNumber_a65be5.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:

#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN

require 'csv'
a = Array.new
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|

		file_name_1 = dir_file_name_1.split(/\//).last.to_s
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
	
		if(file_name_1 != file_name_2) 
			file_name = file_name_1
			digit = file_name.split(/_/).last.split(/\./).first.to_s
			first_name = file_name.split(/_/).first.to_s
			full_first_name = first_name + digit
			full_first_name = full_first_name.to_s
			tmp = file_name.split("#{first_name}_")
			full_last_name = tmp.last.split(/_/).first.to_s + digit
			full_last_name = full_last_name.to_s
			h[full_last_name] = full_first_name
			
		end
	end
end	

CSV.open("results.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
	end
end
