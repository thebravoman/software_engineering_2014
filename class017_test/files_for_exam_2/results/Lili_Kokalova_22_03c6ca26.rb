=begin
Develop a program named FirstName_LastName_ClassNumber_03c6ca26.rb

You are given an argument for a folder with .rb files.
Find all the files from the folder which have less than 30 lines.
Sort the result by number of lines DESC
Produce a result in CSV format named result.csv. 

file1,3
file2,10
..
fileN,N
=end


require 'csv'
file_array = Array.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	filename = raw_file.split("/").last
	file = File.open("#{raw_file}")
	file_read = file.readlines
	if file_read.length < 30
		file_array << ["#{filename}","#{file_read.length.to_s}"] 
	end
end

file_array = file_array.sort_by{|key,val| val}

CSV.open("result.csv","w") do |csv|
	file_array.each do |key,value|
		csv << [key,value]
	end
end

