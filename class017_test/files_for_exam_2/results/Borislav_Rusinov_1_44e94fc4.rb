=begin
Develop a program named FirstName_LastName_ClassNumber_44e94fc4.rb

You are given an argument for a folder with .rb files.
Find all the files from the folder which have more than 30 lines.
Sort the result by number of lines ASC
Produce a result in CSV format named result.csv. 

file1,3
file2,10
..
fileN,N

=end
require 'csv'
file_hash = Hash.new

Dir.glob("#{ARGV[0]}/*.rb").each do |raw_file|
filename = raw_file.split("/").last
file = File.open("#{raw_file}")
file_read = file.readlines
	if file_read.length > 30
		file_hash[filename] = file_read.length.to_s
	end
end

file_hash = file_hash.sort_by{|key,val| val}
File.open("result.csv","w") do |csv|
	file_hash.each do |key,value|
	csv.puts("#{key},#{value}")
	end
end
