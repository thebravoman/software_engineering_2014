=begin
Develop a program named FirstName_LastName_ClassNumber_1a7b3031.rb

You are given an argument for a folder with .rb files.
Find all the files from the folder which have less than 30 lines.
Sort the result by number of lines ASC
Produce a result in CSV format named result.csv. 

file1,3
file2,10
..
fileN,N
=end

require 'csv'

files_to_write = Hash.new

directory = ARGV.shift || "err"
Dir.glob(directory+"/*.rb").each do |file|
	  file_length = File.open(file,"r").readlines.length
	  if file_length < 30 
	  		files_to_write[file.split("/").last.split(".").first] = file_length
	  end
end 

files_to_write = Hash[files_to_write.sort_by{|k,v| v}]

CSV.open("result.csv","w") do |csv|
	files_to_write.each do |hash|
		csv << hash
	end  
end
