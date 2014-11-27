# Develop a program named FirstName_LastName_ClassNumber_46025b3d.rb

# You are given an argument for a folder with .rb files.
# Find all the files from the folder which have less than 30 lines.
# Sort the result by number of lines ASC
# Produce a result in CSV format named result.csv. 

# file1,3
# file2,10
# ..
# fileN,N

require 'csv'
result = Hash.new

Dir.glob(ARGV[0]+"*.rb*").each do |file_name|
	filename = file_name.split("/").last
	file = File.open("#{file_name}")
	length = file.readlines.length
	if length < 30
		result[filename] = length
	end
end

CSV.open("result.csv","w") do |csv|
	result.sort_by{|filename,length| length}.each do |filename,length|
		csv << [filename,length]
	end
end