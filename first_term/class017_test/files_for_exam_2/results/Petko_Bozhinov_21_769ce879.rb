# Develop a program named FirstName_LastName_ClassNumber_769ce879.rb;

# 1. You are given an argument for a path to CSV file:
# 1.1 if there are other arguments they should be discarded;
# 2. CSV contains students and is in format "Name,number";
# 3. Find all students with number = 6;
# 4. Sort by Name ASC and produce XML called "result.xml" which contains only the Names of the students you have found.

# Example:
# CSV:					
# 	Name5,6
# 	Name2,6			
# 	Name3,13					
# 	Name42,18				
# 	Name1,6			
# output XML:
# <students>
# 	<name>Name1</name>
# 	<name>Name2</name>
# 	<name>Name5</name>
# </students>

require 'csv'
require 'builder'

file_ct = ""
output = Array.new
i = 0
File.open("#{ARGV[0]}", "r") do |csv|
	file_ct = csv.read
end
file_ct = file_ct.split(/\n/)
file_ct.each do |blah|
	file_output = blah.split(',')
	if file_output[0]
		if file_output[1]
			if file_output[1].to_i == 6
				output[i] = file_output[0]
				i+=1
			end
		end
	end
end
xml = Builder::XmlMarkup.new(:indent=>2)
	xml.students do |p|

		output.sort.each do |key|
		    p.name do |student|
		    	student.name "#{key}"
		   	end
		end
	end


file = File.new("result.xml", "wb")
file.print(xml.target!)
file.close
	