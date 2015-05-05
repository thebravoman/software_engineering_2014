#Develop a program named #FirstName_LastName_ClassNumber_ae024f.rb
#
#1. you are given two arguments for a folders with files;
#1.1 if there are other arguments they should be discarded;
#2. file names in this folders are in the form First_Last_digits.rb;
#3. find  the students with 5 letters in the first name that are in both folders$
#4. Sort the result by Last name ;
#5. Produce a result in CSV format named result.csv:
#
#        LastName1,FirstName1
#        LastName2,FirstName2
#        ...
#        LastNameN,FirstNameN

require 'csv'
outputResults = Array.new
outputResults2 = Array.new
realOutputResults = Array.new
i=0
Dir.glob(ARGV[0] + "/*") { |file|  
	file = file.split('/').last.split('.').first.split('_')
	if file[0]
		if file[1]
			if (file[2] and file[2].match(/^(\d)+$/))
				if file[0].length == 5
					outputResults[i] = Array.new
					outputResults[i][0] = file[0]
					outputResults[i][1] = file[1]
					i += 1
				end
			end
		end
	end
}
i=0
Dir.glob(ARGV[1] + "/*") { |my_file|  
	my_file = my_file.split('/').last.split('.').first.split('_')
	if my_file[0]
		if my_file[1]
			if (my_file[2] and my_file[2].match(/^(\d)+$/))
				if my_file[0]
					if my_file[0].length == 5
						outputResults2[i] = Array.new
						outputResults2[i][0] = my_file[0]
						outputResults2[i][1] = my_file[1]
						i += 1
					end
				end
			end
		end
	end
}

realOutputResults = outputResults & outputResults2

realOutputResults = realOutputResults.sort_by{ |element| element[0] }
CSV.open("result.csv", "w") do |csv|
	realOutputResults.uniq.each do |pusher|
		csv << pusher
	end
end