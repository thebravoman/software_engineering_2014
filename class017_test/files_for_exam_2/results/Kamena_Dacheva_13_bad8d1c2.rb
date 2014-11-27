=begin
Develop a program named FirstName_LastName_ClassNumber_bad8d1c2.rb

You are given an argument for a folder with .rb files.
Find all the files from the folder which have less than 30 lines.
Sort the result by lenght DESC
Produce a result in CSV format named result.csv. 

file1,3
file2,10
..
fileN,N
=end

require 'csv'
programs = Hash.new

Dir.glob("#{ARGV[0]}/*.rb*").each do |directory|
	file_name = directory.split("/").last
	file = File.open("#{directory}")
	file_lines = file.readlines.length
	if file_lines < 30
		programs[file_name] = file_lines
	end
end

CSV.open("result.csv","w") do |csv|
	programs.sort_by{|k, v| v}.reverse.each do |name,length|
		csv << [name,length]
	end
end
