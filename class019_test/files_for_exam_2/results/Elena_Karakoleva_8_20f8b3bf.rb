=begin
Develop a program named FirstName_LastName_ClassNumber_20f8b3bf.rb;

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

require './Elena_Karakoleva_xml_writer.rb'
student = Hash.new { |name, programs| name[programs] = []}
student1 = Hash.new { |name, programs| name[programs] = []}

File.open(ARGV[0], 'r') do |f1|
	while line = f1.gets  
		firstname = line.split(",").first
		digit = line.split(",").last
		student["#{firstname}"] = digit.to_i
	end  
end 

	student.sort.each do |name, num|
		if num==5
			student1["#{name}"] = num
			writer = XMLWriter.new
			writer.write student1
		end
	end
