=begin
Develop a program named FirstName_LastName_ClassNumber_2e532f.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their second name;
4. Sort the result by Last Name ASC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end
 require 'csv'
 
 student = Hash.new
 
 Dir.glob("#{ARGV[0]}*_*_*.rb") do |file|
   firstName = file.split("/").last.split("_").first
   lastName = file.split("/").last.split("_", 2).last.split("_").first
   digit = file.split("/").last.split("_").last.split(".").first
 if lastName.length == 10
   student[firstName]= lastName
 end
 end
 CSV.open("result.csv", "w") do |csv_file|
   student.sort.each do |key, value|
   csv_file << ["#{key}, #{value}"]
    end
 end
