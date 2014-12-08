# require_relative "csv_whateverator.rb"
# require_relative "xml_whateverator.rb"
# require_relative "json_whateverator.rb"
require_relative "html_ima-li-smisal-ot-tova.rb"
require 'yaml'
require 'csv'
classes = " "," ","VH","002","003","004","009","012","014","017","Flog002","Flay002","Flog003","Flay003","Flog004","Flay004","Flog012","Flay012","Flog014","Flay014","Flog017","Flay017"


result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0,0,0,0,'-','-','-','-','-','-','-','-','-','-','-','-']}
fnfs = Hash.new{|flog, flay|}
folder = 0
team_names = Array.new
settings = YAML.load_file('setting.yml')


def dir_browse(homework_folder,log_date,result,folder)
Dir.glob(ARGV[0]+"#{homework_folder}").each do |file|
		short_file = file.split(/\//).last
		file_folder = file.chomp("#{file.split(/\//).last}")
		if(short_file) != 'run_them_all.rb'
			if short_file.include? ("_")
				first_name = short_file.split(/_/).first.capitalize
				last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
				name = first_name + ',' + last_name
				log = `git log --until=#{log_date} #{file}`
				result[name][folder] = 2 if !log.empty?
				result[name][folder] = 1 if log.empty?
				if homework_folder != "vhodno_nivo/**/*.*" && homework_folder != "class009_homework/*.pdf"
					flog = 'flog #{short_file}'.to_i
					flay = 'flay #{short_file}'.to_i
					result[name][folder+8] = flog
					result[name][folder+9] = flay
				end
			end
		end
	end
	return result
end

def homework_check_009 (homework_folder,log_date,result,folder)
	team_names = CSV.read(ARGV[0]+"class009_homework/project_to_names.csv")[1, 53]
	Dir.glob(ARGV[0]+"class009_homework/*.pdf").each do |file|	
		name = file.split(/\//).last.split(".").first
		i = 0
		z = 0
		line = 0
		first_line = false
		for z in 0..51
		 	if team_names[z][0] == name 			
				line = z if first_line != true
				first_line = true
				i +=1		
			end		
		end


		log = `git log --until=Oct--27--2014--20:00:00 #{file}`

		if !log.empty?
			for index in 0..i-1 
				final_name = team_names[line + index][1]
				final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
				result[final_name][folder] = 2
			end
		elsif log.empty?
			for index in 0..i-1
				final_name = team_names[line + index][1]
				final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
				result[final_name][folder] = 1
			end
		end
		
	end
	return result
end

settings.each do |homework, prefs|
	if prefs[0] != "class009_homework/*.pdf"
		result = dir_browse(prefs[0],prefs[1],result,folder)
	next if prefs[0] == "class009_homework/*.pdf"
		result = homework_check_009(prefs[0],prefs[1],result,folder)
	end
	folder+=1
end

# settings.each do |homework, prefs|
# 	fnfs = fnf(prefs[0],fnfs)
# end



case ARGV[2]
when "xml"
	writer = XMLWriter.new
	writer.write result
when "csv"
	writer = CSVWriter.new
	writer.write(result, classes)
when "json"
	writer = JSONWriter.new
	writer.write result
when "html"
	writer = HTMLWriter.new
	writer.write(result, classes)
end