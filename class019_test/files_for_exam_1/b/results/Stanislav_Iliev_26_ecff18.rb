=begin
Develop a program named FirstName_LastName_ClassNumber_ecff18.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
4. Sort the result by File name DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3
=end

require 'csv'
hash = Hash.new

dir1 = ARGV[0]
dir2 = ARGV[1]

Dir.glob("#{dir1}/*") do |file1|
	filename = file1.split("/").last
	if filename.scan(/[0-9]/).length == 7
		hash[filename] = (filename.length / 2).to_i
	end
end

Dir.glob("#{dir2}/*") do |file2|
	filename2 = file2.split("/").last
	if filename2.scan(/[0-9]/).length == 7
		hash[filename2] = (filename2.length / 2).to_i
	end
end

hash = hash.sort_by{|key,val| key}.reverse

CSV.open("result.csv", "w") do |csv|
	hash.each do |e|
		csv << e
	end
end