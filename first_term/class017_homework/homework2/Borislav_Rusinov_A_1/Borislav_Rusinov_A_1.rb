require_relative 'xml_writer.rb'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative "svg_writer.rb"
results = Hash.new
teams = Hash.new
repo = ARGV[0]
start=Time.now
$mainRow = ["VH","002","003","004","009","012","014","0171","0172","g2","g3","g4","g9","g12","g14","g171","g172","y2","y3","y4","y9","y12","y14","y171","y172"]
	def reset(student_name, results, mainRow)
 		mainRow.each do |element|	
 			if results[student_name]["#{element}"] == nil
 				results[student_name]["#{element}"] = 0 
 			end
 		end 
 		return results
	end

	def OnTime(path, deadline)
	 	log = `git log --until=#{deadline} #{path}`
	 		if log.empty?
	 			return 1
	 		else 
	 			return 2
			 end
	end
	
	def flog file, results,student_name, gNum
		flogResult = `flog #{file} -c -q -s`.split(":").first
		results[student_name][gNum] = flogResult
		return results
	end

	def flay file,results, student_name , yNum
		flayResult = `flay #{file}`.split("\n").first.scan(/\d+/).first
		results[student_name][yNum] = flayResult
		return results
	end

	def checkVH repo, results
		Dir.glob("#{repo}/vhodno_nivo/**/*_*_*.*").each do |file| 
			student_data = file.split("/").last.split('.').first.split('_')
			student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
			if  not results.has_key? student_name
				results[student_name] = Hash.new  
				reset(student_name, results, $mainRow)
 	        end
 	        if  OnTime(file, "17.09.2014:20:00:00") == 1
 	        	results[student_name]["VH"]=1
 	        elsif  OnTime(file, "17.09.2014:20:00:00") == 2
 	        		results[student_name]["VH"]=2
			end	    
		end
		return results
	end

	def check009  repo, teams, results
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
							reset(student, results, $mainRow)
		 				end 
						results[student]["009"] = 0
						results[student]["009"] = OnTime(file, "27.10.2014:20:00:00") if student != nil
				end
			end	
		end
		return results
	end

	def checkOthers repo, results, hwNum, deadline
		if hwNum == "004"
			path = "#{repo}/class#{hwNum}/*_*_*_*.rb"
		else 
			path = "#{repo}/class#{hwNum}_homework/**/*_*_*_*.rb"
		end
		if hwNum == "0171"
			path = "#{repo}/class017_homework/homework1/**/*_*_*_*.rb"
		end
		if hwNum == "0172"
			path = "#{repo}/class017_homework/homework2/**/*_*_*_*.rb"
		end

	
		Dir.glob(path) do |file|
		 student_data = file.split("/").last.split('.').first.split('_')
		 student_name = "#{student_data[0].capitalize} #{student_data[1].capitalize}"
		 	if not results.has_key? student_name
		 		results[student_name] = Hash.new  
		 		reset(student_name, results, $mainRow)
			 end  
			if results[student_name][hwNum] == nil
				results[student_name][hwNum] = 0	
			end
		 	if OnTime(file, deadline) == 2
		 		results[student_name][hwNum] = 2
		 	else 
		 		results[student_name][hwNum]= 1
		 	end
				flog(file,results, student_name, "g#{hwNum.to_i.to_s}")
	 			flay(file, results, student_name,"y#{hwNum.to_i.to_s}")
		end
		return results
	end

		Dir.glob("#{repo}/*") do |path|
			case path.split("/").last 
				when 'vhodno_nivo'
					checkVH(repo, results)
				when 'class002_homework'
					checkOthers(repo, results, '002', '22.09.2014:20:00:00')
				when 'class003_homework'
					checkOthers(repo, results, '003', '24.09.2014:20:00:00')
				when 'class004'
					checkOthers(repo, results, '004', '29.09.2014:20:00:00')
				when 'class009_homework'
					check009(repo, teams, results)
				when 'class012_homework'
					checkOthers(repo, results, '012', '10.11.2014:20:00:00')
				when 'class014_homework'
					checkOthers(repo, results, '014', '13.11.2014:06:00:00')
				when 'class017_homework'
					checkOthers(repo, results, '0171', '02.12.2014:06:00:00')
					checkOthers(repo, results, '0172', '02.12.2014:06:00:00')
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
			writer.write(results,Time.now - start)
	end
