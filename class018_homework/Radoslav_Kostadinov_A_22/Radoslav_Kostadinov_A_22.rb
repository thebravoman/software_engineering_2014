require 'yaml'
require_relative 'xml_writer.rb'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative "svg_writer.rb"
results = Hash.new
teams = Hash.new
repo = ARGV[0]
start=Time.now
config = YAML.load_file('config.yml')
@counter_009 = 0
@counter_vh = 0
@other_counter = 0
@n = 0

if ARGV[3] == "-n"
 if ARGV[4].is_a? NilClass
 	@n = -1
 else
	@n = ARGV[4].to_i
	abort() if @n == 0
end
end

def reset student_name, results, config_file
		config_file['mainRow'].each do |element|	
			if results[student_name]["#{element}"] == nil
				results[student_name]["#{element}"] = 0
				results[student_name]["#{element}"] = '-' if element.start_with? 'g' or element.start_with? 'y'
			end
		end 
		return results
end

def OnTime path, config, folder
 	log = `git log --until=#{config[folder][1]} #{path}`
 		if log.empty?
 			return 1
 		else 
 			return 2
		 end
end

def flog file, results,student_name, gNum
	flogResult = `flog #{file} -c -q -s`.to_i
	results[student_name][gNum] = flogResult
	return results
end

def flay file,results, student_name , yNum
	flayResult = `flay #{file}`.split("\n").first.scan(/\d+/).first  
	results[student_name][yNum] = flayResult
	return results
end

def checkVH config, repo, results, folder
	Dir.glob("#{repo}" + "#{config[folder][0]}") do |file| 
		@counter_vh += 1
		student_data = file.split("/").last.split('.').first.split('_')
		student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
		if not results.has_key? student_name
			results[student_name] = Hash.new  
			reset(student_name, results, config)
	        end
	        if  OnTime(file, config, folder) == 1
	        	results[student_name][folder] =1
	        elsif OnTime(file, config, folder) == 2
	        		results[student_name][folder] =2
		end
		break if @counter_vh == @n    
	end
	return results
end

def check009  config, repo, teams, results, folder
	content = File.read("#{repo}" + "#{config[folder][2]}")
	content.split("\n").each do |line|
		teams[line.split(",").first] = Array.new if not teams.has_key? line.split(",").first
		teams[line.split(",").first] << line.split(",").last
	end
	Dir.glob("#{repo}" + "#{config[folder][0]}") do |file| 
		@counter_009 += 1 
		team_name = file.split("/").last.split(".").first
		if teams.has_key? team_name
			teams[team_name].each do |student|	
					if  not results.has_key? student
						results[student] = Hash.new  
						reset(student, results, config)
	 				end 
					results[student][folder] = 0
					results[student][folder] = OnTime(file, config, folder) if student != nil
			end
		end	
		break if @counter_009 == @n
	end
	return results
end

def checkOthers config, repo, results, hwNum
	Dir.glob("#{repo}" + "#{config[hwNum][0]}") do |file|
		@other_counter += 1
	 student_data = file.split("/").last.split('.').first.split('_')
	 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
	 	if not results.has_key? student_name
	 		results[student_name] = Hash.new  
	 		reset(student_name, results, config)
		 end  
		if results[student_name][hwNum] == nil
			results[student_name][hwNum] = 0	
		end
	 	if OnTime(file, config, hwNum) == 2
	 		results[student_name][hwNum] = 2
	 	else 
	 		results[student_name][hwNum]= 1
	 	end
		flog(file,results, student_name, "g#{hwNum.tr("0", "")}")
 		flay(file, results, student_name,"y#{hwNum.tr("0", "")}")
 		break if @other_counter == @n  
	end
	@other_counter = 0
	return results
end

checkVH(config, repo, results, "VH")
check009(config, repo, teams, results, "009")
config["folders"].each do |folder|
	checkOthers(config, repo, results, folder)
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
		writer.write(results,Time.now - start)
end