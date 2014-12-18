require 'yaml'
require 'csv'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'html_writer.rb'
measureTime = Time.now
#loading configuration file with homework folders and deadlines for the homeworks
config 	= YAML.load_file('config.yml')
#hash for every student and his/hers results
@student =Hash.new{|hash, key| hash[key] = {
											"VN" 	=> 0, 
											"002" 	=> 0, 
											"003" 	=> 0, 
											"004" 	=> 0, 
											"009"	=> 0, 
											"012" 	=> 0,
											"014"	=> 0,
											"017(1)"	=> 0,
											"017(2)"	=> 0,
											"g2" 	=> "-",
											"g3" 	=> "-",
											"g4" 	=> "-",
											"g9" 	=> "no",
											"g12" 	=> "-",
											"g14"	=> "-",
											"g17(1)"	=> "-",
											"g17(2)"	=> "-",
											"y2" 	=> "-",
											"y3" 	=> "-",
											"y4" 	=> "-",
											"y9" 	=> "no",
											"y12" 	=> "-",
											"y14"	=> "-",
											"y17(1)"	=> "-",
											"y17(2)"	=> "-"}
}
#check if the name is correct, if it has interval between the names
def nameCheck(name)
	if name.to_s.count(" ") == 1
		return true
	end

end
def getFullName(file)
	#get the first name of the student
	firstName 	= file.split("/").last.split("_").first.capitalize
	#get the last name of the student
	lastName 	= file.split("/").last.split("_", 2).last.split("_").first.capitalize
	#full name
	fullName 	= firstName + " " + lastName

	return fullName
end
def checkHomework009(hwNum)
		#read csv line by line
		CSV.foreach(ARGV[0] + 'class009_homework/project_to_names.csv') do |team|
			#get the student name
			studentName = team[1]
			#check if the name is correct
			if nameCheck(studentName)
				#set mark to the student
				@student[studentName][hwNum] = 2
			end
		end	
end
def removeZerosInTheBegining(hwNum)
		return	hwNum.gsub("0", "")
end
def countUnderscores(directory)
	return directory.split("/").last.count("_")
end
def setFlog(directory, hwNum, studentName)
	if hwNum != "VN"
		#get the flog result and remove white spaces
		flogResult = `flog #{directory}`.split(":").first.to_s.gsub!(/\s+/, "")
		hwNum = removeZerosInTheBegining(hwNum)
		@student[studentName]["g#{hwNum}"] = flogResult
	end
end
def setFlay(directory, hwNum, studentName)
	if hwNum != "VN"
		#get the flay result and remove the unnecessery info and remove the new line
		flayResult = `flay #{directory} | grep #{directory} | wc -l`.split("\n").first
		hwNum = removeZerosInTheBegining(hwNum)
		@student[studentName]["y#{hwNum}"] = flayResult
	end
end
def setResultsOfStudent(directory, hwNum, deadline)
	 	#get the name of the student
		studentName = getFullName(directory)
		#result from git log
		gitLog = `git log --until=#{deadline} #{directory}`
		#check if file exists
		fileExists = `git log #{directory}`		
		#check if the name is correct
		if nameCheck(studentName)

			#check if it is a real student program.
			if countUnderscores(directory) > 2 || hwNum == "VN"
				#check if file exists and it is commited even not in time
				if !fileExists.to_s.empty?
						setFlog(directory, hwNum, studentName)
						setFlay(directory, hwNum, studentName)
						@student[studentName][hwNum] = 1 
				end
				 #check if the homework is commited in time
				if !gitLog.to_s.empty?
						@student[studentName][hwNum] = 2
				end
				#check if homework is 009
			end
			if hwNum == "009"	
						checkHomework009(hwNum)
				end	
		end
end
config["deadlines"].each do |hwNum, deadline|
	#get the current folder
	currentFolder =  config["folders"][hwNum]
	Dir.glob(ARGV[0] + "#{currentFolder}*_*_*").each do |path|
		setResultsOfStudent(path, hwNum, deadline)
	end
end
if ARGV[1] == "-o"
	resultType = ARGV[2]
		case resultType
			when "csv" then writer = CsvWriter.new()
			when "json" then writer = JSONWriter.new()
			when "xml" then writer = XMLWriter.new()
			when "html" then writer = HTMLWriter.new()
		end
		writer.write(@student)
end
p Time.now - measureTime
