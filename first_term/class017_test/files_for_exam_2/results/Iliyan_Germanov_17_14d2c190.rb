=begin
Develop a program named FirstName_LastName_ClassNumber_14d2c190.rb;

1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
1.1 if there are other arguments they should be discarded;
2. Find all the students that have 6 letters in FirstName and 6 letters in LastName;
3. Sort the result ASC;
4. Produce CSV named "results.csv":

Example:
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
	if firstname.length == 6 and lastname.length == 6
		results[firstname] = lastname
	end
end

CSV.open("results.csv", "w") do |csv|
	results.sort_by{|key, val| key}.each do |el|
		csv << el
	end
end
