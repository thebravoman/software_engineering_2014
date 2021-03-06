=begin
Develop a program named FirstName_LastName_ClassNumber_6fb3ad.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 10 letters in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN


=end
a=ARGV[0]
require 'csv'
array=[]
Dir.glob("#{a}*.*")  do |my_text_file|
	name = my_text_file.split("/").last.split(".").first.split("_")	
	if name[1]!=nil && name[0].length == 10
		array << name[0] + "," + name[1]
	end
end
array.sort!
array.reverse!
File.open("results.csv", "w") do |csv|	  
	array.each do |arg|
	csv.puts(arg)
	end
end
