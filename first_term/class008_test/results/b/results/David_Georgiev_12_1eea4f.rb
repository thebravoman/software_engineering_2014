	#Develop a program named FirstName_LastName_ClassNumber_1eea4f.rb

#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. file names in this folder are in the form First_Last_digits.rb;
#3. find all the students that have 5 letters in their second name;
#4. Sort the result by Last Name ASC.
#5. Produce a result in CSV format named result.csv:

#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN

	require 'csv'
	students_names = []
	Dir.glob("#{ARGV[0]}/**/*.rb") do |current_file|
	
	name = current_file.split('/').last.split(/_/)
	if name[1].length == 5
		if not students_names.include?(["#{name[1]}", "#{name[0]}"]) then
			students_names << (["#{name[1]}", "#{name[0]}"])
		end
	end
	end
	CSV.open("result.csv", "w") do |csv|
		students_names.sort.each do |last, first|
			csv << ["#{first}",  "#{last}"]
		end
	end
