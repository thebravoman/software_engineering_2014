#Develop a program named FirstName_LastName_ClassNumber_7b7fb6.rb
#
#1. you are given an argument for a folder with files;
#1.1 if there are other arguments they should be discarded
#2. some file names in this folder are in the form First_Last_digits.rb. But there are also other files; 
#3. find all the students that have 10 symbols in their second name;
#4. Sort the result by Last Name ASC.
#5. Produce a result in CSV format named result.csv:
#
#		FirstName1,LastName1
#		FirstName2,LastName2
#		...
#		FirstNameN,LastNameN

require 'csv'
outputResults = Array.new
i=0
Dir.glob(ARGV[0] + "/*") { |file|  
	file = file.split('/').last.split('.').first.split('_')
		if file[0]
			if file[1]
				if (file[2] and file[2].match(/^(\d)+$/))
					if file[1].length == 10
						outputResults[i] = Array.new
						outputResults[i][0] = file[0]
						outputResults[i][1] = file[1]
						i += 1
					end
				end
			end
		end
}
outputResults = outputResults.sort_by{ |element| element[1] }
CSV.open("result.csv", "w") do |csv|
	outputResults.each do |pusher|
		csv << pusher
	end
end
