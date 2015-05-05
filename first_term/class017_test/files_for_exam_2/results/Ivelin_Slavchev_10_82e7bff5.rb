=begin
Develop a program named FirstName_LastName_ClassNumber_82e7bff5.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 7 letters in FirstName and 7 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
	FirstName1,LastName1
	FirstName2,LastName2
			...
	FirstNameN,LastNameN
=end

require 'csv'

h = Hash.new

Dir.glob(ARGV[0] + "*_*_*.rb") do |file|
	short = file.split("/").last.split(".").first
	first_name = short.split("_").first
	last_name = short.split("_",2).last.split('_').first
	digit = short.split("_").last
	if (first_name.length == 7) && (last_name.length == 7) && (digit.to_i.to_s == digit)
		h.compare_by_identity
		h[first_name] = last_name
	end
end

CSV.open("results.csv", "w") do |csv|
	h.sort.each do |el|
		csv << el
	end
end
