=begin
Develop a program named FirstName_LastName_ClassNumber_db7481b7.rb;

1. You are given an argument for a path to CSV file:
1.1 if there are other arguments they should be discarded;
2. CSV contains students and is in format "Name,number";
3. Find all students with number = 6;
4. Sort by Name ASC and produce XML called "result.xml" which 
contains only the Names of the students you have found.

Example:
CSV:					
	Name5,6
	Name2,6			
	Name3,13					
	Name42,18				
	Name1,6			
output XML:
<students>
	<name>Name1</name>
	<name>Name2</name>
	<name>Name5</name>
</students>
=end

results = Array.new
csv = File.read(ARGV[0])
csv.split("\n").each do |line|
name = line.split(",").first
number = line.split(",")[1].to_i
results << name if number == 6
end
results = results.sort

xml = File.open("result.xml", "w")
	xml.puts("<students>")
	results.each do |name|
		xml.puts("	<name>#{name}</name>")
	end
	xml.puts("</students>")
xml.close

