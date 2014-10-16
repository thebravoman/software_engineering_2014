#Develop a program named FirstName_LastName_ClassNumber_4bbed0.rb

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



names = Hash.new
Dir.glob (ARGV[0] + "*.rb") do |file|
	if (ARGV[1] == true)
		ARGV[1] == false
	end
	
	slice = file.split("/").last
	first_name = slice.split('_')[0]
	second_name = slice.split('_')[1]
	if (second_name.length == 5)
		#print first_name
		#puts second_name
		names[first_name] = second_name
	end
	
end

names = names.sort
puts names

require 'csv'
CSV.open("results.csv", "w") do |csv|
	names.to_a.each do |element|
		csv << element
	end
end
