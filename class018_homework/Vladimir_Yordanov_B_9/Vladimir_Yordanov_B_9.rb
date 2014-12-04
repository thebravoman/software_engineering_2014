require "yaml"
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'
require_relative 'html_writer.rb'
require_relative 'json_writer.rb'

def checkStudentFiles(student, hwNum, deadLine, filePath, flogBool, hIndex, flogIndex)
	flag = 0; fileCount = 0; flogFile = "none"
	
	Dir.glob(filePath+"*.*").each do |file|
		flag = `git log --until=#{deadLine} #{file}`
		if flag.empty?; flag = 1; else flag = 2; fileCount += 1; end

		flogFile = file
	end
	
	if hwNum == "VH"
		if fileCount >= 3; flag = 2
			else if fileCount > 0; flag = 1; end
		end
	end
	
	$students.each do |k,v|
		if k == student && flogFile != "none"
			v[hIndex] = flag
			if flogBool == 1
				v[$flogSI + flogIndex] = `flog #{flogFile}`.to_i
				v[$flaySI + flogIndex] = `flay #{flogFile} | grep #{student} | wc -l`.to_i
			end
		end
	end
	
end

startTime = Time.new
programsCheckCount = 0
$students = Hash.new(Array.new)

yamlData = YAML.load_file('config.yml')
$flogSI = yamlData.length;
$flaySI = $flogSI # SI = Start Index
yamlData.each do |k,v|
	$flaySI += v[2]
end

header = Array.new
headerCounter = 0
flogCounter = 0
yamlData.each do |k,v|
	header[headerCounter] = k
	if v[2] == 1
		header[flogCounter+$flogSI] = "g"+k
		header[flogCounter+$flaySI] = "y"+k
		flogCounter += 1
	end
	headerCounter += 1
end

writer = CSVWriter.new # default writer
programsCheckCount = 0
for i in 0..ARGV.length do
	if ARGV[i] == "-o"
		case ARGV[i+1]
			when "csv"; writer = CSVWriter.new
			when "xml"; writer = XMLWriter.new
			when "svg"; writer = SVGWriter.new
			when "html"; writer = HTMLWriter.new
			when "json"; writer = JSONWriter.new
		else
			abort("Enter a valid extension.")
		end
	end
	
	if ARGV[i] == "-n"
		if ARGV[i+1].to_i.to_s == ARGV[i+1] && ARGV[i+1] != nil
			programsCheckCount = ARGV[i+1].to_i
		else
			abort("Enter a valid extension.")
		end
	end
end

teams009 = Hash.new

numberOfStudents = 0
csvTeams = File.read(ARGV[0] + "class009_homework/project_to_names.csv").split("\n")
csvTeams.each do |line|
	break if numberOfStudents == programsCheckCount && programsCheckCount != 0
	
	name = line.split(',')[1]
	if name != nil && name != "Student Name"
		numberOfStudents += 1
		writeName = name.split(' ')[0] + '_' + name.split(' ')[1]
		teams009[writeName] = line.split(',')[0]
		$students[writeName] = Array(header.length)
		for i in 0..header.length-1 # -1 for loop bug
			$students[writeName][i] = 0
		end
	end
end

$students = $students.sort

scriptDir = Dir.pwd
Dir.chdir(ARGV[0]) # changes the work dir to the repo dir so we can use git log

$students.each do |k,v|
	hwNumber = 0; flogIndex = 0;
	yamlData.each do |k1,v1|
		if k1 != "009"; path = v1[1]+k
		else; path = v1[1]+teams009[k]
		end

		checkStudentFiles(k, k1, v1[0], path, v1[2], hwNumber, flogIndex)
		
		hwNumber += 1
		if v1[2] == 1; flogIndex += 1; end
	end
end

endTime = Time.new
timeTaken = (endTime-startTime).floor

Dir.chdir(scriptDir)
writer.write($students, header, timeTaken)

$end
