=begin
Develop a program named FirstName_LastName_ClassNumber_d8aa65.rb

1. you are given two arguments for a folders with files;
1.1 If there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digits.rb. If there are duplicates the file must be written only once.
2.1 If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by lenth ;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
=end
require 'csv'

arr1=Array.new
arr2=Array.new
arr3=Array.new
a = ARGV[0]
b = ARGV[1]
i=0
Dir.glob(a + "/*.rb") do |my_text_file1|
	short= my_text_file1.split('/').last
	length1 = short.length
	shorter= short.split('.').first.split('_')
	first_name=shorter[0]
	last_name=shorter[1]
	digits=shorter[2].to_i
	
	
	if !first_name || !last_name || digits=0 
		next
	else 
		arr1 << ["#{short}" "#{length1}"]
	end
end
Dir.glob(b + "/*.rb") do |my_text_file2|

	short2= my_text_file2.split('/').last
	length2 = short2.length
	shorter2= short.split('.').first.split('_')
	first_name2=shorter2[0]
	last_name2=shorter2[1]
	digits2=shorter2[2].to_i


	if !first_name2 || !last_name2 || digits2=0   
		next
	else 
		arr2 << ["#{short2}","#{length2}"]
	end
end

	arr3 = arr1 & arr2



	arr3 = arr3.sort_by  {|el|
		 el[1]
	}
	
	
	
      CSV.open("result.csv", "w") do |csv|
 
arr3.each do |element|
csv << element
end
 
end
