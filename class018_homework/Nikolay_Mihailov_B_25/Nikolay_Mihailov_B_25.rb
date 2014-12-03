require_relative  "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require 'csv'
require 'yaml'
time_start=Time.now
classes = file_content= YAML.load_file("info.yml")["classes"]
result = Hash.new{|hash, key| hash[key] = YAML.load_file("info.yml")["result_info"]}
team_names = Array.new

def homework_chek (directory_name,log_info,result,folder)
	program_num = 1 #for VH
	name_before = "" #for VH
	stud = 0
	Dir.glob(ARGV[0]+"#{directory_name}").each do |file|		
		short_file_name = file.split(/\//).last	
		name = short_file_name.split(/_/)[0].capitalize + ',' + short_file_name.split(/_/)[1].capitalize 
		program_num +=1 if folder == 0 && name == name_before #for VH
		log = `git log --until=#{log_info} #{file}`
		result[name][folder] = 2 if (!log.empty? && folder !=0) || (!log.empty? && program_num == 3 && folder == 0)	 
		result[name][folder] = 1 if (log.empty? && folder !=0) || (log.empty? && program_num == 3 && folder == 0)

		stud +=1 if  name != name_before			
		break if stud == ARGV[4].to_i && ARGV[3] == "-n" 		

		name_before = name #for VH
		program_num = 1 if program_num == 3 #for VH
		next if folder == 0 || folder == 10  	
		file_folder = file
		file_folder = file.chomp("#{file.split(/\//).last}") if folder == 14 || folder == 17 || folder == 23 || folder == 26
		result[name][folder + 1] = `flog #{file_folder}`.to_i
		result[name][folder + 2] = `flay #{file_folder}`.to_i
	end
	return result
end
def homework_chek_009 (directory_name,log_info,result,folder)
	team_names = CSV.read(ARGV[0] + "/class009_homework/project_to_names.csv")
	Dir.glob(ARGV[0]+"#{directory_name}").each do |file|	
		name = file.split(/\//).last.split(".").first
		team_members = 0
		line = 0
		first_line = false
		for counter in 1..team_names.length-1
		 	if team_names[counter][0] == name 			
				line = counter if first_line != true
				first_line = true
				team_members +=1		
			end		
		end
		log = ` git log --until=#{log_info} #{file}`
		for index in 0..team_members-1 
			final_name = team_names[line + index][1]
			final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
			result[final_name][folder] = 2 if !log.empty? 
			result[final_name][folder] = 1 if log.empty? 
		end	
	end
	return result
end

folder = 0
YAML.load_file("info.yml")["homeworks"].each do |yaml|
	result = homework_chek_009(yaml[0],yaml[1],result,folder) if folder == 10
	result = homework_chek(yaml[0],yaml[1],result,folder) if folder !=10	
	if folder == 0 || folder == 10 
		folder +=1
	else 
		folder +=3				
	end
end
puts Time.now - time_start
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
		abort()
	end
	writer.write(result,classes,folder-3)
end
