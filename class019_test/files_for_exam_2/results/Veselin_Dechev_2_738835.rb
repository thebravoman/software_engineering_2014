=begin
Develop a program named FirstName_LastName_ClassNumber_738835.rb

1 You are given a folder with files.The Folder is passed as first argument;
2 Find all csv files wich number of lines is greater then 1. 
3 Sort the result by filename in ASC order.
4 Produce a result in csv format named result.csv:

=end

require 'csv'
file_hash = Hash.new
Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
filename = raw_file.split("/").last
file = File.open("#{raw_file}")
file_read = file.readlines
if file_read.length > 1
file_hash[filename] = file_read.length.to_s
end
end
file_hash = file_hash.sort_by{|key,val| val}
CSV.open("result.csv","w") do |csv|
file_hash.each do |key,value|
csv << [key,value]
end
end
