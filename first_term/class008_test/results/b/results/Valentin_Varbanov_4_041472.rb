=begin

Develop a program named FirstName_LastName_ClassNumber_041472.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN


=end

students_first_dir = Array.new
students_second_dir = Array.new

for i in 0..1

	directory = ARGV[i]
	if ARGV[i].split(//).last(1).to_s == "/"
		directory += "**/*.rb"
	else
		directory += "/**/*.rb"
	end

	Dir.glob(directory).each do |dir|
		student = dir.split(/\//)
		if i == 0 
			students_first_dir.push(student)
		else
			students_second_dir.push(student)
		end
	end
end

studentcsv = Array.new

students_first_dir.each do |std|
	match = 0
	students_second_dir.each do |std2|
		name = std.last.split(/_/)

		name2 = std2.last.split(/_/)
		for i in 0..1
			if name[i] == name2[i]
				match = 1
			end
		end
	
	end
	studentcsv.push(name[1], name[2])
end

CSV.open("result.csv", "w") do |csv|
	studentcsv.each do |string|
		csv << string
	end
end
