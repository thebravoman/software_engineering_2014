=begin
Develop a program named FirstName_LastName_ClassNumber_318bd0c9.rb;

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
	if lastname.length == 7 && firstname.length == 7
		arr[i] = []
		arr[i][0] = name[0]
		arr[i][1] = name[1]
		i+=1
end
end
end
daiba = arr.sort_by{|asd| asd[0]}
CSV.open("results.csv", "w") do |csv|
daiba.each do |element|
csv << element
end
end
