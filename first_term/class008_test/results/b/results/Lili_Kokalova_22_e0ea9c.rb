=begin
Develop a program named FirstName_LastName_ClassNumber_e0ea9c.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by First name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end
	
require 'csv'
student = Array.new
student1 = Array.new

Dir.glob(ARGV[0]+"/**/*.*").each do |file_name1|
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	p first_name
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	#task = file_name.split("_").last.split(".").first
	student << ["#{first_name}", "#{last_name}"]
end

Dir.glob(ARGV[1]+"/**/*.*").each do  |file_name1|	
	file_name = file_name1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	p first_name
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	#task = file_name.split("_").last.split(".").first
	student1 << ["#{first_name}", "#{last_name}"]
end

CSV.open("result.csv", "w") do |csv|
	student.each do |fn, ln|
		student1.each do |fn1, ln1|
			if fn != fn1 
				if ln != ln1
					csv << ["#{fn1}", "#{ln1}"]
				end
			end
		end
	end		
end			


















