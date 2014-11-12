require_relative  "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "csv"

classes = " "," ","VH","002","003","004","009","012"

result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0,0]}
result_sorted = Hash.new
folder = 0
content=Array.new
name_array = Array.new
team_names = Array.new

Dir.glob(ARGV[0]+"/vhodno_nivo/**/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.scan("_").length == 2
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--17--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end

	end
end

folder +=1
Dir.glob(ARGV[0]+"/class002_homework/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--22--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
Dir.glob(ARGV[0]+"/class003_homework/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--24--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
Dir.glob(ARGV[0]+"class004/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Sep--29--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

folder +=1
team_names = CSV.read("../../class009_homework/project_to_names.csv")[1, 55]
Dir.glob(ARGV[0]+"class009_homework//*.pdf").each do |file|	
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

folder +=1
Dir.glob(ARGV[0]+"class012_homework/*.rb*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? ("_")
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=Nov--10--2014--20:00:00 #{file}`
		if !log.empty?
			result[name][folder] = 2
		elsif log.empty?
			result[name][folder] = 1
		end
	end
end

write = false
if ARGV[1] == "-o"
	case ARGV[2]
	when "csv"
	write = true
	writer = CSVWriter.new
	when "xml"
	write = true	
	writer = XMLWriter.new
	when "json"
	write = true
	writer = JSONWriter.new
	when "html"
	write = true
	writer = HTMLWriter.new
	when "svg"
	puts "Sorry :("
	#write = true
	#writer = SVGWriter.new
	else
	puts "You are drunk"
	end
	
	writer.write(result,classes) if write == true
end
