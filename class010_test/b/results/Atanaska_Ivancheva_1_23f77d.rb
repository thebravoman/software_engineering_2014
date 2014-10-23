=begin
Develop a program named FirstName_LastName_ClassNumber_23f77d.rb

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

student=Array.new
student1=Array.new

Dir.glob(ARGV[0]+"/*.*").each do |folder1|
	file_name=folder1.split("/").last
	first_name=file_name.split("/").last.split("_").first
	last_name=file_name.split("/").last.split("_",2).last.split("_").first
	student << ["#{first_name} #{last_name}"]
	
end

Dir.glob(ARGV[1]+"/*.*").each do |folder2|
	file_name2=folder2.split("/").last
	first_name2=file_name2.split("/").last.split("_").first
	last_name2=file_name2.split("/").last.split("_",2).last.split("_").first
	student1 << ["#{first_name2} #{last_name2}"]
	
end

student.reject{|x| student.include?(x)}
student.delete_if{|x| student.include?(x)}

CSV.open("result.csv","w") do |csv|
	student.sort.each do |last,first|
		csv << ["#{last}", "#{first}"]
	end
end
