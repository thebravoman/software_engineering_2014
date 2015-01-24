require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require 'yaml'
time_start=Time.now
@repoPath=ARGV[0]
classes = " "," ","VH","002","Flog02","Flay02","003","Flog03","Flay03","004","Flog04","Flay04","009","012","Flog12","Flay12","014","Flog14","Flay14","015","Flog15","Flay15","017","Flog17","Flay17"
result = Hash.new{|hash, key| hash[key] = [0,0,'-','-',0,'-','-',0,'-','-',0,0,'-','-',0,'-','-',0,'-','-',0,'-','-']}
team_names = Array.new
@folder=0
@c=0
def logget(log_info,name,result,file)
	log = ` git log --until=#{log_info} #{file}`
	result[name][@folder] = 2 if (!log.empty? )
	result[name][@folder] = 1 if (log.empty? )
return result
end
def homework_chek (directory_name,log_info,result)
	if directory_name == "/class009_homework/**/*.pdf"
		team_names = CSV.read(@repoPath + "/class009_homework/project_to_names.csv")
		Dir.glob(@repoPath + "#{directory_name}").each do |file|
			name = file.split(/\//).last.split(".").first
			team_members = 0
			first_line = false
			for counter in 1..team_names.length-1
				if team_names[counter][0] == name
					line = counter if first_line != true
					first_line = true
					team_members +=1	
				end	
			end
		for index in 0..team_members-1
			name = team_names[line + index][1]
			name = name.split(" ")[0] + "," + name.split(" ")[1]
			result=logget(log_info,name,result,file)
		end	
	end
	else 	
	
	Dir.glob(@repoPath + "#{directory_name}").each do |file|
		short_file_name = file.split(/\//).last
		first_name = short_file_name.split(/_/)[0].capitalize
		second_name = short_file_name.split(/_/)[1].capitalize
		name = first_name + "," + second_name
		result=logget(log_info,name,result,file)
		if @c > ARGV[4].to_i && ARGV[3] == "-n" 	
		break		
		end
		
			if @folder !=0
			result[name][@folder + 1] = `flog #{file}`.to_i 
		
		
			result[name][@folder + 2] = `flay #{file} | grep #{first_name} | wc -l `.to_i 
	end
	end
	@folder+=1 if @folder !=0
	@folder+=1   if @folder !=0
	end		
	puts  "#{directory_name}  checked"
	@folder+=1	
		
	return result
end
$stderr.reopen("/dev/null", "w")

		
	result = homework_chek("/vhodno_nivo/**/*_*_*.*", "Sep--17--2014--20:00:00",result)
result = homework_chek("/class002_homework/*_*_*_*.rb", "Sep--22--2014--20:00:00",result)
result = homework_chek("/class003_homework/*_*_*_*.rb", "Sep--24--2014--20:00:00",result)
result = homework_chek("/class004/*_*_*_*.rb", "Sep--29--2014--20:00:00",result) 
result = homework_chek("/class009_homework/**/*.pdf", "Oct--27--2014--20:00:00",result)
result = homework_chek("/class012_homework/*_*_*_*.rb", "Nov--10--2014--20:00:00",result)
result = homework_chek("/class014_homework/**/*_*_*_*.rb", "Nov--13--2014--06:00:00",result) 
result = homework_chek("/class015_homework/**/*_*_*_*.rb", "Nov--20--2014--06:00:00",result) 
result = homework_chek("/class017_homework/homework1/*_*_*_*.rb","Dec--2--2014--06:00:00",result) 
puts "Time: ",Time.now - time_start
folder=@folder
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
