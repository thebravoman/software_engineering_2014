=begin
Develop a program named FirstName_LastName_ClassNumber_fd50e0.rb
1. you are given an argument for a folder with files;
2. some file names in this folder are in the form First_Last.csv
3. find all the students that have 10 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in HTML format named result.html:
<html>
	<head></head>
	<body>
		FirstName1,LastName1 FirstName2,LastName2 FirstNameN,LastNameN
	</body>
</html>
=end
require 'html_writer.rb'
result = Hash.new

Dir.glob(ARGV[0]+"fixture/*_*.csv").each do |file|
	short_file = file.split(/\//).last
	first_name = short_file.split(/_/).first.capitalize
	last_name = short_file.split(/_/).last.split(".").first.capitalize
	name = first_name + ',' + last_name
	if last_name.length == 10
		result[first_name] = last_name
	end
end

writer = HTMLWriter.new
writer.write result
