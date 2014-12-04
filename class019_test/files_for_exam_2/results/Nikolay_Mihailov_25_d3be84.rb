#Develop a program named FirstName_LastName_ClassNumber_d3be84.rb
#
#1. you have a folder with files
#1.1 if there are other arguments they should be discarded;
#2. find all the files with 11 digits in them;
#3. Produce a result in xml format named results.xml;
#4. Use xml_writer.rb
#5. Expected results:
#<numbers>
#	<number>Name1</number>
#	<number>Name2</number>
#</numbers>

require_relative  "Nikolay_Mihailov_xml_writer.rb"
results = Hash.new
Dir.glob(ARGV[0] + "*.*") do |file|
	short_file = file.split(/\//).last	
	results[short_file] = short_file.length
end

writer = XMLWriter.new
writer.write(results)
