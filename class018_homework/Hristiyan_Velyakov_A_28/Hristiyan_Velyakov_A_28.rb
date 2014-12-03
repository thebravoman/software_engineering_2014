require 'yaml'
require_relative "csv_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

@counter = 0
time_start = Time.now
repoPath = ARGV[0]
classes = YAML.load_file("config.yml").keys
results = Hash.new{|h, k| h[k] = YAML.load_file("config.yml")}
homeworks = YAML.load_file("homeworks.yml")
def getName(path)
	filename = path.split("/").last.split("_")
	first_name = filename.first
	last_name = filename[1]
	return first_name.capitalize + '_' + last_name.capitalize
end

def onTime(path, deadline)
	return `git log #{deadline} #{path}`.empty? ? 1 : 2
end

def n_checked
	if ARGV[3] == "-n"
		if @counter == ARGV[4].to_i
			@counter = 0
			return true
		end
		@counter += 1
		return false
	end
	return false
end

homeworks.keys.each do |hw|
	Dir.glob("#{repoPath}/#{homeworks[hw].first}") do |path|
		break if n_checked
		student_name = getName(path)
		results[student_name][hw] = onTime(path, homeworks[hw][1])	
		results[student_name]["g#{hw.tr("0", '')}"] = `flog #{path}`.to_i
		results[student_name]["y#{hw.tr("0", '')}"] = `flay #{path} | grep #{student_name} | wc -l`.to_i	
	end	
end

Dir.glob("#{repoPath}/vhodno_nivo/**/*_*_*.*") do |path|
	break if n_checked	
	student_name = getName(path)
	if onTime(path, "--until=17.09.2014:20:00") == 2
		results[student_name]["VH"] += 1
	else
		results[student_name]["VH"] += 101
	end
end

results.keys.each do |student|
	if results[student]["VH"] % 100 >= 3
		if results[student]["VH"] < 100
			results[student]["VH"] = 2
		else
			results[student]["VH"] = 1
		end
	else
		results[student]["VH"] = 0
	end
end

teams = Hash.new{|h, k| h[k] = Array.new}
content = File.read("#{repoPath}/class009_homework/project_to_names.csv").split("\n")
content.each do |line|
	team_name = line.split(",").first
	student = line.split(",")[1] 
	student = student.split(" ").first + "_" + student.split(" ")[1] if student != nil
	teams[team_name] << student
end

Dir.glob("#{repoPath}/class009_homework/**/*.pdf") do |path|
	break if n_checked	
	team = path.split("/").last.split(".").first
	teams[team].each do |student|
		results[student]["009"] = onTime(path, "--until=27.10.2014:20:00")
	end
end	

puts "Time: #{Time.now - time_start}"
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
		abort("Invalid output type!")
	end
	writer.write(results, classes)
end
