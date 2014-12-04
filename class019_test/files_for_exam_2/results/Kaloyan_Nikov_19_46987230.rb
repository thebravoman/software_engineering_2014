=begin
Develop a program named FirstName_LastName_ClassNumber_46987230.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 6 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":9,"file2.rb":11,......
^
There shouldn't be newline at the end of the result file.
=end

require 'json'
count_hash = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	i = 0
	filename = raw_file.split("/").last
	count_hash[filename] = 0
	file = File.open("#{raw_file}")
	file_read = file.readlines
	file_read.each do |line|
		line.split(" ").each do |word|
			if word.length == 6
				i += 1
				count_hash[filename] = i
			end
		end
	end
end

k = 0

File.open("results.json","w") do |json|
	count_hash.each do |key,value|
		if k >= 1
			json.write(",")
		end
		json.write("\"#{key}\":#{value}")
		k += 1
	end
end
