#179.5 flog
#178.5 flog, when using nil(line 36)

# Require writers
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'svg_writer.rb'

start 		= Time.now
@results	= Hash.new{|hash, key| hash[key] = {"VH" 	=> 0, 
												"002" 	=> 0, 
												"003" 	=> 0, 
												"004" 	=> 0, 
												"009" 	=> 0, 
												"012" 	=> 0,
												"014" 	=> 0,
												"g2"	=> 0,
												"g3" 	=> 0,
												"g4" 	=> 0,
												"g9" 	=> "-",
												"g12" 	=> 0,
												"g14" 	=> 0,
												"y2" 	=> "",
												"y3" 	=> "",
												"y4" 	=> "",
												"y9" 	=> "-",
												"y12" 	=> "",
												"y14" 	=> ""}}
folders 	= ["#{ARGV[0]}/*_homework", "#{ARGV[0]}/vhodno_nivo", "#{ARGV[0]}/class004"]

def checkTime(path, deadline)
	commitTime = `git log --until=#{deadline} #{path}`

	if commitTime.nil? ; return true ; end
end

def split(file)
	firstName 	= file.split("/").last.split("_").first.capitalize
	lastName 	= file.split("/").last.split("_", 2).last.split("_").first.capitalize
	fullName 	= firstName + " " + lastName

	return fullName	
end

def setMark(file, hwNum, deadline)
	if checkTime(file, deadline)
		@results[split(file)][hwNum] = 2
	else
		@results[split(file)][hwNum] = 1
	end
end

def numCase(hwNum, file, yOrG, result)
	case hwNum
		when "002"
			@results[split(file)]["#{yOrG}2"] = result
		when "003"
			@results[split(file)]["#{yOrG}3"] = result
		when "004"
			@results[split(file)]["#{yOrG}4"] = result
		when "009"
			@results[split(file)]["#{yOrG}9"] = result
		when "012"
			@results[split(file)]["#{yOrG}12"] = result
		when "014"
			@results[split(file)]["#{yOrG}14"] = result
	end
end

def flog(file, hwNum)
	command = `flog #{file}`
	flogResult = command.split(":").first

	numCase(hwNum, file, "g", flogResult)
end

def flay(file, hwNum)
	#flayResult = `flay #{file} | grep Lili | wc -l`

	command = `flay #{file}`
	flayResult = command.split("\n").first.scan(/\d+/).first

	numCase(hwNum, file, "y", flayResult)
end

def splitTeamNames(teams)
	teamNames = File.read("#{ARGV[0]}/class009_homework/project_to_names.csv")
	teamNames.split("\n").each do |line|
		teams[line.split(",").first] = Array.new if not teams.has_key? line.split(",").first
		teams[line.split(",").first] << line.split(",").last
	end

	return teams
end

def checkFolder(folder, hwNum, deadline)
	if hwNum == "VH"
		Dir.glob("#{folder}/**/*_*_*.*") do |file|
			setMark(file, hwNum, deadline)
		end
	elsif hwNum == "009"
		# Read team names from file
		teams = Hash.new
		splitTeamNames(teams)

		Dir.glob("#{folder}/*.pdf") do |file|
			fileTeamName = file.split("/").last.split(".").first.gsub!("'", "")
			if teams.has_key? fileTeamName
				teams[fileTeamName].each do |student|
					if checkTime(file, deadline)
						@results[student][hwNum] = 2
					else
						@results[student][hwNum] = 1
					end
				end
			end
		end
	else
		Dir.glob("#{folder}/**/*_*_*_*.rb") do |file|
			setMark(file, hwNum, deadline)
			flog(file, hwNum)
			flay(file, hwNum)
		end
	end
end

Dir.glob(folders) do |path|
	shortPath = path.split("/").last
	case shortPath
		when "vhodno_nivo"
			checkFolder(path, "VH", "17.09.2014:20:00:00") 
		when "class002_homework"
			checkFolder(path, "002", "22.09.2014:20:00:00")
		when "class003_homework"
			checkFolder(path, "003", "24.09.2014:20:00:00")
		when "class004"
			checkFolder(path, "004", "29.09.2014:20:00:00")
		when "class009_homework"
			checkFolder(path, "009", "27.10.2014:20:00:00")
		when "class012_homework"
			checkFolder(path, "012", "10.11.2014:20:00:00")
		when "class014_homework"
			checkFolder(path, "014", "13.11.2014:06:00:00")
	end
end

if ARGV[1] == "-o"
	case ARGV[2]
		when "csv"
			writer = CSVWriter.new
		when "xml"
			writer = XMLWriter.new
		when "json"
			writer = JSONWriter.new
		when "html"
			writer = HTMLWriter.new
		when "svg"
			writer = SVGWriter.new
		else 
			abort "ERROR: Wrong type of result file!"
	end

	finish = Time.now
	time = finish - start

	writer.write @results,time
end