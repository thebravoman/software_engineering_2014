#Develop a program named FirstName_LastName_ClassNumber_ee44b4.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
#4. Sort the result by File name DESC;
#5. Produce a result in CSV format named result.csv:
#
# File1.extension,3
# File2.extension,4
# ...
# FileN.extension,3
require 'csv'
hash = Hash.new
(0..1).each do |number|
Dir.glob(ARGV[number] + '/*.*') do |name|
digits = 0
name = name.split("/").last
(0...name.split(".").first.length).each do |i|
if name[i] =~ /\d/
digits += 1
end
end
if digits == 7
hash["#{ name },#{name.length/2}"] = nil
end	
end
end
CSV.open("result.csv", "w") do |csv|
hash.sort_by { |key, value| key }.reverse.each do |key, value|
csv << key.split(',')
end
end 
