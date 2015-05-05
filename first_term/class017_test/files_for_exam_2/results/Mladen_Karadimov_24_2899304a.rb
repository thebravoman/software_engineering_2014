=begin
Develop a program named FirstName_LastName_ClassNumber_2899304a.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 7 letters in FirstName and 7 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
	FirstName1,LastName1
	FirstName2,LastName2
			...
	FirstNameN,LastNameN
=end

students = Hash.new

require 'csv'
Dir.glob(ARGV[0]+"/*_*_*.rb") do |file|
	file = file.split('/').last.split('_')
	if file[0].length == 7 && file[1].length == 7
		students[file[0]] = file[1]
	end
end

students = Hash[students.sort_by{|k,v|k}]

CSV.open("results.csv","w") do |csv|
	students.each do |name|
		csv << name
	end
end