=begin
Develop a program named FirstName_LastName_ClassNumber_afb738.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 5 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN

=end

require 'csv'

folder = ARGV[0]
hash = Hash.new

Dir.glob("#{folder}/*_*_*.rb").each do |file|
	last_name = file.split("/").last.split("_")[1]
	first_name = file.split("/").last.split("_")[0]

	if last_name.length == 5
		hash[first_name] = last_name
	end
end

CSV.open("result.csv", "w") do |csv|
	hash.sort_by{|key,val| key}.reverse.each do |e|
		csv << e
	end
end