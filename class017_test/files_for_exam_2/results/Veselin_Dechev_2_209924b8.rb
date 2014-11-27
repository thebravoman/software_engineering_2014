=begin 
Develop a program named FirstName_LastName_ClassNumber_209924b8.rb
You are given an argument for a folder with files.
Count how many times the word "software" occurs in each of the files.
Produce a result in csv format named result.csv.
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
		if line.include?("software")
			i += 1
				count_hash[filename] = i
			
		end
	end
end

CSV.open("result.csv","w") do |csv|
	count_hash.sort_by{|key,val| val}.reverse.each do |key,value|
		csv << [key,value]
	end
end
