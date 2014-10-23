=begin Develop a program named FirstName_LastName_ClassNumber_5ddc3f.rb

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

students = []

Dir.glob("#{ARGV[0]}**/*.rb").each do |stuff|
	name = stuff.split('/').last
	if name =~ /.+_.+_\d+\.rb/ then
		name = name.split('_')
		if  name[1].length == 5 then
			if not students.include?(["#{name[1]}",  "#{name[0]}"])  then
				students << ["#{name[1]}", "#{name[0]}"]
			end
		end
	end
end

CSV.open("result.csv", "w") do |csv|
	students.sort.each do |last, first|
		csv << ["#{first}",  "#{last}"]
	end
end
