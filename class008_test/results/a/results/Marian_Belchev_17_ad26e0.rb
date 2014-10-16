=begin
Develop a program named FirstName_LastName_ClassNumber_ad26e0.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by First name ;
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
		number1 = file1.split("_").last.split(".").first
		
		firstName2 	= file2.split("/").last.split("_").first
		lastName2 	= file2.split("/").last.split("_", 2).last.split("_").first
		number2 = file2.split("_").last.split(".").first
		
		hash1[firstName1] = lastName1 + "." + number1
		hash2[firstName2] = lastName2 + "." + number2
	end
end

CSV.open("results.csv", "w") do |csv|
	hash2.sort.each do |key, value|
		if !hash1.has_key?(key) && !hash1.has_value?(value.split(".").first) && !hash1.has_value?(value.split(".").last.to_i)
				csv << [key,value.gsub('.',"")]
		end
		if hash1.has_key?(key) && !hash1.has_value?(value.split(".").first) && !hash1.has_value?(value.split(".").last.to_i)
			csv << [key,value.gsub('.',"")]
		end
	end
end
