=begin
Develop a program named FirstName_LastName_ClassNumber_ade0bd72.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 5 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1.rb,9
file2.rb,11
.....
fileN.rb,N
^
There shouldn't be newline at the end of the result file.
=end

require 'csv'
files = Hash.new
Dir.glob("#{ARGV[0]}*.rb").each do |directory| 
		word_count = 0
		program_name = directory.split("/").last
		file = File.open(directory).read
		file.gsub!(/\r\n?/, "\n")

		file.each_line do |line|
  			words = line.split(" ")
  			
  			words.each do |word|
  				if word.length == 5
  					word_count +=1 
  				end
  			end
		end
		files[program_name] = word_count
	end
CSV.open("result.csv", "w") do |csv|
	files.sort_by{|k, v| v}.each do |key, value| 
		csv << [key,value]					
	end
end