=begin
Develop a program named FirstName_LastName_ClassNumber_b128c3.rb
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


require 'csv'
require_relative "html_writer.rb"
names = Array.new
	
CSV.foreach("#{ARGV[0]}/task.csv") do |word|
	
	check = true
	word = word.to_s
	word = word.split("\"")[1]
	word.split("").each do |char|
	
	if char.to_i != 0
		check = false
	end
end
	
	if check == true
		names.push(word)
	end
end
	names = names.sort_by { |name| name.length }
	puts names
	
	writer = HTMLwriter.new
	writer.write names
