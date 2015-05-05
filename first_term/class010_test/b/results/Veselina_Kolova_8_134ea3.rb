=begin
Develop a program named FirstName_LastName_ClassNumber_134ea3.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that have only letters from a-z or A-Z in their names excluding extension. If there are duplicates the file must be written only once.;
3. Calculate the length of their names (including extensions) divided by 2.;
4. Sort the result by length DESC;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end

require 'csv'
names = Array.new


Dir.glob("#{ARGV[0]}/**/*.*").each do |file|
	filel = file.split(/\//).last
	file = filel.split(/\./).first
	l = file.size
	file = file.lines
	
	
	for i in 0..l
		c = file[i]
		if c.match(/\w/)
			names <<  ["#{filel}", "#{filel.lenght/2}"]
		end
	end
end

Dir.glob("#{ARGV[1]}/**/*.*").each do |file2|
	filel2 = file2.split(/\//).last
	file2 = filel2.split(/\./).first
	l = file2.size
	file2 = file2.lines	
	
	for i in 0..l
		c = file2[i]
		if c.match(/\w/)
			names <<  ["#{filel2}", "#{filel.lenght/2}"]
		end
	end
end

names = names.sort_by{|f, l| l}.reverse

CSV.open("result.csv", "w") do |csv|
	names.each do |file, ln|
		csv << ["#{file}, #{ln}"]
	end
end
