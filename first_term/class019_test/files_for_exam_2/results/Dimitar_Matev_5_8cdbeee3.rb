=begin 
Develop a program named FirstName_LastName_ClassNumber_8cdbeee3.rb
You are given an argument for a folder with .rb files.
In each file there are words separated by space (ex. "word1 word2 word3")(there may be multiple lines)
Count how many times the word "software" occurs in each of the files.
Sort the result by number of times found in ASC order.
Produce a result in csv format named result.csv.

file1,3
file2,10
..
fileN,N
^
There shouldn't be a newline at the end of the result file.
=end

#def flog file
#	return flogResult = `flog #{file} -c -q -s`.split(":").first.to_i	
#end
#flogResult = flog(file)

#def is_number?
#  Float(self) != nil rescue false
#end
#first.is_number? // pishem go f if 

#(first_name == "") && (first_name == " ") && (secound_name == "") && (task_number.is_number? == false)
# task_number = "#{student.split("/").last.split("_")[2]}"

require 'csv'
load 'Dimitar_Matev_5_8cdbeee3_Writer.rb'
counter = 0
hash = Hash.new
tempHash = Hash.new
Dir.glob(ARGV[0]+"/*.rb*") do |file|
	
	file_name = file.split("/").last.split(".").first
	content = File.read(file)
	content = content.split(" ")
	content.each do |v|
		if v == 'software'
			counter += 1;
		end
	end
	hash[file_name]="#{counter},#{file_name}"
	counter = 0
end




tempHash = hash.sort_by {|k, v| v}.reverse

writer = CSVWriter.new
writer.write(tempHash)

File.open("result.csv", "w") do |f|
  tempHash.each do |key, value|
    f.puts "#{key},#{value.split(",").first}"
  end
end
