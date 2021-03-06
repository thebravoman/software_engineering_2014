#Develop a program named FirstName_LastName_ClassNumber_8aa1b1.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
#3. Calculate the length of their names (including extensions).;
#4. Sort the result by length DESC;
#5. Produce a result in CSV format named result.csv:


require 'csv'

result = Hash.new
for i in 0..1 do
	Dir.glob(ARGV[i]+"/*") do |path|
		filename = path.split(/\//).last
		if filename.count("_") == 2 && filename.include?(".")
			firstname = filename.split("_").first
			lastname = filename.split("_")[1]
			digit = filename.split("_")[2].split(".").first
			extension = filename.split(".").last
			if firstname == '' || lastname == ''
				result[filename] = filename.length
			end
		else
			result[filename] = filename.length
		end
	end
end

CSV.open("result.csv", "w") do |csv|
	result.sort{|key, val| [val, key]}.each.reverse |rslt|
		csv << rslt
	end
end
