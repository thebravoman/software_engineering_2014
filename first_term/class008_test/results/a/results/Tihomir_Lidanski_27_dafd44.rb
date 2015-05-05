#Develop a program named FirstName_LastName_ClassNumber_dafd44.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
#4. Sort the result by File name ;
#5. Produce a result in CSV format named result.csv:

#			File1,3
#			File2,4
#			...
#			FileN,3

require 'csv'

Dir.glob(ARGV[0] + "*.") do |file|
	name = file.split ("/")last.split(".")
	
	
Dir.glob(ARGV[1] + "*.") do |file|




puts name.length % 2.round()



end
end

CSV.open("result.csv", "w") do |csv|
	


end


