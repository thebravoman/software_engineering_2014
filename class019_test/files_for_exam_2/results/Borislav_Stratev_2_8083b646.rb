=begin
Develop a program named FirstName_LastName_ClassNumber_8083b646.rb;

1. You are given two argument for two paths to two CSV files in format "FirstName,LastName":
1.1 if there are other arguments they should be discarded;
2. Find all the students that are in both CSV files;
3. Sort the result by LastName ASC;
4. Produce a HTML named "result.html" in the following format:

<html>
<ul>
	<li>LastName1</li>
	<li>LastName2</li>
	<li>LastNameN</li>
</ul>
</html>
=end

csv1 = File.read(ARGV[0])
csv2 = File.read(ARGV[1])
result = Hash.new
csv1.split("\n").each do |name1|
	csv2.split("\n").each do |name2|
		if name1 == name2
			first = name1.split(",").first
			last = name1.split(",")[1]
			result[first] = last
		end
	end
end


result = result.sort_by{|key, val| val}
require_relative "html_writer.rb"
writer = HTMLWriter.new
writer.write(result)


