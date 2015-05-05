=begin
Develop a program named FirstName_LastName_ClassNumber_04cdec.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. file names in this folder are in the form First_Last_digits.rb; 
3. find all the students that have 5 letters in their second name;
4. Sort the result by First name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN

=end

require 'csv'
hash = Hash.new

def is_number(str)
	str[/[-+0-9]+/] == str
end

#is_number = [1,2,3,4,5,6,7,8,9,0]

Dir.glob("#{ARGV[0]}/*.rb") do |path|
	file_name = path.split(/\//).last
		if file_name.count("_") == 2
			first_name = file_name.split("_").first
			last_name = file_name.split("_")[1]
			digit = file_name.split("_").last.split(".").first
		if is_number(digit) and last_name.length == 5
			hash[first_name] = last_name
		end
		end
end

CSV.open("result.csv", "w") do |csv|
		hash.sort_by{|key, val| key}.reverse.each do |element|
		csv << element
	end
end
			
		


