=begin
Develop a program named FirstName_LastName_ClassNumber_6c232c.rb

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

students1 = Array.new
uniq_students = Array.new

Dir.glob("#{ARGV[0]}/**/*.*")  do |file|
		name = file.split("/").last.split(".").first.split("_")
		if name[0].length == 5
			students1 << ["#{name[0]}", "#{name[1]}"]
		end
end
Dir.glob("#{ARGV[1]}/**/*.*")  do |file|
		name = file.split("/").last.split(".").first.split("_")
		n=0
		if name[0].length == 5
			first_name = name[0]
			students1.each do |first, last|
				if students1[n][0] == first_name
					uniq_students << ["#{first}", "#{last}"]
				end
				n=n+1
			end
		end
end
st = uniq_students.sort_by{|f, l| l}
CSV.open("result.csv", "w") do |csv|
	st.each do |last, first|
		csv << ["#{last}", "#{first}"]
	end
end	




