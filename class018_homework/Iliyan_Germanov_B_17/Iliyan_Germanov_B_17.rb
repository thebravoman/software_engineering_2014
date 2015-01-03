require 'yaml'
require_relative "csv_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

@counter = 0
time = Time.now
repoPath = ARGV[0]
classes = YAML.load_file("config.yml")["init_student"].keys
results = Hash.new{|h, k| h[k] = YAML.load_file("config.yml")["init_student"]}
homeworks = YAML.load_file("config.yml")["homeworks"]
vh_counter = Hash.new{|h, k| h[k] = 0}

abort("You must pass path to the repository as first argument!") if ARGV[0] == nil
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
		abort("Invalid output format!")
	end
else
	abort("None output format selected!")
end

$stderr.reopen("/dev/null", "w")

def getName(path, delimiter)
	filename = File.basename(path).split(delimiter)
	first_name = filename.first
	last_name = filename[1]
	return first_name.capitalize + '_' + last_name.capitalize
end

def onTime(path, deadline)
	return `git log #{deadline} #{path}`.empty? ? 1 : 2
end

def n_checked
	return false if ARGV[3] != "-n"
	if @counter == ARGV[4].to_i
		@counter = 0
		return true
	else
		@counter += 1
		return false
	end
end

teams = Hash.new{|h, k| h[k] = Array.new}
content = File.read("#{repoPath}/class009_homework/project_to_names.csv").split("\n")
content.each do |line|
	line = line.split(",")
	team_name = line.first
	student = getName(line[1], " ")
	teams[team_name] << student
end

homeworks.keys.each do |hw|
	Dir.glob("#{repoPath}/#{homeworks[hw].first}") do |path|
		break if n_checked
		case hw
		when "VH"
			student_name = getName(path, "_")
			vh_counter[student_name] += 1
			results[student_name]["VH"] = onTime(path, "--until=17.09.2014:20:00")
		when "009"
			team = File.basename(path, ".pdf")
			teams[team].each {|student| results[student]["009"] = onTime(path, "--until=27.10.2014:20:00")}
		else
			student_name = getName(path, "_")
			results[student_name][hw] = onTime(path, homeworks[hw][1])	
			results[student_name]["g#{hw.delete("0")}"] = `flog #{path}`.to_i
			results[student_name]["y#{hw.delete("0")}"] = `flay #{path} | grep #{student_name} | wc -l`.to_i
		end	
	end	
	puts "homework - #{hw} checked."
end

results.keys.each {|student| results[student]["VH"] = 0 if vh_counter[student] < 3} #evaluating VH

time = Time.now - time
writer.write(results,classes, time)
