# Require writers
require 'yaml'
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'svg_writer.rb'

start 		= Time.now
config 		= YAML.load_file('config.yml')
@results	= Hash.new {|hash, key| hash[key] = YAML.load_file('init.yml')}

def checkTime path, deadline
	return `git log --until=#{deadline} #{path}`.empty? ? 1 : 2
end

def split file
	path 		= file.split('/').last
	firstName 	= path.split('_').first
	lastName 	= path.split('_', 2).last.split('_').first
	return fullName	= "#{firstName.capitalize} #{lastName.capitalize}"
end

def numCase hwNum, file, yOrG, result
	@results[split(file)]["#{yOrG}#{hwNum.to_i.to_s}"] = result
end

def flog file, hwNum
	flogResult = `flog #{file} -c -q -s`.split(":").first
	numCase(hwNum, file, 'g', flogResult)
end

def flay file, hwNum
	flayResult = `flay #{file}`.split("\n").first.scan(/\d+/).first
	numCase(hwNum, file, 'y', flayResult)
end

def splitTeamNames teams, folder
	teamNames = File.read("#{ARGV[0]}/#{folder.split("../").last}project_to_names.csv")
	teamNames.split("\n").each do |line|
		split = line.split(',')
		splitFirst = split.first
		teams[splitFirst] = [] unless teams.key? splitFirst
		teams[splitFirst] << split.last
	end
	return teams
end

def check009 folder, hwNum, deadline
	teams = Hash.new
	splitTeamNames(teams, folder)

	Dir.glob("#{folder}/*.pdf") do |file|
		fileTeamName = file.split('/').last.split('.').first.tr("'", '')
		if teams.key? fileTeamName
			teams[fileTeamName].each do |student|
				@results[student][hwNum] = checkTime(file, deadline)
			end
		end
	end
end

def checkHW folder, hwNum, deadline
	hwNum != "VH" ? path = "#{folder}/**/*_*_*_*.rb" : path = "#{folder}/**/*_*_*.*"
	Dir.glob(path) do |file|
		@results[split(file)][hwNum] = checkTime(file, deadline)
		if hwNum != "VH"
			flog(file, hwNum)
			flay(file, hwNum)
		end
	end
end

config["deadlines"].each do |hw, deadline|
	path = ARGV[0] + config["folders"][hw]
	case hw
		when '009'
			check009(path, hw, deadline)
		when '017'
			checkHW("#{path}/homework1", '0171', deadline)
			checkHW("#{path}/homework2", '0172', deadline)
		else
			checkHW(path, hw, deadline)
	end
end

if ARGV[1] == '-o'
	case ARGV[2]
		when 'csv'
			writer = CSVWriter.new
		when 'xml'
			writer = XMLWriter.new
		when 'json'
			writer = JSONWriter.new
		when 'html'
			writer = HTMLWriter.new
		when 'svg'
			writer = SVGWriter.new
		else 
			abort 'ERROR: Wrong type of result file!'
	end

	writer.write @results, Time.now - start
end