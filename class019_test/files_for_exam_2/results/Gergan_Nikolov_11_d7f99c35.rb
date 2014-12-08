=begin
Develop a program named FirstName_LastName_ClassNumber_d7f99c35.rb;

1. You are given an argument for a path to CSV file:
1.1 if there are other arguments they should be discarded;
2. CSV contains students and is in format "Name,number";
3. Find all students with number = 6;
4. Sort by Name ASC and produce XML called "result.xml" which contains only the Names of the students you have found.

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

require 'csv'

path = ARGV[0]

names = Array.new()
nums = "SWAG"
CSV.foreach(path) do |row|
	nums = row.last
	if (nums.to_i == 6)
		names.push(row.first)
	end
end

names.sort!

#Mighty XML
File.open("result.xml", "w") {
	|xml|
	xml << "<students>\n"
	
	names.each do |name|
		xml << "\t<name>#{name}</name>\n"
	end
	
	xml << "</students>\n"
}
