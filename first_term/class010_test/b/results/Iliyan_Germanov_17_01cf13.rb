=begin
Develop a program named FirstName_LastName_ClassNumber_01cf13.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end

require 'csv'
results = Hash.new
results.compare_by_identity
def is_number(str)
	str[/[-0-9]+/] == str
end
Dir.glob("#{ARGV[0]}/*.rb") do |path1|
	filename1 = path1.split(/\//).last
	if filename1.count("_") == 2
		first1 = filename1.split("_").first
		last1 = filename1.split("_")[1]
		digit1 = filename1.split("_")[2].split(".").first
		name1 = first1 + last1
		Dir.glob("#{ARGV[1]}/*.rb") do |path2|
			filename2 = path2.split(/\//).last
			if filename2.count("_") == 2
				first2 = filename2.split("_").first
				last2 = filename2.split("_")[1]
				digit2 = filename2.split("_")[2].split(".").first
				name2 = first2 + last2
				if name1 == name2 and is_number(digit1) and is_number(digit2)
					if first1.length == 5
						results[last2] = first2
					end
				end
			end
		end
	end
end

CSV.open("result.csv", "w") do |csv|
	results.sort_by{|key, val| [key, val]}.each do |el|
		csv << el
	end
end
