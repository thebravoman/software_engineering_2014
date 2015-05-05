=begin Develop a program named FirstName_LastName_ClassNumber_5182303e.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many times the word "tues" occurs in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":N,"file2.rb":N ..
^
There shouldn't be a newline at the end of the result file.
=end
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb").each do |my_file|
	name = my_file.split("/").last
	f = File.open(my_file, "r")
		f.each_line { |line|
 		words = line.split
  		words.each do |w|
		if w == "tues" then
	   		if h.has_key?(w) then
	     			h[w] = h[w] + 1
	    		else
	      			h[w] = 1
	    		end
		end
end

