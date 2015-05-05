=begin
Develop a program named FirstName_LastName_ClassNumber_02e338.rb
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

students = Array.new
Dir.glob("#{ARGV[0]}/**/*_*_*.*") do |my_text_file|
	s = my_text_file.split('/').last.split('_')
	first_name = s[0]
	last_name = s[1]
	if last_name != nil && last_name.length == 10
		students << ["#{first_name}", "#{last_name}"]
	end
end
st = students.sort_by{|f, l| l}




File.open("result.html", "w") do |row|
			row << "<!DOCTYPE html>\n" << "<html>\n" << "\t<body>\n"
				row << "\t\t<table style='width:100%;'>\n"
				
				st.each do |last, first|
					row << ["#{last}", "#{first}"]
					row << "<h1>" << "#{last}" << "</h1>" << "<h1>" << "#{first}" << "</h1>"
					
				end
		end
				

