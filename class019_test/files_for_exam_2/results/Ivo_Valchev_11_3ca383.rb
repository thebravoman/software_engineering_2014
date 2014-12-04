=begin
Develop a program named FirstName_LastName_ClassNumber_3ca383.rb :D

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

require_relative 'csv_writer'

files = Array.new

Dir.glob("#{ARGV[0]}*").each do |raw_file|
  filename = raw_file.split("/").last
  files << filename if filename.count("_") == 2
end

writer = CSVWriter.new
writer.write files