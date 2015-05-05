=begin
Develop a program named FirstName_LastName_ClassNumber_eefff8cc.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many times the word "tues" occurs in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":N,"file2.rb":N ..
^
There shouldn't be a newline at the end of the result file.
=end 

require 'json'
result = Hash.new

path = ARGV.shift
Dir.glob(path + "/*.*").each do |file|
	words_count = 0
	File.open(file,"r").readlines.each do |line|
		line.split(" ").each do |word|
			if word == "tues"
				words_count += 1
			end 
		end 
	end 
	result[file.split("/").last] = words_count 
end

file = File.open("result.json","w")
file.puts result.to_json.tr("{","").tr("}","") 
file.close
