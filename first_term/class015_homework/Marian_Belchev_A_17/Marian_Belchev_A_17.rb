# Require writers
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'svg_writer.rb'

start 		= Time.now
@results	= Hash.new {|hash, key| hash[key] = {'VH' => 0, '002' => 0, '003' => 0, '004' => 0, '009' => 0, '012' => 0, '014' => 0, 'g2' => 0, 'g3' => 0, 'g4' => 0, 'g9' => '-', 'g12' => 0, 'g14' => 0, 'y2' => '', 'y3' => '', 'y4' => '', 'y9' => '-', 'y12' => '', 'y14' => ''}}
folders 	= ["#{ARGV[0]}/*_homework", "#{ARGV[0]}/vhodno_nivo", "#{ARGV[0]}/class004"]

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

def splitTeamNames teams
	teamNames = File.read("#{ARGV[0]}/class009_homework/project_to_names.csv")
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
	splitTeamNames(teams)

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

Dir.glob(folders) do |path|
	case path.split('/').last
		when 'vhodno_nivo'
			checkHW(path, 'VH', '17.09.2014:20:00:00') 
		when 'class002_homework'
			checkHW(path, '002', '22.09.2014:20:00:00')
		when 'class003_homework'
			checkHW(path, '003', '24.09.2014:20:00:00')
		when 'class004'
			checkHW(path, '004', '29.09.2014:20:00:00')
		when 'class009_homework'
			check009(path, '009', '27.10.2014:20:00:00')
		when 'class012_homework'
			checkHW(path, '012', '10.11.2014:20:00:00')
		when 'class014_homework'
			checkHW(path, '014', '13.11.2014:06:00:00')
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