def check_arguments()
	ext = ["csv", "xml", "json", "html", "svg"]
	if !ARGV[0]
		abort("Add repo path.")
	end
	if !ARGV[1] or !ARGV[2]
		abort("Missing output file format.")
	end	
	if ARGV[1] != "-o"
		abort("Unknown command.")
	end	
	if !ext.include? ARGV[2]
		abort("Invalid file format.")
	end

	@file_format = "#{ARGV[1].to_s} #{ARGV[2].to_s}"

	if ARGV[3]
		if ARGV[3] == "-n"
			if ARGV[4].is_a? NilClass
				@n = -1
			else
				@n = ARGV[4].to_i
				abort() if @n == 0
			end
		else
			abort("Unknown command.")
		end
	end	
end

def rnl(string)
	string.delete "\n"
end

def initializeStudent()
	temp = Hash.new	
	@homeworks.each do |hw, hw1|
		temp[hw.to_s] = 0
	end	
	@flog.each do |g, g1|
		temp[g1.to_s] = 0
	end	
	@flay.each do |y, y1|
		temp[y1.to_s] = 0
	end	
	return temp
end

def is_on_time?(deadline, file)	
	log = `git log --until=#{deadline} -- #{file}`	
	if log.empty? 
		return 1
	else
		return 2
	end
end

def parseEntry(path, deadline)
	
	def entryScore(key, value)
		if value >=3
			if @results[key] == nil then @results[key] = initializeStudent() end
			@results[key]["VH"] += 1
		end
	end
	
	tmp = Hash.new
	tmpOnTime = Hash.new
	Dir.glob(ARGV[0] + "#{path}").each do |file|		
		name = file.split("/").last.split("_")		
		firstName = name[0].capitalize
		lastName = name[1].capitalize		
		name = firstName + ' ' + lastName
				
		if tmp[name] == nil
			tmp[name] = 0
			tmpOnTime[name] = 0
		end				
		if (is_on_time?(deadline, file) == 2)
			tmpOnTime[name] = tmpOnTime[name] + 1
		end
				
		tmp[name] += 1		
		print "Checking entry level...\r"	
	end
	
	counter = 0
	tmpOnTime.each do |key, value|
		counter += 1
		entryScore(key, value)
		break if counter == @n
	end
	
	counter = 0	
	tmp.each do |key, value|
		counter += 1
		entryScore(key, value)
		break if counter == @n
	end	
end

def parseDir(homework, loc, deadline, counter)
	Dir.glob(ARGV[0] + loc).each do |file|		
		full_name = file.split("/").last.split("_")
		name = file.split("/").last.split("_")
		firstName = name[0].to_s.capitalize
		lastName = name[1].to_s.capitalize		
		name = firstName + ' ' + lastName
		
		if @results[name] == nil 
			@results[name] = initializeStudent()
		end 
		
		@results[name][homework] = is_on_time?(deadline, file)		
		flog = `flog #{file} 2> /dev/null`		
		flog = flog.split(":").first		
		@results[name]["g#{homework}"] = flog.to_s		
		flay = `flay #{ARGV[0]}#{loc} 2> /dev/null| grep #{full_name[0].to_s} | wc -l`		
		@results[name]["y#{homework}"] = rnl(flay)
				
		counter += 1		
		break if counter == @n		
		print "Checking class#{homework} homework...\r"		
	end	
end

def parseTeams(counter)
	teams = Hash.new	
	csv_contents = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
	csv_contents.shift					
	csv_contents.each do |row|						
		if teams[row[0].to_s] != nil
			currentUserFiles = teams[row[0].to_s]
			currentUserFiles << row[1].to_s
			teams[row[0].to_s] = currentUserFiles
		else
			teams[row[0].to_s] = []
			teams[row[0].to_s] << row[1].to_s
		end
	end

	Dir.glob(ARGV[0] + "class009_homework/**/*.pdf").each do |file|
		team_name = file.split("/").last.split(".").first		
		creator_names = (teams.values_at(team_name)).flatten
		creator_names.each do |s|					
			if s == nil
				next
			end						
			if @results[s] == nil 
				@results[s] = initializeStudent() 
			end
			@results[s]["9"] = is_on_time?("Oct-29-2014-20:00:00", file)
		end
			
		counter += 1
		break if counter == @n
		print "Checking class9 homework...\r"							
	end
end
