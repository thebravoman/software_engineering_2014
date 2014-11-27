#Develop a program named FirstName_LastName_ClassNumber_20ba6d.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
#3. find all the students that have 5 symbols in their second name;
#4. Sort the result by Last Name ASC.
#5. Produce a result in CSV format named result.csv:

#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN

require 'csv'

students = Hash.new

Dir.glob("#{ARGV[0]}/*.rb").each do |dir|
#	p dir
	file_name = dir.split(/\//).last
	first_name = file_name.split("_")[0]
	last_name = file_name.split("_")[1]
	if last_name != nil && last_name.length == 5
		students[first_name] = last_name
	#	p first_name
	#	p last_name
	end
end

students = Hash[students.sort_by{|k,v| v}]

CSV.open("result.csv","w") do |csv|
	students.each do |stud|
		csv << stud
	end
end
