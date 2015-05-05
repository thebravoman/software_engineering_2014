=begin
Develop a program named FirstName_LastName_ClassNumber_4a196f.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end

require 'csv'

hash = Hash.new

Dir.glob("#{ARGV[0]}*").each do |path|
	first_name = 	path.split("/").last.split("_").first
	last_name = 	path.split("/").last.split("_", 2).last.split("_").first
	digit = 		path.split("/").last.split("_", 2).last.split("_").last.split(".").first
	name = path.split("/").last
	
	if name.include? "_" then counter = name.count "_" end

	if (counter != 2) || (digit.to_i.to_s != digit)
		l = name.length
		hash[name] = l
	end
end
Dir.glob("#{ARGV[1]}*").each do |path|
	first_name = 	path.split("/").last.split("_").first
	last_name = 	path.split("/").last.split("_", 2).last.split("_").first
	digit = 		path.split("/").last.split("_", 2).last.split("_").last.split(".").first

	
	
	name = path.split("/").last
	if name.include? "_" then counter = name.count "_" end

	if (counter != 2) || (digit.to_i.to_s != digit)
		l = name.length
		hash[name] = l
	end
end	

CSV.open("result.csv", "w") do |csv|
	hash.sort_by{ |k, v| v}.each do |name, length|
		csv << ["#{name}","#{length}"]
	end
end
