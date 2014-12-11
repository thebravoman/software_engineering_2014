require 'csv'
require 'yaml'
require_relative "csv_writer.rb"
require_relative "html_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "svg_writer.rb"

start_time = Time.now
results = Hash.new
folder = YAML.load_file('config.yml')
date = Hash.new
if ARGV[3] == "-n" && ARGV[4].to_i != 0
	argv_num = ARGV[4].to_i
end

teams = Hash.new
current_team = Hash.new

	
def time(path, date)
	if path != "#{ARGV[0]}software_engineering_2014/class009_homework/require'teamName'.pdf"
		gitLog = `git log --reverse #{path}`
		if gitLog != ""
		gitLog = gitLog.split(" 2014").first.split("Date:   ").last.split(" +").first.split(" ")
		month2 = gitLog[1]
		date2 = gitLog[2].to_i
		time2 = gitLog[3].split(":").first.to_i
		if month2 != date[0]  
			return false 
		end
		if date2 > date[1]  
			return false
		end
		if date2 == date[1] && time2 >= date[2] 
			return false 
		end
	
		return true
		end
	end
end

CSV.foreach("#{ARGV[0]}" +"class009_homework/project_to_names.csv") do |csv|
	if csv[0] != "Project Name" && csv[1] != "Student Name"
		team = csv[0]
		full_name = csv[1].split(" ")[0] + "_" + csv[1].split(" ")[1]
		teams[full_name] = team
	end
end

def chek_result(hash_all, student, first_names, homework, paths, time_check)
	if hash_all[student] == nil
		hash_all[student] = YAML.load_file('init_students.yml')
	end
	if(homework != "009")
		hash_all[student]["g#{homework}"] = `flog #{paths}`.split(':').first
		hash_all[student]["y#{homework}"] = `flay #{paths} | grep #{first_names} | wc -l`.to_i
	end
	if time_check
		hash_all[student]["#{homework}"] = 2
	else 
		hash_all[student]["#{homework}"] = 1
	end
end

def chek_VH(hash_all, homework, paths)
	Dir.glob("#{ARGV[0]}"+"#{paths}") do |my_text_file|
		count = 0
		s = my_text_file.split('/').last
		if s.split("_").length >= 3 && !s.split(".").last.include?("~")
			student = "#{s.split("_")[0].capitalize}" + "_" + "#{s.split("_")[1].capitalize}"
		end
		Dir.glob("#{my_text_file}/*.*") do |file|
			count = count +1
		end
		if hash_all[student] == nil
			hash_all[student] = YAML.load_file('init_students.yml')
		end
		if count >= 3
			if time(my_text_file, ["Sep", 17, 20])
				hash_all[student]["#{homework}"] = 2
			else 
				hash_all[student]["#{homework}"] = 1
			end
		end
	end
end

$stderr.reopen("/dev/null", "w")

folder.each do |key, value|
	i = 0
	Dir.glob("#{ARGV[0]}#{folder[key].first}") do |path|
		if i == argv_num
			break
		else
			s = path.split('/').last
			if key == "009"
				teams.each do |key, value|
					if value == s.split(".").first
						first_name = key.split("_")[0].capitalize
						full_name = key
						current_team[full_name] = first_name
					end
				end
				current_team.each do |key, value|
					hw = "009"
					chek_result(results, key, value, hw, path, time(path,["Oct", 27, 20]))
				end
			elsif key == "VH"
					path = "vhodno_nivo/**/*"
					#chek_VH(results, key, path)
			else
				first_name = s.split("_")[0].capitalize
				full_name = "#{first_name}" + "_" + "#{s.split("_")[1].capitalize}"
				chek_result(results, full_name, first_name, key, path, time(path,value.last))
			end
			i += 1
		end
	end
end

results.each do |k, v|
	if k == nil
		results.delete(nil)
	end
end
time_program = Time.now - start_time

if ARGV[1] == "-o"
	case ARGV[2]
	when "csv"
		writer = CSVwriter.new
	when "html"
		writer = HTMLwriter.new
	when "xml"
		writer = XMLwriter.new
	when "json"
		writer = JSONwriter.new
	when "svg"
		writer = SVGwriter.new
	else puts "You put in wrong format!"
	end
		writer.write(time_program, results)
end
