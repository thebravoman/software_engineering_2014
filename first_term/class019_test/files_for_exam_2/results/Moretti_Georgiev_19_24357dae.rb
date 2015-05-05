=begin
Develop a program named FirstName_LastName_ClassNumber_24357dae.rb
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

student = Hash.new
counter = 0;

Dir.glob("#{ARGV[0]}/**/*.rb*").each do |path|
fileName = path.split("/").last
file = File.open("#{path}")
readFile = file.readlines

	readFile.each do |line|
		line.split(" ").each do |word|
			if word == "software"
				counter += 1
				student[fileName] = counter 
			end
		end
	end
end

CSV.open("results.csv","w") do |csv|
	student.each do |key,value|
		csv << [key,value]
	end
end
