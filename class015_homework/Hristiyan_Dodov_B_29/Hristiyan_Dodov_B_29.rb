require "csv_writer.rb"
require "xml_writer.rb"
require "svg_writer.rb"
require "html_writer.rb"
require "json_writer.rb"

startTime = Time.new
$students = Hash.new(Array.new)
$flogSI = 6; $flaySI = 11 # SI = Start Index

def checkStudentFiles(deadLine, filePath, student, boolWriteResult, hIndex, flogIndex, flayIndex)
	flag = 0; fileNum = 0
	
	Dir.glob(filePath).each do |file|
		fileStatus = `git log --until=#{deadLine} #{file}`
		if fileStatus.empty?; fileStatus = 0; else fileStatus = 1; end
		
		if fileStatus == 1; flag = 2; fileNum += 1
		else flag = 1
		end

		next if boolWriteResult < 1
		$students.each do |k,v|
			if k == student
				v[hIndex] = flag
				if boolWriteResult == 2
					v[flogIndex] = `flog #{file}`.to_i
					v[flayIndex] = `flay #{file} | grep #{student} | wc -l`.to_i
				end
			end
		end
	end
	
	return flag, fileNum
end

header = Array.new
header = ["", "", "VH",
	"002", "003", "004", "009", "012", "014",
	"g002", "g003", "g004", "g012", "g014",
	"y002", "y003", "y004", "y012", "y014"]

writer = CSVWriter.new # default writer
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
end

teams009 = Hash.new

csvTeams = File.read(ARGV[0] + "class009_homework/project_to_names.csv").split("\n")
csvTeams.each do |line|
	name = line.split(',')[1]
	if name != nil
		writeName = name.split(' ')[0] + '_' + name.split(' ')[1]
		teams009[writeName] = line.split(',')[0]
		$students[writeName] = Array(header.length-2)	# -2 for the first two empty header elements
		for i in 0..header.length-3 					# -3 for /\ and loop bug
			$students[writeName][i] = 0
		end
	end
end

$students = $students.sort

scriptDir = Dir.pwd
Dir.chdir(ARGV[0]) # changes the work dir to the repo dir so we can use git log

$students.each do |k,v|
	studentResult = checkStudentFiles("17.09.2014:20:00", "vhodno_nivo/**/" + k + "*.*", k, 0, 0,0+$flogSI,0+$flaySI)
	if studentResult[1] >= 3; v[0] = 2; else
		if studentResult[1] > 0; v[0] = 1; else
			v[0] = 0
		end
	end
	checkStudentFiles("22.09.2014:20:00", "class002_homework/**/"+k+"*.*", k, 2, 1,1+$flogSI,1+$flaySI)
	checkStudentFiles("24.09.2014:20:00", "class003_homework/**/"+k+"*.*", k, 2, 2,2+$flogSI,2+$flaySI)
	checkStudentFiles("29.09.2014:20:00", "class004/**/"+k+"*.*", k, 2, 3,3+$flogSI,3+$flaySI)
	if teams009[k] != nil
	checkStudentFiles("27.10.2014:20:00", "class009_homework/"+teams009[k]+".pdf", k, 1, 4,4+$flogSI,4+$flaySI)
	end
	checkStudentFiles("10.11.2014:20:00", "class012_homework/**/"+k+"*.*", k, 2, 5,4+$flogSI,4+$flaySI)
	checkStudentFiles("13.11.2014:06:00", "class014_homework/**/"+k+"*.*", k, 2, 6,5+$flogSI,5+$flaySI)
end

endTime = Time.new
timeTaken = (endTime-startTime).floor
header[0] = "Time: #{timeTaken/60}m #{timeTaken%60}s"

Dir.chdir(scriptDir)
writer.write($students, header, timeTaken)

$end
