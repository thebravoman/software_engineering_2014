=begin
Develop a program named FirstName_LastName_ClassNumber_710716f5.rb

1. You are given an argument for a folder with files.
1.1. If there are other arguments they should be discarded..
2. In this folder there is a CSV file, containing file names, along with other file formats.
3. Parse the CSV file.
4. Find all files that have 2 "_" in them including extensions.
5. Calculate their file name length including extensions.
6. Sort the result by Length DESC.
7. Produce a result in JSON format named 710716f5.json:

	{
		"File1":"Length1"
		"File2":"Length2"
		...
		"FileN":"LengthN"
	}
=end

require 'csv'
hash = Hash.new

CSV.foreach(ARGV[0] + "/**/*.csv") do |row|
	split_file = row.split("_")
	if row.split("_")[0] !=nil && row.split("_")[1] !=nil
		if row.split("_")[2] == nil
			file_length = row.length 
			hash[row.split(",").first] == row.length
		end
	end
end 

hash.sort_by {|k,v| v}.reverse
	
file = File.open("710716f5.json","w")
file.puts "{"	
	
hash.to_a.each do |(k,v)|
file.print "\
\"#{k.split('_')[0]} #{k.split('_')[1]}\"\:\
{\"k\"v},\}}"
	file.print ","
	file.puts
end
file.print "}"
$end

	

