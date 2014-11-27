=begin
Develop a program named FirstName_LastName_ClassNumber_267a81.rb

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

results = Hash.new
	Dir.glob("#{ARGV[0]}/**/*_*_*.rb") do |path|

	filename = path.split("/").last
	firstname = filename.split("_").first
	lastname = filename.split("_")[1]
		if firstname.length == 10
	results[firstname] = lastname
		end
	end
	
	CSV.open("result.csv", "w") do |csv|
		results.sort_by{|key, val| key}.each do |el|
		csv << el
		end
end
