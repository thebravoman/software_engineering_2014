require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require 'csv'
require 'yaml'
time_start=Time.now
@repoPath=ARGV[0]
classes = file_content= YAML.load_file("info.yml")["classes"]
result = Hash.new{|hash, key| hash[key] = YAML.load_file("info.yml")["result_info"]}
team_names = Array.new
@folder=0
def logget(log_info,name,result,file)
	log = ` git log --until=#{log_info} #{file}`
	result[name][@folder] = 2 if (!log.empty? )
	result[name][@folder] = 1 if (log.empty? )
return result
end
def homework_chek (directory_name,log_info,result)
	flayy = log_info.split(",").last
	flogg =log_info.split(",")[1]
	i=2	
	if flogg=="flay"
	i=1
	end
	log_info = log_info.split(",")[0]
	Dir.glob(@repoPath + "#{directory_name}").each do |file|
		short_file_name = file.split(/\//).last
		first_name = short_file_name.split(/_/)[0].capitalize
		name = first_name + "," + short_file_name.split(/_/)[1].capitalize
		result=logget(log_info,name,result,file)
		if flogg =="flog"
			result[name][@folder + 1] = `flog #{file}`.to_i
		end
		if flayy =="flay"
			result[name][@folder + i] = `flay #{file} | grep #{first_name} | wc -l `.to_i
		end
		end
		if flogg=="flog"   
			@folder+=1
		end
		if flayy=="flay"  
			@folder+=1
		end
	@folder+=1
	return result
end
def pdfhw(directory_name,log_info,result)
	cop = log_info.split(",").last
	log_info = log_info.split(",")[0]	
	team_names = CSV.read(@repoPath + "#{cop}")
	Dir.glob(@repoPath + "#{directory_name}").each do |file|
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
		for index in 0..team_members-1
			name = team_names[line + index][1]
			name = name.split(" ")[0] + "," + name.split(" ")[1]
			result=logget(log_info,name,result,file)
		end	
	end
	@folder+=1
	return result
end
$stderr.reopen("/dev/null", "w")
YAML.load_file("info.yml")["homeworks"].each do |yaml|
puts "Working on folder: ", yaml[0]
	enemy=yaml[0].split(".").last
	if enemy == "pdf"
		result = pdfhw(yaml[0],yaml[1],result) 
	else
		result = homework_chek(yaml[0],yaml[1],result) 
	end
end
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
