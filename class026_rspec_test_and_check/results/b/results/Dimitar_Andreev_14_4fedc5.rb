=begin
Develop a program named FirstName_LastName_ClassNumber_4fedc5.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 5 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

require "csv"

arr1=Hash.new

Dir.glob("#{ARGV[0]}"+"*.*").each do |files|
    first_name=files.split("/").last.split(".").first.split("_").first
    last_name=files.split("/").last.split(".").first.split("_")[1]
        if last_name.length==5 then
            arr1[first_name]=last_name 
        end
end

arr1=arr1.sort_by{|key, val| val}

CSV.open("result.csv","a") do |csv|
	arr1.each do |key, value|
		csv<<[key, value]	
	end	
end
