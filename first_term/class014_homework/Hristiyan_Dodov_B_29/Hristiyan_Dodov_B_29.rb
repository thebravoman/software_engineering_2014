require "csv_writer.rb"
require "xml_writer.rb"
require "svg_writer.rb"
require "html_writer.rb"
require "json_writer.rb"

def fileOnDate(deadLine, filePath)
	var = `git log --until=#{deadLine} #{filePath}`
	if var.empty?; return 0; end
	return 1
end

def checkStudentFiles(deadLine, filePath)
	flag = 0
	fileNum = 0 # how many files were given on time
	
	Dir.glob(filePath).each do |file|
		fileStatus = fileOnDate(deadLine, file)
		if fileStatus == 1; flag = 2; fileNum += 1;
			else if fileStatus == 0; flag = 1
				else flag = 0
			end
		end
	end
	
	return flag, fileNum
end

teams009 = Hash.new
csvTeams = File.read(ARGV[0] + "class009_homework/project_to_names.csv").split("\n")
csvTeams.each do |line|
	name = line.split(',')[1]
	if name != nil
		firstName = name.split(' ')[0]
		lastName = name.split(' ')[1]
		teams009[firstName + '_' + lastName] = line.split(',')[0]
	end
end

students = Hash.new(Array.new)

count = -1
Dir.glob(ARGV[0] + "class002_homework/*.rb").each do |file|
	count += 1
	firstName = file.split('/').last.split('_')[0]
	lastName = file.split('/').last.split('_')[1]
	students[firstName + '_' + lastName] = [0,0,0,0,0,0]
end

students = students.sort

scriptDir = Dir.pwd
Dir.chdir(ARGV[0]) # changes the work dir to the repo dir so we can use git log
students.each do |k,v| 
	# check vhodno_nivo
	studentResult = checkStudentFiles("17.09.2014:20:00", "vhodno_nivo/**/" + k + "*.*")
	if studentResult[1] >= 3; v[0] = 2; else
		if studentResult[1] > 0; v[0] = 1; else
			v[0] = 0
		end
	end
	
	# check class002_homework
	studentResult = checkStudentFiles("22.09.2014:20:00", "class002_homework/**/" + k + "*.*")
	v[1] = studentResult[0]
	
	# check class003_homework
	studentResult = checkStudentFiles("24.09.2014:20:00", "class003_homework/**/" + k + "*.*")
	v[2] = studentResult[0]
	
	# check class004_homework
	studentResult = checkStudentFiles("29.09.2014:20:00", "class004/**/" + k + "*.*")
	flag = studentResult[0]
	
	studentResultFixture = checkStudentFiles("29.09.2014:20:00", "class004_homework/" + k)
	flag2 = studentResultFixture[0]
	
	if flag == 2 && flag2 == 2; v[3] = 2; else
		if flag == 0 && flag2 == 0; v[3] = 0; else
			v[3] = 1
		end
	end
	
	# check class009_homework
	studentProject = teams009[k]
	if studentProject != nil
		studentResult = checkStudentFiles("27.10.2014:20:00", "class009_homework/" + studentProject + ".pdf")
		v[4] = studentResult[0]
	else
		v[4] = 0
	end
	
	# check class012_homework
	studentResult = checkStudentFiles("10.11.2014:20:00", "class012_homework/**/" + k + "*.*")
	v[5] = studentResult[0]
	
end

for i in 0..ARGV.length do
	if ARGV[i] == "-o"
		case ARGV[i+1]
			when "csv"; writer = CSVWriter.new
			when "xml"; writer = XMLWriter.new
			when "svg"; writer = SVGWriter.new
			when "html"; writer = HTMLWriter.new
			when "json"; writer = JSONWriter.new
		else
			puts "Enter a valid extension."
		end
	end
end

Dir.chdir(scriptDir)
writer.write(students)

$end
