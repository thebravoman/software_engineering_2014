=begin
Develop a program named FirstName_LastName_ClassNumber_63fea8.rb

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

arr1 = Array.new
arr2 = Array.new
arr3 = Array.new


Dir.glob(ARGV[0]+"/*.rb") do |my_text_file|
        my_text_file = my_text_file.split('/').last

       
        tester = my_text_file.split('.').first.split('_')
        name = tester[0]
        last_name = tester[1]
        task = tester[2].to_i
       
        if !name ||  !last_name ||  task == 0 
                next
        else
        		arr1 << ["#{last_name}","#{name}"]
        end
        
end

Dir.glob(ARGV[1]+"/*.rb") do |my_text_file|
        my_text_file = my_text_file.split('/').last

       
        tester = my_text_file.split('.').first.split('_')
        name = tester[0]
        last_name = tester[1]
        task = tester[2].to_i
       
        if !name ||  !last_name ||  task == 0 
                next
        else
        		arr2 << ["#{last_name}","#{name}"]
        end
        
end

	arr3 = arr2 - arr1

	arr3 = arr3.sort_by {|el| el[1]}  

CSV.open("result.csv", "w") do |csv|
	arr3.each do |element|
		csv << element
	end
end
