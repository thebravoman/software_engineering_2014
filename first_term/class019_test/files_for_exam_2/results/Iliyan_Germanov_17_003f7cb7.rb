=begin
Develop a program named FirstName_LastName_ClassNumber_003f7cb7.rb

1. You are given an argument for a folder with files.
1.1. If there are other arguments they should be discarded..
2. In this folder there is a CSV file, containing file names, along with other file formats.
3. Parse the CSV file.
4. Find all files that have 3 "-" in them including extensions.
5. Calculate their file name length including extensions.
6. Sort the result by File Name DESC.
7. Produce a result in JSON format named 003f7cb7.json:

	{
		"File1":"Length1"
		"File2":"Length2"
		...
		"FileN":"LengthN"
	}
=end

#what is the format of the csv file???
require "./Iliyan_Germanov_json_writer.rb"
results = Hash.new
Dir.glob("#{ARGV[0]}/*.csv") do |path|
	csv = File.read(path)
	csv.split("\n").each do |line|
		results[line] = line.length if line.count("-") == 3
	end
end

writer = JSONWriter.new
writer.write(results)


