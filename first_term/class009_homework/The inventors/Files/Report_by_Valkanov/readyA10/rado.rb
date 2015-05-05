#Radoslav_Kostadinov_22_772118.rb
=begin
Develop a program named FirstName_LastName_ClassNumber_772118.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the second folder and not in the first. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by First name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN

=end

require 'csv'
file1 = Hash.new
file2 = Hash.new
path1 = ARGV[0]
path2 = ARGV[1]
Dir.glob("#{path1}*.rb") do |my_text_file|
    s = my_text_file.split(/\//).last.capitalize
    first_name = my_text_file.split("/").last.split("_").first
    last_name = my_text_file.split("/").last.split("_",2).last.split("_").first
    if s.count('_') == 2 and !((first_name == "" || first_name == " ") || (last_name == "" || last_name == " "))
	file1[first_name] = last_name
    end
end
Dir.glob("#{path2}*.rb") do |my_text_file|
    s = my_text_file.split(/\//).last.capitalize
    first_name = my_text_file.split("/").last.split("_").first
    last_name = my_text_file.split("/").last.split("_",2).last.split("_").first
    if s.count('_') == 2 and !((first_name == "" || first_name == " ") || (last_name == "" || last_name == " "))
	file2[first_name] = last_name
    end
end
file2.delete_if{|x| file1.include?(x)}
CSV.open("result.csv", "w") do |csv|
    file2.sort.each do |push|
	csv << push
    end
end

=begin

# the program outputs the correct results multiple times
*fixed*
file2.delete_if{|x| file1.include?(x)}
CSV.open("result.csv", "w") do |csv|
file2.sort.each do |push|
csv << push
end
end
=end