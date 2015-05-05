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

require_relative "Mladen_Karadimov_xml_writer.rb"
list = Array.new

Dir.glob(ARGV[0]+"/*_*_*.rb") do |name|
	name = name.split('/').last.split('_')
	#puts name
	first_name = name[0]
	last_name = name[1]
	#puts last_name
	if last_name.length == 5
		list.push(first_name+' '+last_name)
	end
end
list.sort
puts list

writer = XMLWriter.new
writer.write(list)
