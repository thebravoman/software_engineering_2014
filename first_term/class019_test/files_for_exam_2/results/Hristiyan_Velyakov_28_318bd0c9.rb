#Develop a program named FirstName_LastName_ClassNumber_318bd0c9.rb;
#
#1. You are given an argument for folder with files in format FirstName_LastName_Digit.rb:
#1.1 if there are other arguments they should be discarded;
#2. Find all the students that have 7 letters in FirstName and 7 letters in LastName;
#3. Sort the result ASC;
#4. Produce CSV named "results.csv":
#
#Example:
#	FirstName1,LastName1
#	FirstName2,LastName2
#			...
#	FirstNameN,LastNameN
require 'csv'
outputResults = Array.new
i=0
Dir.glob(ARGV[0] + "/*") { |file|  
	file = file.split('/').last.split('.').first.split('_')
		if file[0]
			if file[1]
				if (file[2] and file[2].match(/^(\d)+$/))
					if file[0].length == 7 and file[1].length == 7  
						outputResults[i] = Array.new
						outputResults[i][0] = file[0]
						outputResults[i][1] = file[1]
						i += 1
					end
				end
			end
		end
}
outputResults = outputResults.sort_by{ |element| element[0] }
CSV.open("results.csv", "w") do |csv|
	outputResults.each do |pusher|
		csv << pusher
	end
end
