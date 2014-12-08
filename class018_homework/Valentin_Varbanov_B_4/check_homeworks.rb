require_relative "other_functions.rb"
def checkEntryLevel(path, deadline)
	def incrementEntryLevelScore(key, value)
		if value >=3
			if $results[key] == nil then $results[key] = initStudent() end
			$results[key]["vhodno_nivo"] += 1
		end
	end
	
	tmp = Hash.new
	tmpOnTime = Hash.new
	times = 0
	Dir.glob(REPO + path).each do |file|
		if $timeSaver then times +=1 end
		if times >= 10 then	break end
		name = file.split(/\//).last.split(/_/)
		firstName = name[0].capitalize
		lastName = name[1].capitalize
		name = firstName + ' ' + lastName
		if tmp[name] == nil
			tmp[name] = 0
			tmpOnTime[name] = 0
		end
		if (isOnTime(file, deadline) == 2)
			tmpOnTime[name] = tmpOnTime[name] + 1
		end
		tmp[name] += 1
	end
	tmpOnTime.each do |key, value|
		incrementEntryLevelScore(key, value)
	end
	tmp.each do |key, value|
		incrementEntryLevelScore(key, value)
	end
end

def checkClass009(path, deadline)
	names = parseNames(REPO + "class009_homework/project_to_names.csv")
	times = 0
	names.each do |name, team|
		file = REPO + path + team + ".pdf"
		file2 = REPO + path + team + '/' + team + ".pdf"
		if File.exist?(file) || File.exist?(file2)
			if $results[name] == nil 
					$results[name] = initStudent()
			end
			$results[name]["009"] += isOnTime(file, deadline)
		end
		if $timeSaver then times +=1 end
		if times >= 2 then break end
	end	
end

def checkHomework(homework, path, deadline, flayResults)
	case homework
		when "vhodno_nivo"
			checkEntryLevel(path, deadline)
		when "009"
			checkClass009(path, deadline)
		else
			times = 0
			Dir.glob(REPO + path).each do |file|
				name = file.split(/\//).last.split(/_/)
				firstName = name[0].capitalize
				lastName = name[1].capitalize
				tmp = name[0] + '_' + name[1]
				name = firstName + ' ' + lastName
				if $results[name] == nil 
					$results[name] = initStudent()
				end
				if $results[name][homework] < 2 then
					$results[name][homework] += isOnTime(file, deadline)
				end
				$results[name][FLOG[homework]] = calculateFlog(file, homework)
				$results[name][FLAY[homework]] = calculateFlay(flayResults, tmp)
				if $timeSaver then times +=1 end
				if times >= 2 then	break end
			end	
	end
	puts "Homework #{homework} checked."
end
