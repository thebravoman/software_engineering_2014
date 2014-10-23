# Develop a program named FirstName_LastName_ClassNumber_a0a5b5.rb

# 1. you are given two arguments for a folders with files;
# 1.1 if there are other arguments they should be discarded;
# 2. file names in this folders are in the form First_Last_digits.rb; 
# 3. find  the students that are only in the first folder and not in the second. A student is in both folders if it there is a file with the same First and Last Name. Digits might be different;
# 4. Sort the result by Last name ;
# 5. Produce a result in CSV format named result.csv:

# 	LastName1,FirstName1
# 	LastName2,FirstName2
# 	...
# 	LastNameN,FirstNameN

require 'csv'

output = Array.new
output2 = Array.new
realOutput = Array.new
i = 0
Dir.glob(ARGV[0] + "/*") do |file|
	file = file.split('/').last.split('.').first.split('_')
	# puts file
	if file[0]
		if file[1]
			if file[2]
				if file[2].match(/^(\d)+$/)
					output[i] = Array.new
					output[i][0] = file[1]
					output[i][1] = file[0]
					i+=1
				end
			end
		end
	end
end
i=0
Dir.glob(ARGV[1] + "/*") do |file2|
	file2 = file2.split('/').last.split('.').first.split('_')
	if file2[0]
		if file2[1]
			if file2[2]
				if file2[2].match(/^(\d)+$/)
					output2[i] = Array.new
					output2[i][0] = file2[1]
					output2[i][1] = file2[0]
					i+=1
				end
			end
		end
	end
end

realOutput = output - output2
realOutput = realOutput.sort_by{ |element| element[0]}

CSV.open("result.csv", "w") do |csv|
	realOutput.each do |pusher|
		csv << pusher
	end
end