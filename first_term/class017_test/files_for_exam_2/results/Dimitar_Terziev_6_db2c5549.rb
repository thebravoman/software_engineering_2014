=begin
Develop a program named FirstName_LastName_ClassNumber_db2c5549.rb;

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
require 'csv'
csv_pars = []
CSV.foreach(ARGV[0]) do |person|
	csv_pars << person
end
arr = []
csv_pars.each{ |person|
	puts person[1]
	if(person[1].to_i==5)
		arr.push(person[0])
	end
}
xml = "<students>"
arr.sort.each{|name|
	xml+="\n\t<name>#{name}</name>"
}
xml+="\n</students>"
puts xml
File.open("result.xml","w"){|f|
	f.puts xml
}
