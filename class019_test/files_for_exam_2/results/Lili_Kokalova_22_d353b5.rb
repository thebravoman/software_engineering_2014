=begin
Develop a program named FirstName_LastName_ClassNumber_d353b5.rb

1. you have a folder with files
1.1 if there are other arguments they should be discarded;
2. find all the files with 11 digits in them;
3. Produce a result in xml format named results.xml;
4. Use xml_writer.rb
5. Expected results:
<numbers>
	<number>Name1</number>
	<number>Name2</number>
</numbers>
=end
require "Lili_Kokalova_22_d353b5_xmlwriter.rb"
names = Array.new

Dir.glob("#{ARGV[0]}/*.*").each do |file|
	i = 0
	s = file.split("/").last.split(".rb")
	name = s.to_s.split("")
	name.each do |s|
		if s >= "0" && s <= "9"
			i += 1 	
		end
	end
	if i == 11
		names << ["#{name.to_a}"]
	end
end

writer = XMLwriter.new
writer.write(names)
