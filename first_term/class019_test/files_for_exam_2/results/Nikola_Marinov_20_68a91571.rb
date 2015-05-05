#Develop a program named FirstName_LastName_ClassNumber_68a91571.rb
#
#1. You are given an argument for a folder with files.
#1.1. If there are other arguments they should be discarded..
#2. In this folder there is a CSV file, containing file names, along with other file formats.
#3. Parse the CSV file.
#4. Find all files that have 3 "-" in them including extensions.
#5. Calculate their file name length including extensions.
#6. Sort the result by File Name DESC.
#7. Produce a result in JSON format named 68a91571.json:
#
#	{
#		"File1":"Length1"
	#	"File2":"Length2"
	#	...
		#"FileN":"LengthN"
	#}

require_relative "jsonWriter.rb"
require 'csv'
hash = Hash.new
Dir.glob(ARGV[0] + "*.csv").each do |file|
CSV.foreach(file) do |csv|
count = 0
char_csv = csv.to_s.split("")
char_csv.each do |c|
if c == "-"
count += 1
end
end
if count == 3
len = csv.to_s.length.to_i
hash[csv] = len - 4
end
end
end
a = JSONWriter.new
a.write(hash)
