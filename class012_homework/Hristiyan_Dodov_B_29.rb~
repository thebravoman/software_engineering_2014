def fileOnDate(deadLine, filePath)
	var = `git log --until=#{deadLine} #{filePath}`
	if var != nil; return 1; end
	return 0
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

teams009 = Hash.new # get each student's team
csvTeams = File.read(ARGV[0] + "class009_homework/project_to_names.csv").split("\n")
csvTeams.each do |line|
	name = line.split(',')[1]
	if name != nil
		firstName = name.split(' ')[0]
		lastName = name.split(' ')[1]
		teams009[firstName + '_' + lastName] = line.split(',')[0]
	end
end

csvFile = File.open("results_Hristiyan_Dodov_B_29.csv", "w")
csvFile.puts ",,VH,002,003,004,009,012"

students = Array.new
count = -1
Dir.glob(ARGV[0] + "class002_homework/*.rb").each do |file|
	count += 1
	firstName = file.split('/').last.split('_')[0]
	lastName = file.split('/').last.split('_')[1]
	students[count] = firstName + '_' + lastName
end
students.sort!

Dir.chdir(ARGV[0]) # changes the work dir to the repo dir so we can use git log
for i in 0..count do 
	csvFile.print students[i].split('_')[0] + ',' + students[i].split('_')[1]
	
	# check vhodno_nivo
	csvFile.print(",")
	
	studentResult = checkStudentFiles("17.09.2014:20:00", "vhodno_nivo/**/" + students[i] + "*.*")
	if studentResult[1] >= 3; csvFile.print("2"); else
		if studentResult[1] > 0; csvFile.print("1"); else
			csvFile.print("0")
		end
	end
	
	# check class002_homework
	studentResult = checkStudentFiles("22.09.2014:20:00", "class002_homework/**/" + students[i] + "*.*")
	csvFile.print ","; csvFile.print studentResult[0]
	
	# check class003_homework
	studentResult = checkStudentFiles("24.09.2014:20:00", "class003_homework/**/" + students[i] + "*.*")
	csvFile.print ","; csvFile.print studentResult[0]
	
	# check class004_homework
	csvFile.print(",")
	
	studentResult = checkStudentFiles("29.09.2014:20:00", "class004/**/" + students[i] + "*.*")
	flag = studentResult[0]
	
	studentResultFixture = checkStudentFiles("29.09.2014:20:00", "class004_homework/" + students[i])
	flag2 = studentResultFixture[0]
	
	if flag == 2 && flag2 == 2; csvFile.print("2"); else
		if flag == 0 && flag2 == 0; csvFile.print("0"); else
			csvFile.print("1")
		end
	end
	
	# check class009_homework
	studentProject = teams009[students[i]]
	if studentProject != nil
		studentResult = checkStudentFiles("27.10.2014:20:00", "class009_homework/" + studentProject + ".pdf")
		csvFile.print ","; csvFile.print studentResult[0]
	else
		csvFile.print(",0")
	end
	
	# check class012_homework
	studentResult = checkStudentFiles("10.11.2014:20:00", "class012_homework/**/" + students[i] + "*.*")
	csvFile.print ","; csvFile.print studentResult[0]
	
	csvFile.puts # go to next line after writing everything about a student
end

$end
