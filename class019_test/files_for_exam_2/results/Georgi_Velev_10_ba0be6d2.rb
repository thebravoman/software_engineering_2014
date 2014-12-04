# Develop a program named FirstName_LastName_ClassNumber_ba0be6d2.rb
# You are given an argument for a folder with .rb files.
# In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
# Count how many times the word "software" occurs in each of the files.
# Sort the result by number of times found in ASC order.
# Produce a result in csv format named result.csv.

# file1,3
# file2,10
# ..
# fileN,N
# ^
# There shouldn't be a newline at the end of the result file.
require 'csv'

count_hash = Hash.new 

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	i = 0
	filename = raw_file.split("/").last
	count_hash[filename] = 0
	file = File.open("#{raw_file}")
	file_read = file.readlines
	file_read.each do |line|
		line.split(" ").each do |word|
			if word == "software"
				i += 1
				count_hash[filename] = i
			end
		end
	end
end

count_hash = count_hash.sort_by{|key,val| val}
CSV.open("result.csv","w") do |csv|
	count_hash.each do |key,value|
		csv << [key,value]
	end
end