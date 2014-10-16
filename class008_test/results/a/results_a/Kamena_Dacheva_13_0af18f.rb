=begin
Develop a program named FirstName_LastName_ClassNumber_0af18f.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 5 letters in their second name;
4. Sort the result by First name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

student = Hash.new { |name, programs| name[programs] = []}
directory = ARGV[0]
require "csv"

class String
  def is_number?
    Float(self) != nil rescue false
  end
end

Dir.glob("#{directory}/*.*") do |my_repository|

	name_dir = my_repository.split("/").last

	name = name_dir.split("_").first.capitalize
	sir_name = name_dir.split("_", 2).last.split("_").first.capitalize
	program = name_dir.split("_").last.split(".").first
	ex = name_dir.split("_").last.split(".").last

	if name_dir.include? "_" then counter = name_dir.count "_" end
	student["#{name}"] << sir_name if ((counter == 2) && (sir_name.length == 5) && (program.is_number?) && (ex == "rb"))
end

CSV.open("result.csv", "w") do |csv|
	student.sort_by{|k, v| v}.reverse.each do |f_name, l_name|
		csv << [f_name,l_name].flatten
	end
end	
