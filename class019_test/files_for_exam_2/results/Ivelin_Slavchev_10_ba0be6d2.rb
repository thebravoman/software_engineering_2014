=begin
Develop a program named FirstName_LastName_ClassNumber_ba0be6d2.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many times the word "software" occurs in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1,3
file2,10
..
fileN,N
^
There shouldn't be a newline at the end of the result file.
=end

require 'csv'

result = Hash.new

Dir.glob(ARGV[0] + "*.rb") do |file|
	count = 0
	file_short = file.split("/").last
	File.open(file).each do |line|
		word = line.split(" ")
		for i in 0..word.size
			if word[i] == "software"
				count += 1
			end
		end
	end	
	result[file_short] = count
end

CSV.open("result.csv", "w") do |csv|
	result.sort_by{|k, v| v}.each do |key, value|			
		csv << [key, value]			
	end
end
