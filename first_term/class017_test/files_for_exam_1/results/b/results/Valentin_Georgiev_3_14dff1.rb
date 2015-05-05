=begin
Develop a program named FirstName_LastName_ClassNumber_14dff1.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ASC;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN
=end


require 'csv'

student = Array.new
student1 = Array.new

Dir.glob("#{ARGV[0]}/**/*_*_*.rb").each do |folder1|
	file_name = folder1.split("/").last
	first_name = file_name.split("/").last.split("_").first
	last_name = file_name.split("/").last.split("_",2).last.split("_").first
	
	if first_name.length == 5 then
		student << ["#{first_name}", "#{last_name}"]
	end
end

Dir.glob("#{ARGV[1]}/**/*_*_*.rb").each do |folder2|
		file_name2 = folder2.split("/").last
		first_name2 = file_name2.split("/").last.split("_").first
		last_name2 = file_name2.split("/").last.split("_",2).last.split("_").first

		if first_name2.length == 5 then
			student1 << ["#{first_name2}", "#{last_name2}"]
		end
end


student.reject{ |x| student1.include?(x) }
student.delete_if{ |x| !student1.include?(x) }
student = student.sort_by{|f, l| l}


CSV.open("result.csv", "w") do |csv|
	student.each do |first, last|
		csv << [last, first]
	end
end
