=begin
Develop a program named FirstName_LastName_ClassNumber_5341dcc6.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many of the words have 6 characters (numbers,special chars are part of the word) in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in json format named result.json.

"file1.rb":9,"file2.rb":11,......
^
There shouldn't be newline at the end of the result file. 
=end

dir = ARGV[0]
hash = Hash.new

Dir.glob("#{dir}/**/*.rb").each do |file|
	filename = file.split('/').last
	count = 0
	file_content = File.read(file)
	file_content.each_line do |line|
		line.split(' ').each do |word|
			count += 1 if word.length == 6
		end
	end
	hash[filename] = count
end

string_to_write = ""

hash.sort_by { |file, count| count }.each do |file, count|
	string_to_write += ("\"" + file + "\"" + ':' + count.to_s + ',')
end

File.open('result.json', 'w') do |result_file|
	result_file << string_to_write[0..-2]
end