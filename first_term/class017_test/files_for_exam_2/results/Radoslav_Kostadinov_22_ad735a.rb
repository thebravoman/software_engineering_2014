=begin
Develop a program named FirstName_LastName_ClassNumber_ad735a.rb

1. you are give homework014(class014_homework) folder
1.1 it should be passed as argument(ARGV[0] for example);
1.2 if there are other arguments they should be discarded;
2. file names in this folder are in the form First_Last_class_digits.rb; 
2.2 if there are other files they should be discarded
3. find  all the programs that have flay between 1 and 10;
4. Sort the result by First name ASC;
5. Produce a result in xml format named results.xml;
6. Use xml_writer.rb
6.1 xml_writer ->
"require 'builder'
class XMLWriter
	def write (student)
		file = File.new("results.xml", "w")
		xml = Builder::XmlMarkup.new(:indent => 2)
		file << xml.allStudents {
			student.sort.each do |key, value|
				xml.student {
					xml.secondName student[key][value]
				}	
			end
		}
		file.close
	end
end"
7. Expected results:
<allStudents>
	<student>lastName1</student>
	<student>lastName2</student>
</allStudents>
=end

require_relative 'Radoslav_Kostadinov_22_ad735a_writer.rb'
student = Hash.new
Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	flayResult = `flay #{directory} | grep #{directory} | wc -l`.split("\n").first.to_i
	if flayResult > 1 && flayResult < 10
		firstName 	= directory.split("/").last.split("_").first.capitalize
		lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
		student[firstName] = lastName
	end
end
writer = XMLWriter.new()
writer.write(student)