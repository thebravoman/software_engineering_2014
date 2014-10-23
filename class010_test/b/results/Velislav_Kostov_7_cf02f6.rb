=begin
Develop a program named FirstName_LastName_ClassNumber_cf02f6.rb

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
Dir.glob(ARGV[0] + "*.rb").each do |file|
    if file.split(/\//).last.split(/\_/)[1].length == 5
        hash[file.split(/\//).last.split(/\_/).first] = file.split(/\//).last.split(/\_/)[1]
    end
end

hash = Hash[hash.sort_by{|key, val| key}.reverse]

CSV.open("result.csv", "w") do |csv|
    hash.each_pair{|first, last| csv << [first, last]}
end 
