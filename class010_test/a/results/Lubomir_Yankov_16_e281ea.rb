=begin
Develop a program named FirstName_LastName_ClassNumber_e281ea.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

require 'csv'


array = []
count = 0

Dir.glob(ARGV[0] + "*.rb").each do |file|

	student_name = file.split("/").last.split(".").first.split("_")
	
	if student_name.length == 3
	
		if student_name[2].match(/^(\d)+$/)
			
			if student_name[1].length == 10
			
				array[count] = []
				array[count][0] = student_name[0]
				array[count][1] = student_name[1]
				count += 1
			
			end
			
		end
	
	end

end

sorted_array = array.sort_by{|first, last| last}

CSV.open("result.csv", "w") do |csv|

	sorted_array.each do |element|
	
		csv << element
	
	end

end
