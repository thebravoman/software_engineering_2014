#Develop a program named FirstName_LastName_ClassNumber_a65be5.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students that are only in the first folder and not in the second. A student is in both folders if there is a file with the same First and Last Name. Digits might be different;
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:

#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN

i = 0
a = Array.new
h = Hash.new
Dir.glob("#{ARGV[0]}/*.rb") do |dir_file_name_1|
	file_name_1 = dir_file_name_1.split(/\//).last.to_s
	name_1 = file_name_1
	first_name_1 = name_1.split(/_/).first.to_s
	name_1 = name_1.split(/_/)
	last_name_1 = name_1[1]
	last_name_1 = last_name_1.split(/_/).first.to_s	
	res = 1
	Dir.glob("#{ARGV[1]}/*.rb") do |dir_file_name_2|
		file_name_2 = dir_file_name_2.split(/\//).last.to_s
		name_2 = file_name_2
		first_name_2 = name_2.split(/_/).first.to_s
		name_2 = name_2.split(/_/)
		last_name_2 = name_2[1]
		last_name_2 = last_name_2.split(/_/).first.to_s
		if(first_name_1 == first_name_2) and (last_name_1 == last_name_2)
			res = 0	
		end
		
	end
	if(res == 1)
		h[last_name_1] = first_name_1
	end
	i+=1	
end	

require 'csv'
CSV.open("result.csv", "w") do |csv|
	a = h.sort
	a.each do |element|
		csv << element
	end
end
