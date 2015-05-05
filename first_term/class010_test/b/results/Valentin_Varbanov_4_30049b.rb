=begin
Develop a program named FirstName_LastName_ClassNumber_30049b.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ASC;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end

def rightFormat(name)
	temp = name.split(/_/)
	if temp.length == 3
		firstName = temp.first
		lastName = temp[1]
		digit = temp.last.split(/\./).first
		if !(firstName =~ (/A-Za-z0-9+/)) && !(lastName =~ (/A-Za-z0-9/)) && !(digit =~ (/0-9+/))
			return true #correct
		end
	else
		return false #wrong
	end
end

hash = Hash.new
arr = Array.new

for i in 0..1
	Dir.glob("#{ARGV[i]}/*.rb") do |dir|
		name = dir.split('/').last
		if !rightFormat(name)
			hash[name] = name.length
			arr.push(name)
		end
	end
end


hash = hash.sort_by{|k, v| k}
hash = hash.sort_by{|k, v| v} 

require 'csv'

CSV.open("result.csv","w") do |csv|
	hash.each do |element|
		csv << element
	end
end

