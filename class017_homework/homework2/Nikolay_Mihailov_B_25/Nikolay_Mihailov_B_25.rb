require_relative  "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "csv"
time_start=Time.now
classes = " "," ","VH","002","Flog02","Flay02","003","Flog03","Flay03","004","Flog04","Flay04","009","012","Flog12","Flay12","014","Flog14","Flay14","015","Flog15","Flay15","017","Flog17","Flay17"
result = Hash.new{|hash, key| hash[key] = [0,0,'-','-',0,'-','-',0,'-','-',0,0,'-','-',0,'-','-',0,'-','-',0,'-','-']}
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
		file_folder = file.chomp("#{file.split(/\//).last}") if folder == 14 || folder == 17
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
result = homework_chek("/vhodno_nivo/**/*_*_*.*", "Sep--17--2014--20:00:00",result,folder)				
folder = 1
result = homework_chek("/class002_homework/*_*_*_*.rb", "Sep--22--2014--20:00:00",result,folder)
folder = 4 #[0,0,'-','-',0,'-','-',0,'-','-',0,0,'-','-',0,'-','-',0,'-','-',0,'-','-']
result = homework_chek("/class003_homework/*_*_*_*.rb", "Sep--24--2014--20:00:00",result,folder)
folder = 7
result = homework_chek("/class004/*_*_*_*.rb", "Sep--29--2014--20:00:00",result,folder)
folder = 10
result = homework_chek_009("/class009_homework/**/*.pdf", "Oct--27--2014--20:00:00",result,folder)	
folder = 11
result = homework_chek("/class012_homework/*_*_*_*.rb", "Nov--10--2014--20:00:00",result,folder)
folder = 14  
result = homework_chek("/class014_homework/**/*_*_*_*.rb", "Nov--13--2014--06:00:00",result,folder) 
folder = 17  
result = homework_chek("/class015_homework/**/*_*_*_*.rb", "Nov--20--2014--06:00:00",result,folder) 
folder = 20  
result = homework_chek("/class017_homework/homework1/*_*_*_*.rb","Dec--2--2014--06:00:00",result,folder) 
		
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
