#Develop a program named FirstName_LastName_ClassNumber_c323bc.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 5 letters in their second name;
#4. Sort the result by First name DESC.
#5. Produce a result in CSV format named result.csv:

	#	FirstName1,LastName1
	#	FirstName2,LastName2
	#	...
	#	FirstNameN,LastNameN

require 'csv'
	a = Array.new
	h = Hash.new
	Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name|
	
	file_name = dir_file_name.split(/\//).last.to_s
	
	
	first_name = file_name.split(/_/).first.to_s
	full_first_name = first_name 
	full_first_name = full_first_name.to_s
	
	tmp = file_name.split("#{first_name}_")
	full_last_name = tmp.last.split(/_/).first.to_s 
	full_last_name = full_last_name.to_s
	
	condition = full_last_name.length 
	if (condition == 5)
	h[full_first_name.to_s] = full_last_name.to_s
	end
	end
	
	CSV.open("result.csv", "w") do |csv|
	a = h.sort.reverse
	a.each do |element|
	csv << element
	end
	end
