=begin
Develop a program named FirstName_LastName_ClassNumber_840cf8.rb

1. you have a folder with files
1.1 if there are other arguments they should be discarded;
2. find all the files with 10 digits in them;
3. Produce a result in xml format named results.xml;
4. Use xml_writer.rb
5. Expected results:
<numbers>
	<number>Name1</number>
	<number>Name2</number>
</numbers>
=end

File.open("results.xml","w") do |f|

	a = "<numbers><number>234sd678887012</number></numbers>"

	f.write(a)

	f.close
end

