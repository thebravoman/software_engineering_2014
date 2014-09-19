
class Script
	$submitedHomeworks = Array.new(21,0)
	def checkDirectory(pathToDirectory)
		Dir.glob("#{pathToDirectory}/*.*") do |fileName|
		  puts "Working on: #{fileName.split(/\//).last}"
		  executeAction(fileName)
		end
	end
	def executeAction(fileName)
		number = fileName.split(/_/).last.to_i
		if number != 0
			$submitedHomeworks[number] = $submitedHomeworks[number].to_i + 1 #($submitedHomeworks[number].to_i + 1).to_s
			$submitedHomeworks[21] = $submitedHomeworks[21].to_i + 1 #($submitedHomeworks[21].to_i + 1).to_s
		end
	end
	def print()
		puts $submitedHomeworks
	end
end

homeWorkScript = Script.new()
homeWorkScript.checkDirectory("C:/Users/John Smith/Documents")
homeWorkScript.print