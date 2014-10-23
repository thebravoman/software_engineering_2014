=begin
Develop a program named FirstName_LastName_ClassNumber_b1df85.rb

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

arr = []
arr1 = []
i = 0
Dir.glob(ARGV[0] + "*.rb") do |file|
	name = file.split('/').last.split('.').first.split('_')
	fname = name[0]
	lname = name[1]
	exercise = name[2]
	
	if fname == '' || lname == '' || exercise == ''
	elsif name.length == 3
	if fname.length == 5
		arr[i] = []
		arr[i][0] = name[0]
		arr[i][i] = name[1]
		i=i+1
	end
	end
end		

Dir.glob(ARGV[1] + "*.rb") do |my_file|
	name1 = my_file.split('/').last.split('.').first.split('_')
	fname1 = name1[0]
	lname1 = name1[1]
	exercise1 = name1[2]
	
	if fname1 == '' || lname1 == '' || exercise1 == ''
	elsif name1.length == 3
	if fname1.length == 5
		arr[i] = []
		arr[i][0] = name1[0]
		arr[i][i] = name1[1]
		i=i+1
	end
	end
end	



if fname[0].to_s == fname1[0].to_s && fname[1].to_s == fname1[1].to_s
		arr1[i] = []
		arr[i][0] = fname
		arr[i][i] = fname
		i=i+1
end

arr = arr.sort_by{|el| el[0]}
CSV.open("result.csv", "w") do |csv|
	arr.each do |element|
		csv << element
	end
end				
	

