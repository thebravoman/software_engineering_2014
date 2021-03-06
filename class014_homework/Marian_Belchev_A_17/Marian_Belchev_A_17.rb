# Require writers
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'svg_writer.rb'

@results	= Hash.new{|hash, key| hash[key] = {"VH" 	=> 0, 
												"002" 	=> 0, 
												"003" 	=> 0, 
												"004" 	=> 0, 
												"009" 	=> 0, 
												"012" 	=> 0}}
folders 	= ["#{ARGV[0]}/*_homework", "#{ARGV[0]}/vhodno_nivo", "#{ARGV[0]}/class004"]

def checkTime(path, deadline)
	commitTime = `git log --until=#{deadline} #{path}`

	if !commitTime.empty?
		return true
	end
end

def split(file)
	firstName 	= file.split("/").last.split("_").first
	lastName 	= file.split("/").last.split("_", 2).last.split("_").first
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

def checkFolder(folder, hwNum, deadline)
	if hwNum == "VH"
		Dir.glob("#{folder}/**/*_*_*.*") do |file|
			setMark(file, hwNum, deadline)
		end
	elsif hwNum == "009"
		# Read team names from file
		teams = Hash.new
		teamNames = File.read("#{ARGV[0]}/class009_homework/project_to_names.csv")
		teamNames.split("\n").each do |line|
			teams[line.split(",").first] = Array.new if not teams.has_key? line.split(",").first
			teams[line.split(",").first] << line.split(",").last
		end

		Dir.glob("#{folder}/*.pdf") do |file|
			fileTeamName = file.split("/").last.split(".").first.gsub("'", "")
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
		Dir.glob("#{folder}/*_*_*_*.rb") do |file|
			setMark(file, hwNum, deadline)
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
	end
end


if ARGV[1] == "-o"
	resultType = ARGV[2]
	
	case resultType
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
			puts "ERROR: Wrong type of result file!"
	end

	writer.write @results
end