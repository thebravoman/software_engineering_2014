=begin
Develop a program named FirstName_LastName_ClassNumber_r279960a1.rb
You are given an argument for a folder with files.
Count how many of the words have 5 letters.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1.rb,9
file2.rb,11
.....
=end
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
	if word.length == 5
	i += 1
	count_hash[filename] = i
	end
	end
	end
	end
	
	count_hash = count_hash.sort_by{|key,val| val}.reverse
	
	CSV.open("results.csv","w") do |csv|
	count_hash.each do |key,value|
	csv << [key,value]
	end
	end
