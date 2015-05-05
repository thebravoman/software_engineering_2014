=begin
Develop a program named FirstName_LastName_ClassNumber_582de2e5.rb
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

path = ARGV[0] + "*.*"
array = Array.new
array1 = Array.new
array2 = Array.new 
count = 0
how_count = 1

Dir.glob(path).each do |file|
	#puts file
	s = file.split('/').last
	s1 = file.split('/').last.split('.')[0]
	s2 = file.split('/').last.split('.')[1]
	#puts s1
	if s.length == 10
		array.push(s)
		array1.push(s)
	end
	
	if s1.length == 10
		array.push(s1+"."+s2)
		array1.push(s1+"."+s2)
	end
end

array.sort!
array1.sort!

while count < array.length
	array2[count] = 0
	count += 1
end

count = 0

while count < array.length
	if array.include?(array1[count])
		array2[count] += 1
	end
	count += 1
end

count = 0

File.open("result.xml", "w") {
	|input|
	input << "<results>\n"
	
	while count < array.length
		input << "<#{array[count]}>#{array2[count]}</#{array[count]}>\n"
		count += 1
	end
	
	input << "</results>\n"
}
