=begin
Develop a program named FirstName_LastName_ClassNumber_7a0cd1d9.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 10 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in xml format named result.xml.

<results>
<file1.rb>N</file1.rb>
<file2.rb>11</file2.rb>
...
</results>
^
There shouldn't be newline at the end of the result file.
=end

count_hash = Hash.new

Dir.glob("#{ARGV[0]}/**/*.rb").each do |raw_file|
	i = 0
	filename = raw_file.split("/").last
	count_hash[filename] = 0
	file = File.open("#{raw_file}")
	file_read = file.readlines
	file_read.each do |line|
		line.split(" ").each do |word|
			if word.length == 0
				i += 1
				count_hash[filename] = i
			end
		end
	end
end

count_hash = count_hash.sort_by{|key,val| val}

File.open("result.xml","w") do |xml|
	xml.write("<results>\n")
	count_hash.each do |key,value|
		xml.write("<#{key}>#{value}</#{key}>\n")
	end
	xml.write("</results>")
end
