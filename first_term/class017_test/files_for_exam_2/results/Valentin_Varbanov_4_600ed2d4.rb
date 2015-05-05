=begin
Develop a program named FirstName_LastName_ClassNumber_600ed2d4.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 5 letters in FirstName and 5 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
	FirstName1,LastName1
	FirstName2,LastName2
			...
	FirstNameN,LastNameN
=end
require "csv"

result = Array.new

Dir.glob(ARGV[0] + "*_*_*.rb") do |file|
	file = file.split('/').last
	first_name = file.split('_')[0]
	last_name = file.split('_')[1]
	if ((first_name.length == 5) && (last_name.length == 5))
		result.push("#{first_name}_#{last_name}")
	end
end

result = result.sort

CSV.open("results.csv","w") do |csv|
	result.each do |res|
		csv << res.split('_')
	end
end
