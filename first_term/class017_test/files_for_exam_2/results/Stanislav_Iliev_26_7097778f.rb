=begin
Develop a program named FirstName_LastName_ClassNumber_7097778f.rb;

1. You are given an argument for a path to CSV file:
1.1 if there are other arguments they should be discarded;
2. CSV contains students and is in format "Name,number";
3. Find all students with number = 5;
4. Sort by Name ASC and produce XML called "result.xml" which contains only the Names of the students you have found.

Example:
CSV:					
	Name5,5
	Name2,5			
	Name3,13					
	Name42,18				
	Name1,5			
output XML:
<students>
	<name>Name1</name>
	<name>Name2</name>
	<name>Name5</name>
</students>
=end
names = Array.new
i = 0

file = File.open("#{ARGV[0]}")
file_read = file.readlines
file_read.each do |line|
	line = line.gsub "\n",""
	name = line.split(",").first
	number = line.split(",").last
	if number.to_i == 5
		names[i] = name
		i += 1
	end
end

File.open("result.xml", "w") do |xml|
	xml.write("<students>\n")
	names.each do |e|
		xml.write("\t<name>#{e}</name>\n")
	end
	xml.write("</students>")
end
