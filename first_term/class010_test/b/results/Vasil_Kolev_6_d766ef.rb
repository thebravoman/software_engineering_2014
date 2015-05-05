#Develop a program named FirstName_LastName_ClassNumber_d766ef.rb
#
#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb; 
#3. find all the students that have 10 letters in their first name;
#4. Sort the result by Last Name DESC.
#5. Produce a result in CSV format named result.csv:
#
#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN

i = 0
arr = []

Dir.glob(ARGV[0] + "*_*_*.rb") do |files|
	puts files
	arr[i] = files
	i+=1
	puts arr
end

arr.each do |sort|
end

require 'csv'
CSV.open("file_name.csv", "w") do |csv|
	csv << arr
end

