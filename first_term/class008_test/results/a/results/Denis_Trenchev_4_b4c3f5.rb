=begin
Develop a program named FirstName_LastName_ClassNumber_b4c3f5.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. file names in this folders are in the form First_Last_digits.rb; 
3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
4. Sort the result by Last name ;
5. Produce a result in CSV format named result.csv:

	LastName1,FirstName1
	LastName2,FirstName2
	...
	LastNameN,FirstNameN

=end

require 'csv'

i = 0
arr1 = []
arr2 = []
arr3 = []

Dir.glob(ARGV[0]+"*.rb") do |first_folder|
	name = first_folder.split('/').last.split('.').first.split('_')
	
	if name.length == 3
		if name[1].to_s.length == 5
			arr1[i] = []
			arr[i][0] = name[0]
			arr[i][1] = name[1]
			i+=1
		end
	end
end	
i = 0

Dir.glob(ARGV[1]+"*.rb") do |second_folder|
	name = second_folder.split('/').last.split('.').first.split('_')
	
	if name.length == 3
		if name[1].to_s.length == 5
			arr1[i] = []
			arr[i][0] = name_1[0]
			arr[i][1] = name_1[1]
			i+=1
		end
	end
end
i = 0

arr1.each do |compare1|
	arr2.each do |compare2|
		if compare2 == compare1
			arr3[i] = compare1
			i+=1
		end
	end
end


sort = arr3.sort_by{|asd| asd[1]}
CSV.open("students.csv", "w") do |csv|
    sort.each do |element|
        csv << element
    end
end
