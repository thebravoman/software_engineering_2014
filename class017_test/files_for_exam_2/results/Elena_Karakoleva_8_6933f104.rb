=begin
Develop a program named FirstName_LastName_ClassNumber_6933f104.rb;

1. You are given two argument for two paths to two CSV files in format "FirstName,LastName":
1.1 if there are other arguments they should be discarded;
2. Find all the students that are in both CSV files;
3. Sort the result by FirstName ASC;
4. Produce a HTML named "result.html" in the following format:

<html>
<ul>
	<li>FirstName1</li>
	<li>FirstName2</li>
	<li>FirstNameN</li>
</ul>
</html>
=end
require './html_writer.rb'
student1 = Hash.new { |name, programs| name[programs] = []}
student2 = Hash.new { |name, programs| name[programs] = []}
student3 = Hash.new { |name, programs| name[programs] = []}
File.open(ARGV[0], 'r') do |f1|
	while line = f1.gets  
		firstname = line.split(",").first
		lastname = line.split(",").last
		student1["#{firstname}"] = lastname.to_s
	end  
end 

File.open(ARGV[1], 'r') do |f1|
	while line = f1.gets  
		firstname1 = line.split(",").first
		lastname1 = line.split(",").last
		student2["#{firstname1}"] =  lastname1.to_s
	end  
end 

	student1.sort.reverse.each do |name, last|
		student2.sort.each do |name1, last1|
			if name1 == name
				names = name1
				student3["#{names}"] = last.to_s
				writer = HTMLWriter.new
				writer.write student3
			end
		end
	end
