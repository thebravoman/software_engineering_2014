=begin
Develop a program named FirstName_LastName_ClassNumber_4dd932.rb

1. You are given an argument for a folder with files that contains names;
1.2 If there are other arguments they should be discarded;
1.2 take the names in this file that are in the format First_Last_digits.rb;
2. Find all the students that have 5 letters in their second name;;
3. Sort the result by First name ASC;
4.Produce a result in XML format named result.xml:
Example:
<result>
	<student_name>["Firstname","Lastname"]</student_name>
</result>
=end

require 'csv'
a = Array.new
h = Hash.new


Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name|

	file_name = dir_file_name.split(/\//).last.to_s
	first_name = file_name.split(/_/).first.to_s
	last_name = file_name.split(/_/)[1].to_s
	if (last_name.length == 5)
		h[first_name.to_s] = last_name.to_s
	end	
end

file = File.new("result_Martin_Grigorov_B_23.xml", "w")
file.write("<result>")
a = h.sort_by{|k, v| v}
a.each do |element|

file.write("\n\t\t<student_name>#{element}</student_name>")

end
file.write("\n</result>")
file.close
