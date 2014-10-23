=begin
Develop a program named FirstName_LastName_ClassNumber_f9f38e.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 5 letters in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

require 'csv'
students = Array.new
Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last.split('_')
	first_name = s[0]
	last_name = s[1] 
	if last_name.length == 5
		students << ["#{last_name}", "#{first_name}"]
	end
end 
students.sort_by{|x, y| x}
CSV.open("result.csv", "w") do |csv|
	students.each do |first, last|
		csv<< ["#{last}", "#{first}"]
	end
end
