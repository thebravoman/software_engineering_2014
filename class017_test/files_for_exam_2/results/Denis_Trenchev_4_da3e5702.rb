=begin

Develop a program named FirstName_LastName_ClassNumber_da3e5702.rb;

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

require_relative "Denis_Trenchev_4_da3e5702_XMLwriter.rb"

results = Array.new
csv = File.read(ARGV[0])
csv.split("\n").each do |line|
	name = line.split(",").first
	number = line.split(",")[1].to_i
	results << name if number == 5
end

results = results.sort

writer = XMLWriter.new
writer.write(results)
