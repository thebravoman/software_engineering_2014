#Develop a program named FirstName_LastName_ClassNumber_627d43.r#
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last #Name. Digits might be different;
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:
#
#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN



require 'csv'
name_array = Array.new()
name_array2 = Array.new()
support_array = Array.new()
support_array2 = Array.new()
i = 0
dir1 = ARGV[0]
dir2= ARGV[1]

Dir.glob("#{dir1}/*.*") do |file|
	name_array[i] = file.split(/\//).last
	i += 1
end
count = i
i = 0
Dir.glob("#{dir2}/*.*") do |file2|
	name_array2[i] = file2.split(/\//).last
	i += 1
end
i = 0
for check in i..count
	if name_array[check] != name_array2[check]
			support_array[i] = name_array[check]
			support_array2[i] = name_array2[check]
			i += 1
			puts support_array
			puts support_array2
			CSV.open("result.csv", "w") do |csv|
				support_array.each do |element|
					csv << [element]
				end
			end
			CSV.open("result.csv", "w") do |csv|
				support_array2.each do |element2|
						csv << [element2]
				end	
			end
	end
end

 

