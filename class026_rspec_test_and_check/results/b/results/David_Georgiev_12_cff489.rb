=begin
Develop a program named FirstName_LastName_ClassNumber_cff489.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end
require 'csv'
arr = Array.new
Dir.glob("#{ARGV[0]}/**/*.rb") do |my_file|
	first_name = my_file.split("/").last.split("_").first
	last_name = my_file.split("/").last.split("_")
	last_name = last_name[1]
	if first_name.length == 10 then
		if not arr.include? (["#{last_name}", "#{first_name}"]) then
			arr << (["#{last_name}", "#{first_name}"])
		end
	end
end
CSV.open("result.csv", "w") do |csv|
students_names.sort.each do |last, first|
csv << ["#{first}", "#{last}"]
end
end

