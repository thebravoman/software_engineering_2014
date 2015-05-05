=begin
Develop a program named FirstName_LastName_ClassNumber_efef0d.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 5 symbols in their second name;
4. Sort the result by First name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN

=end

require "csv"

arr = []
i = 0

Dir.glob(ARGV[0]+"*.rb") do |file|
 	name = file.split('/').last.split('.').first.split('_')
 	firstname = name[0]
	lastname = name[1]
	exercise = name[2]	
		
	if firstname == '' || lastname == '' || exercise == ''
	elsif name.length == 3	
	
 	if lastname.length == 5
  		arr[i] = []
  		arr[i][0] = name[0]
  		arr[i][1] = name[1]
  		i+=1
  	end
  	end
end 


sort = arr.sort_by{|asd| asd[0]}.reverse!
CSV.open("result.csv", "w") do |csv|
 	sort.each do |element|
  		csv << element
	end
end
