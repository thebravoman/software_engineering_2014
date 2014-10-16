#Develop a program named FirstName_LastName_ClassNumber_f70059.rb

#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. Find all the files from both folders that have exactly 7 digits from 0 to 9 in their names excluding extension. If there are duplicates the file must be written only once.;
#3. Calculate the length of their names (including extensions) divided by 2 rounded to the smalles number;
#4. Sort the result by File name ;
#5. Produce a result in CSV format named result.csv:

#			File1,3
#			File2,4
#			...
#			FileN,3

require 'csv'
hash = Hash.new
count = 0
	Dir.glob(ARGV[0] + "/*.rb") do |file|
	
		first = file.split(/\//).last 
		puts first

		#for (i = 0;i < first.length;i+=1)
		size = first.length
		i = 0
		first.each do |element|
 		
			c = first[i].chr
			if element == 0 || element == 1 || element == 2 || element == 3 || element == 4 || element == 5 || element == 6 || element == 7 || element == 8 || element == 9 
			count +=1			

			end
		end
		puts count		
	end
	
	Dir.glob(ARGV[1] +"/*.rb") do |secFile|	
		sec = secFile.split(/\//).last
		#puts sec
		
	end	
	
	CSV.open("result.csv", "w") do |csv|
		hash.sort_by{|key,val| key}.each do |element|
		csv << element
		end
	end

