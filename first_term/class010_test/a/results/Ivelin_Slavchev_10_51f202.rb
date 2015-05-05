=begin
Develop a program named FirstName_LastName_ClassNumber_51f202.rb

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
require 'csv'
result = Hash.new
Dir.glob(ARGV[0]+"*.rb").each do |file|
	short = file.split("/").last.split(".").first
	first_name = short.split("_").first
	last_name = short.split("_",2).last.split('_').first
	digit = short.split("_").last
	if (first_name.length == 10) && (last_name != "") && (short.scan("_").count == 2) && (digit.to_i.to_s == digit)
		result.compare_by_identity
		result[first_name] = last_name
	end
end
CSV.open("result.csv", "w") do |csv|
	result.sort_by{|k, v| v}.reverse.each do |p|
		csv << p
	end
end
