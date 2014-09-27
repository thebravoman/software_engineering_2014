
class Script
	$submitedHomeworks = Array.new(21,0) #Global because i still can't find good ruby tutorial.
	def checkDirectory(pathToDirectory,extType)
		Dir.glob("#{pathToDirectory}/**/*.*") do |fileName|
		#  puts "Working on: #{fileName.split(/\//).last}" #Good for manual check on which files it worked and what mistakes it could've made.
		  executeAction(fileName,extType) #Call the action for the script.
		end
	end
	def executeAction(fileName,extType)
		number = fileName.split(/_/).last #gets the required place of the homework index.
		extension  = number.split(/\./).last #required for the extension check.
		if !extension.eql? extType.to_s and extType != "err2" then  extension = "~~~~~" end 
		if extension.length < 5 and !extension.include? '~' #checks if the file is not .class or some other compiled like non - source code file.
		number = number.split(/\./).first #takes the part before the .EXTENSION which should be a number.
			if number.length < 3   #Checks if the number is 2 digits long. Tasks can only be between 1-19 so only two digits. This also eliminates the 11B 11A and etc. The downside is that it wont check Task1 Task2 Problem1 .. etc
				number = number.to_i #Converts to integer.This strips it from other chars and unrequired symbols. The strip is not required because we already check if the string is length complaint.
				if number != 0 and number.between?(2,18) #Continue only if the number is between the possible tasks.Else we assume that it's not a homework file.
				#	puts "Added"
					$submitedHomeworks[number] = $submitedHomeworks[number].to_i + 1 #($submitedHomeworks[number].to_i + 1).to_s #Increases the number of task X solved.
					$submitedHomeworks[21] = $submitedHomeworks[21].to_i + 1 #($submitedHomeworks[21].to_i + 1).to_s             #Increases the total number of homeworks solved. This way we dont need to sum all the arr elements.
				end
			end
		end
	end
	def print()
	#	for task in 2..18 do
	#		puts "#{task},#{$submitedHomeworks[task].to_s}"
	#	end 
		shf = $submitedHomeworks
		puts "2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18"
		str = ("#{shf[2].to_s}")
		for task in 3..18 do
			str.concat(",#{$submitedHomeworks[task].to_s}")
		end 
		puts str
		#puts $submitedHomeworks #does the obvious and prints the array in a non - formated way.
	end
end

	homeWorkScript = Script.new() #Initialize
	pathToDirectory = ARGV.shift || "err1"
	if pathToDirectory.eql? "err1"
	#	puts "No directory specified. Executing in current directory ..."
		pathToDirectory = "./"
	end 
	extension = ARGV.shift || "err2"
	extension = extension.split(/\./).last
	if extension.eql? "err2"
	#	puts "No extension specified. Checking by default ..."
	end 
	homeWorkScript.checkDirectory("#{pathToDirectory}","#{extension}") #Checks current directory with default extension
	homeWorkScript.print
