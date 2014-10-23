=begin
Develop a program named FirstName_LastName_ClassNumber_0a79e4.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
3. find all the students that have 10 symbols in their first name;
4. Sort the result by Last Name DESC.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end

require 'csv'
#Ok!!!----------------------
hash = Hash.new

Dir.glob("#{ARGV[0]}/*.*") do |student_task|
	student_prog = student_task.split('/')[-1]
	prog_name = student_prog.split('.')[0] # first
	first_name = prog_name.split('_')[0]
	last_name = prog_name.split('_')[1]
	#digit = prog_name.split('_')[2]
	#prog_extension = student_prog.split('.')[1] # second
	
	if first_name.length == 10 then	
		hash[prog_name] = last_name + "," + first_name 
	end
end
#puts hash
hash = Hash[hash.sort_by{|k, v| v}.reverse]
	
	CSV.open("result.csv", "w") do |csv|
	
	hash.each do |key, value|
		last = value.split(",")[0]
		first = value.split(",")[1]
		
		
		csv << [first,"#{last}"]
	end

end
