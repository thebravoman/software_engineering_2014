=begin
Develop a program named FirstName_LastName_ClassNumber_a84275.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ASC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'
result = Hash.new
Dir.glob(ARGV[0]+"*").each do |files1|
	short1 = files1.split("/").last
	ext1 = short1.split(".").last
	shorter1 = short1.split(".").first
	digit1 = shorter1.split("_").last
	if (ext1 != "rb") or (digit1.to_i.to_s != digit1) or (short1.scan("_").count != 2)
		result[short1] = short1.length
	end
end
Dir.glob(ARGV[1]+"*").each do |files2|
	short2 = files2.split("/").last
	ext2 = short2.split(".").last
	shorter2 = short2.split(".").first
	digit2 = shorter2.split("_").last
	if (ext2 != "rb") or (digit2.to_i.to_s != digit2) or (short2.scan("_").count != 2)
		result[short2] = short2.length
	end
end

CSV.open("result.csv", "w") do |csv|
		result.sort_by{|k, v| v}.each do |element|
		csv << element
	end
end
