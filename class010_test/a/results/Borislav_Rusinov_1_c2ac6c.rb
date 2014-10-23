=begin
Develop a program named FirstName_LastName_ClassNumber_c2ac6c.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN

=end


a=ARGV[0]
hash=Hash.new
require 'csv'
Dir.glob("#{ARGV[0]}*.rb*")  do |my_text_file|
	last_name = my_text_file.split("/").last.split(".").first.split("_")
	if last_name[1]!=nil && last_name[0].length==10
		hash[last_name[1]]=last_name[0]
	end
end
a=hash.sort.reverse
File.open("result.csv", "w") do |csv|	  
	a.each do |arg|
		csv.puts("#{arg[1]},#{arg[0]}")
	end
end
