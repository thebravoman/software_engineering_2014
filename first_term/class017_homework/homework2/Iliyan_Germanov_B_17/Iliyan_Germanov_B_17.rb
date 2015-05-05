require_relative "csv_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

time_start = Time.now
repoPath = ARGV[0]
results = Hash.new{|h, k| h[k] = {"VH" => 0, "002" => 0, "003" => 0, "004" => 0, "009" => 0, "012" => 0, "014" => 0, "015" => 0, "017" => 0}}
def initHash
	return Hash.new{|h, k| h[k] = {"002" => -1, "003" => -1, "004" => -1, "012" => -1, "014" => -1, "015" => -1, "017" => -1}}
end
flog = initHash
flay = initHash	
homeworks = {
	"002" => ["class002_homework/**/*_*_*_*.rb", "--until=22.09.2014:20:00"],
	"003" => ["class003_homework/**/*_*_*_*.rb", "--until=24.09.2014:20:00"],
	"004" => ["class004/**/*_*_*_*.rb", "--until=29.09.2014:20:00"],
	"012" => ["class012_homework/**/*_*_*_*.rb", "--until=10.11.2014:20:00"],
	"014" => ["class014_homework/**/*_*_*_*.rb", "--until=13.11.2014:06:00"],
	"015" => ["class015_homework/**/*_*_*_*.rb", "--until=20.11.2014:06:00"],
	"017" => ["class017_homework/homework1/**/*_*_*_*.rb", "--until=02.12.2014:06:00"]
}

def getName(path)
	filename = path.split("/").last.split("_")
	first_name = filename.first
	last_name = filename[1]
	return first_name.capitalize + '_' + last_name.capitalize
end

def onTime(path, deadline)
	return `git log #{deadline} #{path}`.empty? ? 1 : 2
end

homeworks.keys.each do |hw|
	Dir.glob("#{repoPath}/#{homeworks[hw].first}") do |path|
		student_name = getName(path)
		results[student_name][hw] = onTime(path, homeworks[hw][1])	
		flog[student_name][hw] = `flog #{path}`.to_i
		flay[student_name][hw] = `flay #{path} | grep #{student_name} | wc -l`.to_i	
	end	
end

Dir.glob("#{repoPath}/vhodno_nivo/**/*_*_*.*") do |path|
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
	writer.write(results, flog, flay)
end
