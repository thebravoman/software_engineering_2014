=begin
Develop a program named FirstName_LastName_ClassNumber_c241b2.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1.extension,3
			File2.extension,4
			...
			FileN.extension,3

=end


require 'csv'
hash = Hash.new

Dir.glob("#{ARGV[0]}*.*") do |file|
	count = 0 
	filename = file.split('/').last.split('.').first;
	withext = file.split('/').last
	filename.each_char do |c|
		if (c >= '0') and (c <= '9')
			count += 1
		end
	end
	if count == 7 
			hash[withext] = withext.length/2
	end	
end

Dir.glob("#{ARGV[1]}*.*") do |file|
	count = 0 
	filename = file.split('/').last.split('.').first;
	withext = file.split('/').last
	filename.each_char do |c|
		if (c >= '0') and (c <= '9')
			count += 1
		end
	end
	if count == 7 
			hash[withext] = withext.length
	end	
end

hash = Hash[hash.sort_by{|k, v| k}.reverse]

CSV.open("result.csv", "w") do |csv|
	hash.each do |key, value|
		csv << [key, value].flatten
	end
end