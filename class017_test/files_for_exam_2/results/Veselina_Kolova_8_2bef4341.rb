=begin
Develop a program named FirstName_LastName_ClassNumber_2bef4341.rb
You are given an argument for a folder with files.
Count how many times the word "hardware" occurs in each of the files.
Produce a result in xml format named result.xml.

<results>
<file1.rb>3</file1.rb>
<file2.rb>6</file2.rb>
..
</results>
=end

results = Hash.new
count = 0

Dir.glob("#{ARGV[0]}/**/*.*") do |my_text_file|
	s = my_text_file.split('/').last
	
	if s.include?("hardware") then
		count = count + 1
	end	
	results[s] = count
end

File.open("result.xml", "w") do |r|
	r <<"<results>\n"
	results.sort.each do |k, v|
		r << "<#{k}>" << "<#{v}>" << "</#{k}>"
	end
	r << "</results>"
end
