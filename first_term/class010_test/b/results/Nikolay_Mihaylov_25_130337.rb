#Develop a program named FirstName_LastName_ClassNumber_130337.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb; 
#3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:
#
#	LastName1,FirstName1
#	LastName2,FirstName2
#	...
#	LastNameN,FirstNameN

require 'csv'
hash = Hash.new
		#"/home/nikolas/Documents/Niki/claswork/test1/"
	Dir.glob(ARGV[0] + "/*.rb") do |file|
	
		first = file.split(/\//).last
		first = first.split(".").first 
		first_name = first.split(/_/)

		Dir.glob(ARGV[1] +"/*.rb") do |secFile|
			sec = secFile.split(/\//).last
			sec = sec.split(".").first			
			sec_name = sec.split(/_/)

			if first_name[0] == sec_name[0] && first_name[1] == sec_name[1]
				if sec_name[0].length == 5 				
					hash[sec_name[1]] = sec_name[0]
				end 
			end	
		end	
	end
	
	CSV.open("result.csv", "w") do |csv|
		hash.sort_by{|key,val| key}.each do |element|
		csv << element
		end
	end
