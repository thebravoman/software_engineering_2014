# Develop a program named FirstName_LastName_ClassNumber_2c40c53d.rb;

# 1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
# 1.1 if there are other arguments they should be discarded;
# 2. Find all the students that have 7 letters in FirstName and 7 letters in LastName;
# 3. Sort the result ASC;
# 4. Produce CSV named "results.csv":

# Example:
# 	FirstName1,LastName1
# 	FirstName2,LastName2
# 			...
# 	FirstNameN,LastNameN


require 'csv'

name_array = Array.new
names = Array.new
i = 0

Dir.glob(ARGV[0] + "/*.rb") do |file|
	first_name = file.split(/\//).last.split(/_/).first.capitalize
	last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first.capitalize
	if(first_name.length == 7) && (last_name.length == 7)
		names[i] = first_name + "," + last_name
		i+=1
	end
end

	# puts names.

CSV.open("results.csv","w") do |csv|
	names.sort.each do |something|
		csv << [something.split(",").first, something.split(",").last]
	end
end