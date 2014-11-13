require 'csv'

folders = ["vhodno_nivo","class002_homework", "class003_homework","class004","class009_homework","class012_homework"]
countFolders = folders.length
student = Hash.new{|hash, key| hash[key] = Array.new(countFolders,0)}

def isNotNil(variable)
	if variable != nil
		return true;
	end
end

def nameChecker(name)
	if name.to_s.count(" ") == 1 
		return true
	end

end

(0...countFolders).each do |currentFolder| #go through all the folders
	Dir.glob(ARGV[0]+"/#{folders[currentFolder]}/*_*_*.*").each do |directory|#find files
		studentName = directory.split("/").last.reverse.split("_",3).last.reverse.gsub("_", " ")#get the student name
		case currentFolder
			when 0 then gitLog = `git log --until=17.09.2014:20:00:00 #{directory}`#homeworks comitted to that date
			when 1 then gitLog = `git log --until=22.09.2014:20:00:00 #{directory}`#homeworks comitted to that date
			when 2 then gitLog = `git log --until=24.09.2014:20:00:00 #{directory}`#homeworks comitted to that date
			when 3 then gitLog = `git log --until=29.09.2014:20:00:00 #{directory}`#homeworks comitted to that date
			when 4 then gotLog = `git log --until=
				`
			when 5 then gitLog = `git log --until=10.11.2014:20:00:00  #{directory}`#homeworks comitted to that date
		end
		fileExists = `git log #{directory}` 
		if !fileExists.empty?#check if file exists
			if nameChecker(studentName)
				student[studentName][currentFolder] = 1 
			end
		end
		if !gitLog.empty?#check if the homework is commited on time
			if nameChecker(studentName)
				student[studentName][currentFolder] = 2
			end
		end
		CSV.open("results.csv","w") do |csv|
			student.sort.each do |key, value|
				csv << ["#{key}", "#{value}"]
			end
		end
	end	
end