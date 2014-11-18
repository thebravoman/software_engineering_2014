require 'csv'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'html_writer.rb'
#homework folders
folders = ["vhodno_nivo","class002_homework", "class003_homework","class004","class009_homework","class012_homework"]
#hash for every student and his/hers results
@student =Hash.new{|hash, key| hash[key] = {"VN" 	=> 0, 
											"002" 	=> 0, 
											"003" 	=> 0, 
											"004" 	=> 0, 
											"009"	=> 0, 
											"012" 	=> 0}
}
def nameCheck(name)
	if name.to_s.count(" ") == 1
		return true
	end

end
def getFullName(file)
	#get the first name of the student
	firstName 	= file.split("/").last.split("_").first
	#get the last name of the student
	lastName 	= file.split("/").last.split("_", 2).last.split("_").first
	#full name
	fullName 	= firstName + " " + lastName

	return fullName
end
def checkHomework009(hwNum)
		#read csv line by line
		CSV.foreach(ARGV[0] + 'class009_homework/project_to_names.csv') do |team|
			#get the student name
			studentName = team[1]
			if nameCheck(studentName)
				#set mark to the student
				@student[studentName][hwNum] = 2
			end
		end	
end
def countUnderscores(directory)
	underscoresNum = directory.split("/").last.count("_")
	return underscoresNum
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
			#check if it is a real student program
			if countUnderscores(directory) > 2 || hwNum == "VN"
				#check if file exists and it is commited even not in time
				if !fileExists.to_s.empty?
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
#go through all the homework folders
folders.each do |currentFolder|
	#go through all the homeworks
		Dir.glob(ARGV[0]+"#{currentFolder}/*_*_*.*").each do |fullDirectory|
			case currentFolder
				when "vhodno_nivo" then setResultsOfStudent(fullDirectory, "VN", "17.09.2014:20:00:00")
 				when "class002_homework" then setResultsOfStudent(fullDirectory, "002", "22.09.2014:20:00:00")
				when "class003_homework" then setResultsOfStudent(fullDirectory, "003", "24.09.2014:20:00:00")
				when "class004" then setResultsOfStudent(fullDirectory, "004", "29.09.2014:20:00:00")
				when "class009_homework" then setResultsOfStudent(fullDirectory, "009", "27.10.2014:20:00:00")
				when "class012_homework" then setResultsOfStudent(fullDirectory, "012", "10.11.2014:20:00:00") 
			end
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