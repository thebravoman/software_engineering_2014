=begin
Develop a program named FirstName_LastName_ClassNumber_89460c12.rb

1. You are given an argument for a folder with files.
1.1. If there are other arguments they should be discarded..
2. In this folder there is a CSV file, containing file names, along with other file formats.
3. Parse the CSV file.
4. Find all files that have 2 "_" in them including extensions.
5. Calculate their file name length including extensions.
6. Sort the result by Length DESC.
7. Produce a result in JSON format named 89460c12.json:

	{
		"File1":"Length1"
		"File2":"Length2"
		...
		"FileN":"LengthN"
	}
=end

require 'csv'
require 'json'

results = Hash.new

Dir.glob("#{ARGV[0]}/*.csv") do |file|
	CSV.foreach(file) do |row|
		line = row.join
		if line.count("_") == 2
			results[line] = line.length
		end
	end
end

sorted = results.sort_by {|k,v| v}.reverse

file = File.new("89460c12.json", "w")
file << "{\n"
results.sort_by {|k,v| v}.reverse.each do |k, v|
	file << "\t\"#{k}\":\"#{v}\" \n"
end
file << "}"