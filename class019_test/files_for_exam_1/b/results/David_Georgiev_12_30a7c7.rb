=begin Develop a program named FirstName_LastName_ClassNumber_30a7c7.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name DESC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end
require 'csv'
students = Array.new
students2 = Array.new

Dir.glob("#{ARGV[0]}/*.rb").each do |my_file|
	name = my_file.split("/").last.split("_")
	if !students.include? [name[1],name[0]] then
		students << [name[1],name[0]]
	end
end
Dir.glob("#{ARGV[1]}/*.rb").each do |my_file|
	name = my_file.split("/").last.split("_")
	if students.include? [name[1],name[0]] then
		students2 << [name[1],name[0]]
	end
end
CSV.open("result.csv","w") do |csv|
	students2.sort.each do |last,first|
		csv << [first,last]
	end
end
