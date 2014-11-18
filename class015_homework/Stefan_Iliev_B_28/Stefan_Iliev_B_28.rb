require 'csv'
require 'shellwords'
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require_relative "csv_writer.rb"
require_relative "git_time_checker.rb"

results = Hash.new
time_starts = Time.now
gitTimeChecker = GitTimeChecker.new

def CreateStudent() 
	hash = Hash.new
	hash["VH"] = 0
	hash["homework_1"] = 0 
	hash["homework_2"] = 0
	hash["homework_3"] = 0
	hash["homework_4"] = 0
	hash["homework_5"] = 0 
	return hash
end

def getStudentName( element ) 
	student_name = element.split("/").last
	student_name = student_name.split("_")[0].capitalize + "_" + student_name.split("_")[1].capitalize
	return student_name
end 

repository_path = ARGV.shift || "err"
homeworks = Hash.new
students = Hash.new 

homeworks["entry_homework"] = Dir.glob(repository_path + "/vhodno_nivo/**/*_*_*.*")
homeworks["homework_1"] = Dir.glob(repository_path + "/class002_homework/**/*_*_*_*.rb")
homeworks["homework_2"] = Dir.glob(repository_path + "/class003_homework/**/*_*_*_*.rb")
homeworks["homework_3"] = Dir.glob(repository_path + "/class004/**/*_*_*_*.rb")
homeworks["homework_4"] = Dir.glob(repository_path + "/class009_homework/**/*.pdf")
homeworks["homework_5"] = Dir.glob(repository_path + "/class012_homework/**/*_*_*_*.rb")

p "load files:"
puts Time.now - time_starts


writer = 0 
ARGV.each do |element| 
	if element == "-o"
		case ARGV[ARGV.index("-o") + 1]
			when "xml"
				writer = XMLWriter.new
			when "svg"
				writer = SVGWriter.new
			when "csv"
				writer = CSVWriter.new
			when "html"
				writer = HTMLWriter.new
			when "json"
				writer = JSONWriter.new
		end
	end
end
if writer == 0 
	p "Cmon. OUTPUT EXTENSION. PLEASE"
	exit()
end	

p "parse args:"
puts Time.now - time_starts

results_count = Hash.new
homeworks["entry_homework"].each do |element|
	extension = element.split(".").last
	if extension == "class" || extension.include?("~") then next end
	student_name = getStudentName(element)
	if students[student_name] == nil then students[student_name] = CreateStudent() end 
	res_count = results_count[student_name] || results_count[student_name] = 0
	if res_count == 3 then next end 
	
	result = gitTimeChecker.checkLog(element,"2014:09:17:20:00",1,false).to_i
	if result != -1 then results_count[student_name] += 1 end
end

results_count.each do |k,v| 
	if v >= 3 then students[k]["entry_homework"] = 2 
	else students[k]["entry_homework"] = 1 end
end

p "check first homework:"
puts Time.now - time_starts

times = ["0","2014:09:22:20:00", "2014:09:24:20:00","2014:09:29:20:00","2014:10:27:20:00"]
for i in 1..5
	next if (i == 4)
	homeworks["homework_#{i.to_s}"].each do |element|
	
		student_name = getStudentName( element )
		if students[student_name] == nil then students[student_name] = CreateStudent() end			
		result = gitTimeChecker.checkLog(element,times[i],1,false).to_i 	
		if result != -1 then students[student_name]["homework_#{i.to_s}"] = 2
		else students[student_name]["homework_#{i.to_s}"] = 1 end

	end
end

p "check 1..5 homeworks except 4:"
puts Time.now - time_starts


team_members = Hash.new 
team_members.compare_by_identity
CSV.foreach("#{repository_path}/class009_homework/project_to_names.csv") do |line|
	if line.length == 2 then
		team_members[line[0]] = line[1]
	end 
end

homeworks["homework_4"].each do |element| 
	team_name = element.split(/\//).last.split(/\./).first
	result = result = gitTimeChecker.checkLog(element,"2014:10:27:20:00",1,false).to_i || 0 
	team_members.each do |k ,v|
		if k == team_name 
			student_name = v.split(" ")[0] + "_" + v.split(" ")[1] 
			if students[student_name] == nil then students[student_name] = CreateStudent() end

			if result != -1 then students[student_name]["homework_4"] = 2
			else students[student_name]["homework_4"] = 1 end 
		end 
	end
end 

students = students.sort_by{|k,v| k }
puts Time.now - time_starts
writer.write(students)

	
