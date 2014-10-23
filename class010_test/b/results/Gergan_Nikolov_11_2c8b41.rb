=begin
Develop a program named FirstName_LastName_ClassNumber_2c8b41.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by length ASC;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end

require 'csv'

array1 = Array.new()

count = 0

Dir.glob(ARGV[0]+"*.*").each do |file|
	s = file.split('/').last
	h1 = s.split('_')[0]
	h2 = s.split('_')[1]
	if s.split('_')[2] != nil
		h3 = s.split('_')[2].split('.').first
	elsif s.split('_')[2] == nil
		array1[count] = s
		count += 1
	end
	
	if h1 == "0"
		array1[count] = s
		count += 1
	elsif h2 == "0"
		array1[count] = s
		count += 1
	end
	
	if h1.to_i != 0
		array1[count] = s
		count += 1
	elsif h2.to_i != 0
		array1[count] = s
		count += 1
	elsif h3.to_i == 0 && h3 != "0"
		array1[count] = s
		count += 1
	end
end

#puts array1

Dir.glob(ARGV[1]+"*.*").each do |file1|
	s1 = file1.split('/').last
	h1 = s1.split('_')[0]
	h2 = s1.split('_')[1]
	if s1.split('_')[2] != nil
		h3 = s1.split('_')[2].split('.').first
	elsif s1.split('_')[2] == nil
		array1[count] = s1
		count += 1
	end
	
	if h1 == "0"
		array1[count] = s1
		count += 1
	elsif h2 == "0"
		array1[count] = s1
		count += 1
	end
	
	if h1.to_i != 0
		array1[count] = s1
		count += 1
	elsif h2.to_i != 0
		array1[count] = s1
		count += 1
	elsif h3.to_i == 0
		array1[count] = s1
		count += 1
	end
end

array1.uniq!
array1.sort!

CSV.open("result.csv", "w") do |csv|
	array1.each do |name|
		csv << [name, name.length]
	end
end

