=begin
Develop a program named FirstName_LastName_ClassNumber_33b82143.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 6 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":9,"file2.rb":11,......
^
There shouldn't be newline at the end of the result file.
=end

require 'json'

results = Hash.new
Dir.glob(ARGV[0] + "*.rb").each do |file|

	i = 0

	name = file.split("/").last
	
	file = File.open("#{file}")
	
	file_read = file.readlines
	
	file_read.each do |line|
	
		line.split(" ").each do |word|
	
			if word.length == 6
	
				i += 1
				
			end
	
		end
	
	end
	
	results[name] = i.to_i

end

results = results.sort_by {|key, value| value}
@asd = 0
results.each do |key, val|
	@asd += 1
end
 
#~ results.each do |key, value|
#~ 
	#~ puts "#{key}, #{value}"
#~ 
#~ end
@counter = 0
File.open("result.json", "w") do |f|
	
	results.each do |key, value|
		f.write("\"#{key}\":#{value}")
		@counter += 1
		if @counter <= @asd-1
			f.write(",")
		end
	end
	
end
