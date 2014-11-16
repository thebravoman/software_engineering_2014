require_relative  "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "csv"
time_start=Time.now
classes = " "," ","VH","002","003","004","009","012","014"
result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0,0,0]}
team_names = Array.new
def homework_chek (directory_name,log_info,result,folder)
	program_num = 1
	name_before = ""
	Dir.glob(ARGV[0]+"#{directory_name}").each do |file|
		short_file = file.split(/\//).last
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name 
		program_num +=1 if folder == 0 && name == name_before #for VH
		log = `git log --until=#{log_info} #{file}`
		result[name][folder] = 2 if (!log.empty? && folder !=0) || (!log.empty? && program_num == 3 && folder == 0)	 
		result[name][folder] = 1 if (log.empty? && folder !=0) || (log.empty? && program_num == 3 && folder == 0)
		name_before = name #for VH
		program_num = 1 if program_num == 3 #for VH
	end
	return result
end
def homework_chek_009 (directory_name,log_info,result,folder)
	team_names = CSV.read("../../class009_homework/project_to_names.csv")[1, 58]
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
for folder in 0..6 do
	case folder
		when 0
		result = homework_chek("/vhodno_nivo/**/*_*_*.*", "Sep--17--2014--20:00:00",result,folder)				
		when 1
		result = homework_chek("/class002_homework/*_*_*_*.rb", "Sep--22--2014--20:00:00",result,folder)
		when 2
		result = homework_chek("/class003_homework/*_*_*_*.rb", "Sep--24--2014--20:00:00",result,folder)
		when 3
		result = homework_chek("/class004/*_*_*_*.rb", "Sep--29--2014--20:00:00",result,folder)
		when 4
		result = homework_chek_009("/class009_homework/**/*.pdf", "Oct--27--2014--20:00:00",result,folder)	
		when 5
		result = homework_chek("/class012_homework/*_*_*_*.rb", "Nov--10--2014--20:00:00",result,folder)
		when 6
		result = homework_chek("/class014_homework/**/*_*_*_*.rb", "Nov--13--2014--06:00:00",result,folder)
		end
end 
		
puts Time.now - time_start
write = true
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
		write = false
		#writer = SVGWriter.new
		else
		write = false
		puts "You are drunk"
	end
	writer.write(result,classes) if write == true
end
