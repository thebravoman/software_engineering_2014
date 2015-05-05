=begin 
Develop a program named FirstName_LastName_ClassNumber_56a835.rb

1. you are given two arguments for a folders with files;
1.1 if there are other arguments they should be discarded;
2. Find all the files from both folders that are not in the format FirsrName_LastName_digit.rb. If there are duplicates the file must be written only once. If two files are of the same lenght those files should be sorted in ASC order;
3. Calculate the length of their names (including extensions).;
4. Sort the result by length ;
5. Produce a result in CSV format named result.csv:

			File1,3
			File2,4
			...
			FileN,3
			
=end

require 'csv'

arr = Array.new
	Dir.glob(ARGV[0]+"/*.rb") do |first_files|				
		Dir.glob(ARGV[1]+"/*.rb") do |second_files|
			first_files = first_files.split("/").last.split(".").first.split("_")
			if first_files.size != 3
				if first_files != second_files
						print_count = first_files.split("/").last.split(".").first	
						p = print_count.size.to_s
						print = first_files[0].capitalize+"_"+first_files[1].capitalize+"_"+first_files[2]+","+p
						arr.push(print)
				end
			end		
		end
	end	
	
	CSV.open("result.csv","w") do |csv|
		arr.sort.each do |element|
			csv << [element]
		end
	end
