=begin
Develop a program named FirstName_LastName_ClassNumber_5fcdeb.rb

1. you are given homework014(class014_homework) folder
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_class_digits.rb; 
3. find all the students that have more than 6 symbols in their second name and their number is even;
4. Sort the result by First name ASC.
5. Produce a result in csv format named results.csv:
6. Use csv_writer.rb
6.1 csv_writer.rb ->
"
require 'csv'
class CSVWriter
	def write(student)
		CSV.open("results.csv", "w") do |csv| 
			student.sort.each do |key, value|
				csv << ["#{key}", "#{value}"]
			end
		end
	end
end
"
7. expected results:
"firstName1,LastName1
 firstName2,lastName2",
 
=end
require_relative 'csv_writer.rb'


student = Hash.new()

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory|

	firstName = directory.split("/").last.split("_").first.capitalize	
	lastName = directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i


	if lastName.length > 6 && digits.even?
		student[firstName] = lastName
	end
end

writer = CSVWriter.new()

writer.write(student)
