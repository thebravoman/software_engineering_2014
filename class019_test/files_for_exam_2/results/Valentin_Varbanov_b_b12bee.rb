=begin
Develop a program named FirstName_LastName_ClassNumber_b12bee.rb :D

1. you are given a folder with files
1.1 if there are other arguments they should be discarded
2. find all the files that have  and 2 "_"in their their name;
3. Produce a result in csv format named results.csv:
4. Use csv_writer.rb
5. expected results:
"Name1,
 Name2,
 ..."
=end
results = Array.new
Dir.glob(ARGV[0] + "**/*").each do |file|
	name = file.split('/').last
	if name.split('_').length == 3
		results.push(name)
	end
end


require_relative 'Valentin_Varbanov_writer.rb'
writer = CSVWriter.new

writer.write(results)
