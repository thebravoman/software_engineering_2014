=begin
Develop a program named FirstName_LastName_ClassNumber_cd93ec.rb :D

1. you are given a folder with files
1.1 if there are other arguments they should be discarded
2. find all the files that have  and 1 "_"in their their name;
3. Produce a result in csv format named results.csv:
4. Use csv_writer.rb
5. expected results:
"Name1,
 Name2,
 ..."
=end


require_relative 'Veselina_Kolova_csv_writer.rb'

results = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*") do |f|
	all = f.split("")
	i = 0
	all.each do |c|
		if c == "_"
			i = i + 1
			p c
		end
	end
	if i == 0 then
		results[f] = f
	end
end


writer = CSVWriter.new
writer.write(results)

