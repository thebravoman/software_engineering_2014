#Develop a program named FirstName_LastName_ClassNumber_cfc3fed5.rb;
#
#1. You are given an argument for a path to CSV file:
#1.1 if there are other arguments they should be discarded;
#2. CSV contains students and is in format "Name,number";
#3. Find all students with number = 6;
#4. Sort by Name ASC and produce XML called "result.xml" which contains only the Names of the students you have found.
#
#Example:
#CSV:					
#	Name5,6
#	Name2,6			
#	Name3,13					
#	Name42,18				
#	Name1,6			
#output XML:
#<students>
#	<name>Name1</name>
#	<name>Name2</name>
#	<name>Name5</name>
#</students>

nyan = Array.new

File.open("#{ARGV[0]}", "r").each_line{ |line|
	if line.chomp.split(",")[1].to_i == 6
		nyan << line.chomp.split(",")[0]
	end
}

File.open("result.xml", "w") do |file|
	file.puts("<students>")
	nyan.sort.each do |student|
		file.puts("\t<name>#{student}</name>")
	end
	file.puts("</students>")
end
