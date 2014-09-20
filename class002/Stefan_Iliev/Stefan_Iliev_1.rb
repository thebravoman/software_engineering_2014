
class Script
	$submitedHomeworks = Array.new(21,0) #Global because i still can't find good ruby tutorial.
	def checkDirectory(pathToDirectory)
		Dir.glob("#{pathToDirectory}/*.*") do |fileName|
		  puts "Working on: #{fileName.split(/\//).last}" #Good for manual check on which files it worked and what mistakes it could've made.
		  executeAction(fileName) #Call the action for the script.
		end
	end
	def executeAction(fileName)
		number = fileName.split(/_/).last #gets the required place of the homework index.
		extension  = number.split(/\./).last #required for the extension check.
		if extension.length < 5 and !extension.include? '~' #checks if the file is not .class or some other compiled like non - source code file.
		number = number.split(/\./).first #takes the part before the .EXTENSION which should be a number.
			if number.length < 3   #Checks if the number is 2 digits long. Tasks can only be between 1-19 so only two digits. This also eliminates the 11B 11A and etc. The downside is that it wont check Task1 Task2 Problem1 .. etc
				number = number.to_i #Converts to integer.This strips it from other chars and unrequired symbols. The strip is not required because we already check if the string is length complaint.
				if number != 0 and number < 20 #Continue only if the number is between the possible tasks.Else we assume that it's not a homework file.
					$submitedHomeworks[number] = $submitedHomeworks[number].to_i + 1 #($submitedHomeworks[number].to_i + 1).to_s #Increases the number of task X solved.
					$submitedHomeworks[21] = $submitedHomeworks[21].to_i + 1 #($submitedHomeworks[21].to_i + 1).to_s             #Increases the total number of homeworks solved. This way we dont need to sum all the arr elements.
				end
			end
		end
	end
	def print()
		puts $submitedHomeworks #does the obvious and prints the array in a non - formated way.
	end
end

homeWorkScript = Script.new() #Initialize
homeWorkScript.checkDirectory("D:/GitHub/new/software_engineering_2014/vhodno_nivo/**") #check directory x. TODO: make it take argv and run it foreach arg 
homeWorkScript.print #print the results. 