require './csv_writer.rb'
require './json_writer.rb'
require './xml_writer.rb'
require './html_writer.rb'
require 'yaml'

start_time	= Time.new
results		= Hash.new { |hash, key| hash[key] = [0,0,0,0,0,0,0,0,0] }
student_all	= Hash.new { |name, programs| name[programs] = [] }

config = YAML.load_file("homeworks_dir.yml")
folder = 0

class String
  def is_number?
    Float(self) != nil rescue false
  end
end

def get_student_name prog_name
	prog_name.split("_").first.capitalize + " " + prog_name.split("_", 2).last.split("_").first.capitalize
end

def count_underscore prog_name
	prog_name.count "_"
end

number = ARGV[4].to_i if ARGV[3] == "-n"
(0..8).each do |j|
i = 1
	Dir.glob(ARGV[0]+"#{config["foldername"][j]}/*.*").each do |repository|
		prog_name = repository.split("/").last
		counter = count_underscore prog_name
		extension = prog_name.split(".").last
		if (counter == 3) && (i <= number || number == 0)
			case j
				when 1 then git_log = `#{config["deadline"][1]} #{repository}`
				when 2 then git_log = `#{config["deadline"][2]} #{repository}` 
				when 3 then git_log = `#{config["deadline"][3]} #{repository}` 
				when 5 then git_log = `#{config["deadline"][4]} #{repository}` 
				when 6 then git_log = `#{config["deadline"][5]} #{repository}`
				when 7 then git_log = `#{config["deadline"][6]} #{repository}`
				when 8 then git_log = `#{config["deadline"][7]} #{repository}`
			end
			script_file1 = get_student_name prog_name			
			if !git_log.empty? then	results[script_file1][folder] = 2
			elsif git_log.empty? then results[script_file1][folder] = 1 end	
			if extension == "rb"
				results[script_file1][folder+8] = `flog #{repository}`.to_s.split(" ").first.to_s.split(":").first	
				results[script_file1][folder+16] = `flay #{repository}`.to_s.split("= ").last.to_s.split(")").first.to_i
			end
		i += 1
		end
	end
	folder += 1
end
i = 1
Dir.glob(ARGV[0]+"class009_homework/*.pdf").each do |team_names|
	team_name = team_names.split("/").last.split(".").first
	git_log = `git log --until=27.10.2014:20:00:00 -- #{team_names}`
	File.open(ARGV[0]+"class009_homework/project_to_names.csv", "r") do |f1|
		while line = f1.gets  
			team_name_f = line.split(",").first
			student_name_f = line.split(",").last.gsub("\n","")
			if (team_name == team_name_f) && !git_log.empty? && (i <= number || number == 0) 
				results[student_name_f][4] = 2
				i += 1
			elsif (team_name == team_name_f) && git_log.empty? && (i <= number || number == 0)
				results[student_name_f][4] = 1
				i += 1
			end	
		end  
	end
end 	

dir1 = ARGV[0] + "vhodno_nivo"
i = 1
Dir.glob("#{dir1}/**/*.*").each do |program|
	prog_name = program.split("/").last
	name = get_student_name prog_name
	task_number = prog_name.split("_").last.split(".").first

	log = `#{config['deadline'][0]} -- #{program}` 
	counter = count_underscore prog_name
	if (task_number.is_number? && task_number.to_i < 19 && task_number.to_i > 1 && counter == 2)
		if !log.empty?
			student_all["#{name}"] << task_number.to_i
			if (i <= number) || (number == 0)
				results["#{name}"][0] = 2
				i += 1
			end
		elsif log.empty?
			student_all["#{name}"] << task_number.to_i
			if (i <= number) || (number == 0)
				results["#{name}"][0] = 1
				i += 1
			end
		end
	end
end

student_all.sort.each do |name_all, prog|
	if prog.uniq.count < 3 
		results[name_all][0] = 0 
	end
end

time = Time.now - start_time
if ARGV[1] == "-o"
	case ARGV[2]
		when "csv"
			writer = CSVWriter.new
			writer.write results, time
		when "json"
			writer = JSONWriter.new
			writer.write results, time
		when "xml"
			writer = XMLWriter.new
			writer.write results,time
		when "html"
			writer = HTMLWriter.new
			writer.write results, time
		else
		   abort 'ERROR: Wrong file format!'
	end
end
