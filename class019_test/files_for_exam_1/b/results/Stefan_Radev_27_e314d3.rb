=begin
Develop a program named FirstName_LastName_ClassNumber_e314d3.rb

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
count = 0

Dir.glob("#{ARGV[0]}/*.rb") do |file|
	first = file.split(/\//).last 
	
	for pos in 0..first.length - 1
		if first[pos].chr == '0' || first[pos].chr == '1' || first[pos].chr == '2' || first[pos].chr == '3' || first[pos].chr == '4' || first[pos].chr == '5' || first[pos].chr == '6' || first[pos].chr == '7' || first[pos].chr == '8' || first[pos].chr == '9' 
		count +=1			
		end
	end
	if count == 7
	hash[first] = first.length/2 
	end
	count = 0		
end

Dir.glob("#{ARGV[1]}/*.rb") do |secFile|	
	sec = secFile.split(/\//).last
	for pos in 0..sec.length - 1
		if sec[pos].chr == '0' || sec[pos].chr == '1' || sec[pos].chr == '2' || sec[pos].chr == '3' || sec[pos].chr == '4' || sec[pos].chr == '5' || sec[pos].chr == '6' || sec[pos].chr == '7' || sec[pos].chr == '8' || sec[pos].chr == '9' 
		count +=1			
		end
	end
	if count == 7
	hash[sec] = sec.length/2 
	end
	count = 0	
	
end	

CSV.open("result.csv", "w") do |csv|
	hash.sort_by{|key,val| key}.reverse.each do |element|
	csv << element
	end
end
