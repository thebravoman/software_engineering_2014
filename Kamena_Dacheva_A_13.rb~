require 'csv'
require './csv_writer.rb'
require './json_writer.rb'
require './xml_writer.rb'
require './html_writer.rb'

results     = Hash.new { |hash, key| hash[key] = [0,0,0,0,0,0] }
teams_hash  = Hash.new { |hash, key| hash[key] = [] }
time_hash   = Hash.new { |hash, key| hash[key] = [] }
student_all = Hash.new { |name, programs| name[programs] = [] }
student_time= Hash.new { |name, programs| name[programs] = [] }
firstLine   = "FirstName LastName","VH","002","003","004","009","012"
folder_name = ["vhodno_nivo","class002_homework", "class003_homework","class004","class009_homework","class012_homework"]
folder = 0

class String
  def is_number?
    Float(self) != nil rescue false
  end
end

(0..5).each do |j|
	Dir.glob(ARGV[0]+"/#{folder_name[j]}/*.*").each do |repository|
		prog_name = repository.split("/").last
		counter = prog_name.count "_"
		if counter == 3
			case j
				when 0 then 
				when 1 then git_log = `git log --until=22.09.2014:20:00:00 #{repository}` 
				when 2 then git_log = `git log --until=24.09.2014:20:00:00 #{repository}` 
				when 3 then git_log = `git log --until=29.09.2014:20:00:00 #{repository}` 
				when 4 then 
				when 5 then git_log = `git log --until=10.11.2014:20:00:00 #{repository}` 
			end	
#			script_file1 = repository.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")
			script_file1 = prog_name.split("_").first.capitalize + " " + prog_name.split("_", 2).last.split("_").first.capitalize
			if (j!= 0 && j != 4)
				if !git_log.empty?
					 results[script_file1][folder] = 2
				elsif git_log.empty?
					 results[script_file1][folder] = 1	
				end
			end
		end
	end
	folder += 1
end

dir = ARGV[0] + "class009_homework/"
f = File.open("#{dir}project_to_names.csv", "r")
f.each do |line|
	if line.start_with? ',' 
		elsif !line.include?("Progect Name")
  			team = line.split(",").first
			names = line.split(",").last
			teams_hash[team] << names.gsub("\n","")
		end
end  
f.close

Dir.glob("#{dir}"+"*").each do |report|
team_name = report.split("/").last.split(".").first
log = `git log --until=27.10.2014:20:00:00 -- #{report}`
	if !log.empty?
	 	team_name = report.split("/").last.split(".").first
	   	time_hash["#{team_name}"] << 2
	elsif log.empty?
	   	team_name1 = report.split("/").last.split(".").first
	   	time_hash["#{team_name1}"] << 1
	end
end

teams_hash.each do |team, names|
	time_hash.each do |team1, time|
		if team == team1
			names.each do |n|
				results[n][4] = time
			end
		end
	end
end

dir1 = ARGV[0] + "vhodno_nivo"
Dir.glob("#{dir1}/**/*.*").each do |program|
	prog_name = program.split("/").last
	name = prog_name.split("_").first.capitalize + " " + prog_name.split("_", 2).last.split("_").first.capitalize
	task_number = prog_name.split("_").last.split(".").first

	if prog_name.include? "_" then counter = prog_name.count "_" end

	log = `git log --until=17.09.2014:20:00:00 -- #{program}` 

	if (task_number.is_number? && task_number.to_i < 19 && task_number.to_i > 1 && counter == 2)
		if !log.empty?
			student_all["#{name}"] << task_number.to_i
			student_time["#{name}"] = 2
		elsif log.empty?
			student_all["#{name}"] << task_number.to_i
			student_time["#{name}"] = 1
		end
	end
end
student_all.sort.each do |name_all, prog|
	if prog.uniq.count >= 3 
		student_time.each do |name_time,t|
			if name_all == name_time
				results[name_time][0] = t
			end
		end
	end
end

if ARGV[1] == "-o"
	if ARGV[2] == "csv"
		writer = CSVWriter.new
		writer.write results
	elsif ARGV[2] == "json"
		writer = JSONWriter.new
		writer.write results
	elsif ARGV[2] == "xml"
		writer = XMLWriter.new
		writer.write results
        elsif ARGV[2] == "html"
		writer = HTMLWriter.new
		writer.write results
	end
end
