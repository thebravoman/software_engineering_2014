=begin
Develop a program named FirstName_LastName_ClassNumber_f33e8621.rb
You are given an argument for a folder with files.
Count how many of the words have 10 letters.
Sort the result by number of times found in ASC order.
Produce a result in xml format named result.xml.

<results>
<file1.rb>N</file1.rb>
<file2.rb>11</file2.rb>
...
</results>
=end

require 'csv'
count_hash = Hash.new
Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
i = 0
filename = raw_file.split("/").last
count_hash[filename] = 0
file = File.open("#{raw_file}")
file_read = file.readlines
file_read.each do |line|
line.split(" ").each do |word|
if word.length == 5
i += 1
count_hash[filename] = i
end
end
end
end
count_hash = count_hash.sort_by{|key,val| val}.reverse

xml = File.open("result.html", "w")
	xml.puts("<results>")
	hash.each do |key, value|
		
		xml.puts("<file1.rb>#{key}</file1.rb>")
		xml.puts("<file2.rb>#{value}</file2.rb>")
	end
		
	html.puts("</body>")
	html.puts("</results>")
	
html.close
