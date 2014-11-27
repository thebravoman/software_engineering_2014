#Develop a program named FirstName_LastName_ClassNumber_3e431e.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
#4. Sort the result by Last name ASC;
#5. Produce a result in CSV format named result.csv:
#
#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN
require 'csv'
h = Hash.new

Dir.glob("#{ARGV[0]}" + '*') do |first_dir|
	first_dir = first_dir.split('/')[-1]
	first_name_1 = first_dir.split('_')[0]
	Dir.glob("#{ARGV[1]}" + '*') do |second_dir|
		second_dir = second_dir.split('/')[-1]
		first_name_2 = second_dir.split('_')[0]
		if first_name_1 == first_name_2
			h[first_dir.split('_')[1]] = first_name_1
		end
	end
end

arr = h.sort
CSV.open("result.csv", 'w') do |csv|
	arr.each do |row|
		csv << row
	end
end
