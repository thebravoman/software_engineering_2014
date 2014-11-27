=begin
Develop a program named FirstName_LastName_ClassNumber_990d42f4.rb;

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

csv1 = File.read(ARGV[0])
csv2 = File.read(ARGV[1])
results = Hash.new
csv1.split("\n").each do |line1|
	csv2.split("\n").each do |line2|
		if line1 == line2
			first = line1.split(",").first
			last = line1.split(",")[1]
			results[first] = last
		end
	end
end

#results = results.sort_by{|key, val| key}
require_relative "Simeon_Shopkin_23_990d42f4_writer.rb"
writer = HTMLWriter.new
writer.write(results)
