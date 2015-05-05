=begin
Develop a program named FirstName_LastName_ClassNumber_e22013.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end

require 'csv'

hash1 = Hash.new
hash2 = Hash.new

Dir.glob("#{ARGV[0]}*_*_*.rb") do |file1|
	Dir.glob("#{ARGV[1]}*_*_*.rb") do |file2|
		firstName1 	= file1.split("/").last.split("_").first
		lastName1 	= file1.split("/").last.split("_", 2).last.split("_").first
		number1 		= file1.split("_").last.split(".").first
		
		firstName2 	= file2.split("/").last.split("_").first
		lastName2 	= file2.split("/").last.split("_", 2).last.split("_").first
		number2 		= file2.split("_").last.split(".").first
		
		if number1.to_i.to_s == number1
			if !firstName1.empty? && !lastName1.empty? 
				hash1[lastName1 + "," + firstName1] = NIL
			end
		end
		
		if number2.to_i.to_s == number2
			if !firstName2.empty? && !lastName2.empty?
				hash2[lastName2 + "," + firstName2] = NIL
			end
		end
	end
end

CSV.open("result.csv", "w") do |csv|
	hash1.sort_by{|k,v| k.split(",").first}.each do |key, value|
		if !hash2.has_key?(key)
				firstName = key.split(",").last
				lastName = key.split(",").first
				csv << [lastName,firstName]
		end
	end
end
