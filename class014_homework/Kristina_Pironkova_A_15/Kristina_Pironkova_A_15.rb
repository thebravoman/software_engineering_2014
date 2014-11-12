require 'csv'
require_relative 'xml_writer.rb'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative "svg_writer.rb"
results = Hash.new
teams = Hash.new
mainRow = ["FirstName","LastName","VH","002","003","004","012"]
repo = ARGV[0]

	def check(student_name, results)
		if results[student_name]["012"] == nil
			results[student_name]["012"] = 0	
		end
		
		if results[student_name]["004"] == nil
			results[student_name]["004"] = 0	
		end

		if results[student_name]["009"] == nil
			results[student_name]["009"] = 0	
		end
		
		if results[student_name]["VH"] == nil
			results[student_name]["VH"] = 0	
		end
		
		if results[student_name]["003"] == nil
			results[student_name]["003"] = 0	
		end
		
		if results[student_name]["002"] == nil
			results[student_name]["002"] = 0	
		end
	end

	def OnTime(path, deadline)
	 	log = `git log --until=#{deadline} #{path}`
	 if log.empty?
	 	return 1
	 else 
	 	return 2
	 end
	end

Dir.glob("#{repo}/vhodno_nivo/**/*_*_*.*").each do |file| 

	student_program=file.split("/").last
	student_data = file.split("/").last.split('.').first.split('_')
	student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"

	if  not results.has_key? student_name
		results[student_name] = Hash.new  
		results[student_name]["VH"] = 0 
		results[student_name]["002"] = 0 
		results[student_name]["003"] = 0 
		results[student_name]["004"] = 0 
		results[student_name]["009"] = 0
		results[student_name]["012"] = 0   
	end
	
	if results[student_name]["VH"] != nil && OnTime(file, "17.09.2014:20:00:00") == 2
		results[student_name]["VH"] += 1 
	else
		results[student_name]["VH"] += 101
	end 

end

results.keys.each do |student_name|
	if results[student_name]["VH"] % 100 >= 3
		if results[student_name]["VH"] > 100
			results[student_name]["VH"] = 1
		else
			results[student_name]["VH"] = 2
		end
	else
		results[student_name]["VH"] = 0
	end
end


content = File.read("#{repo}/class009_homework/project_to_names.csv")
content.split("\n").each do |line|
	teams[line.split(",").first] = Array.new if not teams.has_key? line.split(",").first
	teams[line.split(",").first] << line.split(",").last
end

Dir.glob("#{repo}/class009_homework/**/*.pdf") do |file|  

	team_name = file.split("/").last.split(".").first
	if teams.has_key? team_name
		teams[team_name].each do |student|	
				if  not results.has_key? student
					results[student] = Hash.new  
					results[student]["009"] = 0  
				end
check(student, results)
				results[student]["009"] = 0
				results[student]["009"] = OnTime(file, "27.10.2014:20:00:00") if student != nil

		end
	end	
end


Dir.glob("#{repo}/class002_homework/*_*_*_*.rb") do |file|
 student_program=file.split("/").last
 student_data = file.split("/").last.split('.').first.split('_')
 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
 
 if not results.has_key? student_name
 	results[student_name] = Hash.new  
 	results[student_name]["002"] = 0  
 end
	if results[student_name]["002"] == nil
		
		results[student_name]["002"] = 0	
	end
 if OnTime(file, "22.09.2014:20:00:00") == 2
 	results[student_name]["002"] = 2
 else 
 	results[student_name]["002"]= 1
 end
end

Dir.glob("#{repo}/class003_homework/*_*_*_*.rb") do |file|
 student_program=file.split("/").last
 student_data = file.split("/").last.split('.').first.split('_')
 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
 
 if not results.has_key? student_name
 	results[student_name] = Hash.new  
 	results[student_name]["003"] = 0  
 end
	check(student_name, results)
 if OnTime(file, "24.09.2014:20:00:00") == 2
 	results[student_name]["003"] = 2
 else 
 	results[student_name]["003"]= 1
 end
end

Dir.glob("#{repo}/class004/*_*_*_*.rb") do |file|
 student_program=file.split("/").last
 student_data = file.split("/").last.split('.').first.split('_')
 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
 
 if not results.has_key? student_name
 	results[student_name] = Hash.new  
 	results[student_name]["004"] = 0  
 end
check(student_name, results)
 if OnTime(file, "29.09.2014:20:00:00") == 2
 	results[student_name]["004"] = 2
 else 
 	results[student_name]["004"]= 1
 end
end
 
Dir.glob("#{repo}/class004_homework/*") do |file|
 student_program=file.split("/").last
 student_data = file.split("/").last.split('.').first.split('_')
 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
 
 if not results.has_key? student_name
 	results[student_name] = Hash.new  
 	results[student_name]["004"] = 0  
 end
	check(student_name, results)
 if OnTime(file, "29.09.2014:20:00:00") == 2
 	results[student_name]["004"] = 2
 else 
 	results[student_name]["004"]= 1
 end
end
 

Dir.glob("#{repo}/class012_homework/*_*_*_*.rb") do |file|
 student_program=file.split("/").last
 student_data = file.split("/").last.split('.').first.split('_')
 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
 
 if not results.has_key? student_name
 	results[student_name] = Hash.new  
 	results[student_name]["012"] = 0  
 end
check(student_name, results)
 if OnTime(file, "10.11.2014:20:00:00") == 2
 	results[student_name]["012"] = 2
 else 
 	results[student_name]["012"]= 1
 end
end

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
			abort ("Wrong format argument!") 
		end
			writer.write(results)
	end
