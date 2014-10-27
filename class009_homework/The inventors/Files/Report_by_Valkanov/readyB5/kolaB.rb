#Nikolay_Mihailov_25_f70059.rb
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
#4. Sort the result by File name ;
#5. Produce a result in CSV format named result.csv:

#			File1,3
#			File2,4
#			...
#			FileN,3
require 'csv'
hash = Hash.new
count = 0
Dir.glob(ARGV[0] + "/*.rb") do |file|
first = file.split(/\//).last
puts first
#for (i = 0;i < first.length;i+=1)
size = first.length
i = 0
c = first[i].chr
if first[i] == 0 || first[i] == 1 || first[i] == 2 || first[i] == 3 || first[i] == 4 || first[i] == 5 || first[i] == 6 || first[i] == 7 || first[i] == 8 || first[i] == 9
count +=1	
end
puts count	
end
Dir.glob(ARGV[1] +"/*.rb") do |secFile|	
sec = secFile.split(/\//).last
#puts sec
end	
CSV.open("result.csv", "w") do |csv|
hash.sort_by{|key,val| key}.each do |element|
csv << element
end
end
#many mistakes
#undefined method `each' for one file
#Doesn't calculate the length of their names (including extensions) divided by 2 rounded to the smalles number
#working code
=begin

require 'csv'
def is_numeric(o)
	true if Integer(o) rescue false
end
array = []
array_one = Array.new
count = 0
Dir.glob(ARGV[0] + "*").each do |file|
    ch_count = 0
    file_name = file.split('/').last.split('.').first
    b = file_name.count "1234567890"
    b.to_s
    file1_name = file.split('/').last
    if b == 7
	p = file1_name.size
	p = p/2
	p = p.to_s
	print = file_name + "," + p
	array.push(print)
    end
end
count = 0
Dir.glob(ARGV[1] + "*").each do |file|
    ch_count = 0
    file_name = file.split('/').last.split('.').first
    b = file_name.count "1234567890"
    b.to_s
    file1_name = file.split('/').last
    if b == 7
	p = file1_name.size
	p = p/2
	p = p.to_s
	print = file_name + "," + p
	array_one.push(print)
    end
end
temp1=array-array_one
temp2=array_one-array
array=temp1+temp2
array = array.sort_by {|el| el[0]}
CSV.open("result.csv","w") do |csv|
    array.sort.each do |element|
	csv << [element]
    end
end

=end
