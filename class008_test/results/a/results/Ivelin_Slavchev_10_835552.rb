=begin
	Develop a program named FirstName_LastName_ClassNumber_835552.rb

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
result = Hash.new
Dir.glob(ARGV[0] + "*").each do |file1|
	short1 = file1.split("/").last
	ext1 = short1.split(".").last
	names1 = short1.split(".").first
	digit1 = file1.split("_").last.split(".").first
	if (ext1 != "rb") or (digit1.to_i.to_s != digit1) or (short1.scan("_").count != 2)
		result[short1] = short1.length
	end
end
Dir.glob(ARGV[1] + "*").each do |file2|
	short2 = file2.split("/").last
	ext2 = short2.split(".").last
	names2 = short2.split(".").first
	digit2 = file2.split("_").last.last.split(".").first
	if (ext2 != "rb") or (digit2.to_i.to_s != digit) or (short2.scan("_").count != 2)
		result[short2] = short2.length
	end
end
result = result.sort_by{|k, v| v}
CSV.open("result.csv", "w") do |csv|
	result.each do |p|
		csv << p
	end
end
