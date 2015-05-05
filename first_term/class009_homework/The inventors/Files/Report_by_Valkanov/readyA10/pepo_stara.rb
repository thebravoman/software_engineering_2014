#Petko_Bozhinov_21_954dc6.rb
# Develop a program named FirstName_LastName_ClassNumber_954dc6.rb

# 1. you are given two arguments for a folders with files;
# 1.1 if there are other arguments they should be discarded;
# 2. file names in this folders are in the form First_Last_digits.rb; 
# 3. find  the students with 5 letters in the first name that are in both folders. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
# 4. Sort the result by Last name ;
# 5. Produce a result in CSV format named result.csv:

# 	LastName1,FirstName1
# 	LastName2,FirstName2
# 	...
# 	LastNameN,FirstNameN

require 'csv'

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

output = Array.new
i = 0
Dir.glob(ARGV[0] + "/*") do |file|
	file = file.split('/').last.split('.').first.split('_')
	Dir.glob(ARGV[1] + "/*") do |file2|
		file2 = file2.split('/').last.split('.').first.split('_')
		if "#{file[0]} #{file[1]}" == "#{file2[0]} #{file2[1]}"
			if file[2].numeric?
				if file[0].to_s.length == 5
					output[i] = Array.new
					output[i][0] = file[0]
					output[i][1] = file[1]
					i+=1
				end
			end
		end
	end	
end

output = output.sort_by{ |element| element[1]}
CSV.open("result.csv", "w") do |csv|
	output.each do |pusher|
		csv << pusher
	end
end 
