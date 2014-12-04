require 'csv'
require 'yaml'
require_relative 'csvWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'htmlWriter.rb'
require_relative 'svgWriter.rb' #WIP# needed to sleep

start_time = Time.now

#----------------------------------- INITIALIZING --------------------------------------------#
@results = Hash.new
deadliness = Array.new
i = 0

homeworks = Hash.new
deadlines = Hash.new
flog = Hash.new
flay = Hash.new

config = Hash.new
config = YAML.load_file("config.yml")

@homeworks = config["homeworks"]
@deadlines = config["deadlines"]
@flog = config["flog"]
@flay = config["flay"]

@deadlines.each do |k, v|
	next if k.to_s == "VH" or k.to_s == "9"
	deadliness[i] = v.to_s
	i+= 1
end

@n = 0

file_format = "#{ARGV[1].to_s} #{ARGV[2].to_s}"

if ARGV[3] == "-n"

	if ARGV[4].is_a? NilClass
		@n = -1
	else
		@n = ARGV[4].to_i
		abort() if @n == 0
	end
end

#---------------------------------------- REMOVE NEW LINES METHOD ---------------------------------------------#
def rnl(string)
	string.delete "\n"
end

#---------------------------------------- INITIALIZING HASH FOR STUDENT HOMEWORKS --------------------------------#
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

#-------------------------------------- CHECK IF IT'S ON TIME METHOD ----------------------------------------------#
def is_on_time?(deadline, file)
	
	log = `git log --until=#{deadline} #{file}`
	
	if log.empty? 
		return 1
	else
		return 2
	end

end

#-------------------------------------------- PARSING ENTRY DIR METHOD ---------------------------------------------------#
def parseEntry(path, deadline, counter)
	
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
	end
	
	tmpOnTime.each do |key, value|
		entryScore(key, value)
	end
	
	tmp.each do |key, value|
		entryScore(key, value)
	end
	
	counter += 1
	
	if counter == @n
		
		return 0
		
	end
	
end

#---------------------------------------------- PARSING DIRECTORIES METHOD ----------------------------------------#
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
		
		log = `git log --until=#{deadline} #{file}`
		
		if !log.empty? 
		
			@results[name][homework] = 2
			
		else
		
			@results[name][homework] = 1
		
		end
		
		flog = `flog #{file}`
		
		flog = flog.split(":").first
		
		@results[name]["g#{homework}"] = flog.to_s
		
		flay = `flay #{ARGV[0]}#{loc} | grep #{full_name[0].to_s} | wc -l`
		
		@results[name]["y#{homework}"] = rnl(flay)
		
		counter += 1
		
		if counter == @n
		
			return 0
				
		end
		
	end	
end

#------------------------------------------ PARSING TEAM DIR METHOD ------------------------------------------------#
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

		log = `git log --until=Oct-29-2014-20:00:00 -- #{file}`

		if !log.empty?
				
			creator_names = (teams.values_at(team_name)).flatten

			creator_names.each do |s|

				if s == nil
					next
				end
				if @results[s] == nil then @results[s] = initializeStudent() end
				@results[s]["9"] = 2

			end
			
		elsif log.empty?
				
			creator_names = (teams.values_at(team_name)).flatten

			creator_names.each do |s|

				if s == nil
					next
				end
				if @results[s] == nil then @results[s] = initializeStudent() end
				@results[s]["9"] = 1

			end
			
		else
				
			creator_names = (teams.values_at(team_name)).flatten

			creator_names.each do |s|

				if s == nil
					next
				end
				if @results[s] == nil then @results[s] = initializeStudent() end
				@results[s]["9"] = 0

			end
			
		end
		
		counter += 1
		
		if counter == @n

			return 0

		end

	end

end

#------------------------------------------ MAIN -------------------------------------------------#
#------------------------------------ EXECUTING EVERYTHING ---------------------------------------#
i = 0
parseEntry("vhodno_nivo/**/*_*_*.*", "Sep--17--2014--20:00:00", 0)
@homeworks.each do |num, path|
	
	next if num.to_s == "VH" or num.to_s == "9"
	parseDir(num.to_s, path.to_s, deadliness[i].to_s, 0)
	i+=1
						
end
parseTeams(0)

run_time = Time.now - start_time

#----------------------------------------- GENERATING FILE FORMATS ----------------------------------#
case file_format
	
	when "-o csv"
	
		a = CSVWriter.new
		a.write(@results, run_time)

	when "-o xml"

		a = XMLWriter.new
		a.write(@results)

	when "-o json"

		a = JSONWriter.new
		a.write(@results)

	when "-o html"

		a = HTMLWriter.new
		a.write(@results)

	when "-o svg"

		puts "Sorry!"
		
end
