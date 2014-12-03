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
	Dir.glob(ARGV[0]+"#{directory_name}").each do |file|		
		short_file_name = file.split(/\//).last		
		first_name = short_file_name.split(/_/)[0].capitalize
		last_name = short_file_name.split(/_/)[1].capitalize
		name = first_name + ',' + last_name 
		program_num +=1 if folder == 0 && name == name_before #for VH
		log = `git log --until=#{log_info} #{file}`
		result[name][folder] = 2 if (!log.empty? && folder !=0) || (!log.empty? && program_num == 3 && folder == 0)	 
		result[name][folder] = 1 if (log.empty? && folder !=0) || (log.empty? && program_num == 3 && folder == 0)
		name_before = name #for VH
		program_num = 1 if program_num == 3 #for VH
		#puts file
		next if folder == 0 || folder == 10 	#next if folder != 11 && folder != 14 	
		file_folder = file
		file_folder = file.chomp("#{file.split(/\//).last}") if folder == 14 || folder == 17 || folder == 23
		flog = `flog #{file_folder}`
		flay = `flay #{file_folder}`
		result[name][folder + 1] = flog.split(/:/).first 
		result[name][folder + 2] = flay.split(/=/)[1][1, 4].delete!("\n")
	end
	return result
end
def homework_chek_009 (directory_name,log_info,result,folder)
	team_names = CSV.read(ARGV[0] + "/class009_homework/project_to_names.csv")[1, 58]
	Dir.glob(ARGV[0]+"#{directory_name}").each do |file|	
		name = file.split(/\//).last.split(".").first
		team_members = 0
		line = 0
		first_line = false
		for counter in 0..55
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
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["vhodno_nivo"],YAML.load_file("info.yml")["deadlines"]["vhodno_nivo"],result,folder)				
folder = 1
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h2"],YAML.load_file("info.yml")["deadlines"]["h2"],result,folder)
folder = 4 
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h3"],YAML.load_file("info.yml")["deadlines"]["h3"],result,folder)
folder = 7
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h4"],YAML.load_file("info.yml")["deadlines"]["h4"],result,folder)
folder = 10
result = homework_chek_009(YAML.load_file("info.yml")["homeworks"]["h9"],YAML.load_file("info.yml")["deadlines"]["h9"],result,folder)	
folder = 11
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h12"],YAML.load_file("info.yml")["deadlines"]["h12"],result,folder)
folder = 14  
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h14"],YAML.load_file("info.yml")["deadlines"]["h14"],result,folder) 
folder = 17  
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h15"],YAML.load_file("info.yml")["deadlines"]["h15"],result,folder) 
folder = 20  
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h17-1"],YAML.load_file("info.yml")["deadlines"]["h17-1"],result,folder)
folder = 23
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h17-2"],YAML.load_file("info.yml")["deadlines"]["h17-2"],result,folder)
folder = 26
result = homework_chek(YAML.load_file("info.yml")["homeworks"]["h18"],YAML.load_file("info.yml")["deadlines"]["h18"],result,folder)
	
write = true
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
		write = false
		puts "You are drunk"
	end
	writer.write(result,classes,folder) if write == true
end
