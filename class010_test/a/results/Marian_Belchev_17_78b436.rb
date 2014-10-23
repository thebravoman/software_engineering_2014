=begin
Develop a program named FirstName_LastName_ClassNumber_78b436.rb

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

hash = Hash.new

Dir.glob("#{ARGV[0]}*_*_*.rb") do |file|
	firstName 	= file.split("/").last.split("_").first
	lastName 	= file.split("/").last.split("_", 2).last.split("_").first
	number 		= file.split("_").last.split(".").first
	
	if number.to_i.to_s == number
		if !firstName.empty? && !lastName.empty?
			if firstName.length == 10
				hash[firstName] = lastName
			end
		end
	end
end

CSV.open("result.csv", "w") do |csv|
	hash.sort_by {|k,v| v}.reverse.each do |key, value|
		csv << [key,value]
	end
end
