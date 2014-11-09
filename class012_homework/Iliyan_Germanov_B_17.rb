require 'csv'
repoPath = ARGV[0]
results = Hash.new
projectToNames = Hash.new
homeworks = ["VH", "002", "003", "004", "009", "012"]
folders = ["vhodno_nivo/**/*_*_*.*",  "class002_homework/**/*_*_*_*.rb", "class003_homework/**/*_*_*_*.rb", 
		"class004/**/*_*_*_*.rb", "class004_homework/*_*", "class009_homework/**/*.pdf", 
		"class012_homework/**/*_*_*_*.rb"] 

def getName(filename)
	filename = filename.split("/").last.split("_")
	firstName = filename.first
	lastName = filename[1]
	return firstName.capitalize + '_' + lastName.capitalize
end

def convertTeamNames(repoPath)
	teamNames = Hash.new
	content = File.read("#{repoPath}/class009_homework/project_to_names.csv").split("\n")
	content.each do |line|
		teamName = line.split(",").first
		if teamName != nil
			teamNames[teamName] = Array.new if not teamNames.has_key? teamName
			studentName = line.split(",")[1] 
			studentName = studentName.split(" ").first + "_" + studentName.split(" ")[1] if studentName != nil
			teamNames[teamName] << studentName
		end
	end
	return teamNames
end

def onTime(path, deadline)
	log = `git log #{deadline} #{path}` 
	if log.empty? 
		return 0
	else
		return 1
	end
end

def initResult(results, student, homework)
	if not results.has_key? student
		results[student] = Hash.new 
		results[student][homework] = 0
	end
	return results
end


def check(results, path, student, deadline, homework)
	if onTime(path, deadline) == 1
		results[student][homework] = 2
	else
		results[student][homework] = 1 
	end	
	return results
end

def checkLog(results, path, homework, projectToNames = nil, homeworks)
	if homework != "009"
		student = getName(path) 
		homeworks.each do |h|
			results = initResult(results, student, h)
		end
	end
	case homework
	when "VH"
		if onTime(path, "--until=17.09.2014:20:00") == 1
			results[student]["VH"] += 1
		else
			results[student]["VH"] += 101
		end
	when "002"
		results = check(results, path, student, "--until=22.09.2014:20:00", "002")
	when "003"
		results = check(results, path, student, "--until=24.09.2014:20:00", "003")
	when "004"
		results = check(results, path, student, "--until=29.09.2014:20:00", "004")
	when "009"
		teamName = path.split("/").last.split(".").first
		projectToNames[teamName].each do |member|
			results = initResult(results, member, "009")
			results = check(results, path, member, "--until=27.10.2014:20:00", "009")
		end if projectToNames[teamName] != nil
	when "012"
		results = check(results, path, student, "--until=10.11.2014:20:00", "012")
	else
		puts "An error has occured!"
	end
	return results
end

def convertResult(results, homeworks)
	results.keys.each do |key|
		homeworks.each do |h|
			results[key][h] = 0 if results[key][h] == nil
		end
		if results[key]["VH"] % 100 >= 3
			if results[key]["VH"] > 100
				results[key]["VH"] = 1
			else
				results[key]["VH"] = 2
			end
		else
			results[key]["VH"] = 0
		end
	end
	return results
end

projectToNames = convertTeamNames(repoPath)

folders.each do |folder|
Dir.glob("#{repoPath}/#{folder}") do |path|
	case folder
	when "vhodno_nivo/**/*_*_*.*"
		results = checkLog(results, path, "VH", homeworks)
	when "class002_homework/**/*_*_*_*.rb"
		results = checkLog(results, path, "002", homeworks)
	when "class003_homework/**/*_*_*_*.rb"
		results = checkLog(results, path, "003", homeworks)
	when "class004/**/*_*_*_*.rb"
		results = checkLog(results, path, "004", homeworks)
	when "class004_homework/*_*" 
		results = checkLog(results, path, "004", homeworks)
	when "class009_homework/**/*.pdf" 
		results = checkLog(results, path, "009", projectToNames, homeworks)
	when "class012_homework/**/*_*_*_*.rb"
		results = checkLog(results, path, "012", homeworks)
	else
		puts "An error has occured!"
	end
end
end

results = convertResult(results, homeworks)

CSV.open("results_Iliyan_Germanov_B_17.csv", "w") do |csv|
	csv << ["", "", homeworks].flatten
	results.keys.sort.each do |key|
		csv << [key.split("_").first, key.split("_")[1], results[key]["VH"],
		results[key]["002"], results[key]["003"], results[key]["004"], results[key]["009"], results[key]["012"]].flatten 
	end
end
