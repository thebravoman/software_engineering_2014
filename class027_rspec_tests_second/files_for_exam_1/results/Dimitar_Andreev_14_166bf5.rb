=begin
Develop a program named FirstName_LastName_ClassNumber_166bf5.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name DESC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end
 
require "csv"
 
hash=Hash.new
hash1=Hash.new
hash2=Hash.new 
Dir.glob("#{ARGV[0]}/*.rb") do |file|
    first_name=file.split("/").last.split("_").first
    last_name=file.split("/").last.split("_")[1]  
    hash[last_name]=first_name
end

Dir.glob("#{ARGV[1]}/*.rb") do |file|
    first_name=file.split("/").last.split("_").first
    last_name=file.split("/").last.split("_")[1] 
    hash1[last_name]=first_name
end

CSV.open("result.csv", "a") do |csv|
    hash.each do |key, value|
        hash1.each do |key2, value2|
            if key!=key2 && value!=value2
                hash2[key]=value
            end
        end
    end
	hash2.sort_by {|key, value| key}.reverse.each do|key, value|
		csv<<[key, value]
	end
end
