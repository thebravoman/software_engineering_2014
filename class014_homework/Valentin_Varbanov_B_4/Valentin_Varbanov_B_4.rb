#require 'csv'
require_relative "csv_writer.rb"
require_relative "html_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
#require_relative "svg_writer.rb" for future updates
students_list = Hash.new

def date_check(url, month, date, time)
	log = `git log #{url}`
	log.split("\n").each do |line|
		if line.include?("Date: ")
			log = line.split(" ")
			#puts log
			if log[2] != month
				return false
			end
			if log[3].to_i <= date
				if log[3].to_i == date
					if log[4].split(':').first.to_i > time
						return false
					end
				end
			else
				return false
			end
		end	
	end
	return true
end

def name_check(file)
	name = file.split('/').last
		if name == "hc.rb" || name =="IvoValchev"
			return 0
		end
	name = name.split('_')
		if name.last.split('.').last == "pdf" || name.last.split('.').last == "txt" 
			return 0
		end
		if name[0] && name[1] != nil
			if name[0].capitalize != name[0] && name[1].capitalize != name[1]
				return 0
			else
				name = name[0] + ' ' + name[1] 
			end
		end

	return name.to_s
end


puts students_list

Dir.glob(ARGV[0]+"/vhodno_nivo/**") do |file| 
	if name_check(file) != 0
		name = name_check(file)
	end
		#puts name

	if date_check(file, "Sep", 17, 20) == true	
		students_list[name] = 2
	else
		students_list[name] = 1
	end
end
i = 0
Dir.glob(ARGV[0]+"/class002_homework/*.rb") do |file|
	if name_check(file) != 0
		name = name_check(file)
	end
	if students_list[name] == nil then students_list[name] = "#{0}" end

	if date_check(file, "Sep", 22, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Sep", 24, 19) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

end	
i = 0
Dir.glob(ARGV[0]+"/class003_homework/*.rb").each do |file|
	if name_check(file) != 0
		name = name_check(file)
	end

	if students_list[name] == nil then students_list[name] = "#{0}"+','+"#{0}" end

	if date_check(file, "Sep", 24, 19) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Sep", 24, 19) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

end

Dir.glob(ARGV[0]+"/class004_homework/**").each do |file|
	if name_check(file) != 0
		name = name_check(file)

		 
	end

	if students_list[name] == nil then students_list[name] = "#{0}"+','+"#{0}"+','+"#{0}" end

	if date_check(file, "Sep", 29, 19) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Sep", 29, 19) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end
end



hash = Hash.new
	CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |team_name,student_name|
		if student_name !="Student Name" && team_name != "Team Name" && team_name != "Lazy Slobs" && team_name != "The_inventors" && team_name != "require\'teamName\'" && team_name != "YellowPatka" && team_name !="Happy_Satan" 
			if hash[team_name] != nil
				hash[team_name] ="#{hash[team_name]}" + '  ' +"#{student_name}"
			else
				hash[team_name] = "#{student_name}"
			end
		end
	end 

	hash1 = Hash.new

	hash.each do |key,value|
		if date_check(ARGV[0]+"/class009_homework/"+ key +".pdf","Oct",27,20) == true
			value.split('  ').each do |value1|
				hash1[value1] = 2
				#puts value1
			end
		else
			value.split('  ').each do |value1|
				hash1[value1] = 1
			end
		end
	end



	students_list.each do |key,value|
		if hash1.has_key?(key)
			students_list[key] = "#{students_list[key]}"+','+"#{hash1[key]}"
		else
			students_list[key] = "#{students_list[key]}"+','+'0'
		end
	end

Dir.glob(ARGV[0]+"/class012_homework/*.rb").each do |file|
	if name_check(file) != 0
		name = name_check(file)
	end

	if students_list[name] == nil then students_list[name] = "#{0}"+','+"#{0}" end

	if date_check(file, "Nov", 10, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Nov", 10, 20) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end
end

#students_list = Hash[students_list.sort_by{|k,v| k}]
## REMOVIN FUKIN NIL ELEMENT :@ :@:@:@
name_array = Array.new
result_array = Array.new
students_list.each do |name,result|
	if name != nil
		name_array.push(name)
		result_array.push(result)
	end
end
#name_array.sort!
## OFICIALLY REMOVED >> cout

hash = Hash.new
for i in 0..name_array.length
	if name_array[i] != nil && result_array[i] != nil
		hash[name_array[i]] = result_array[i]
	end
end
hash = Hash[hash.sort_by{|k,v|k}]

if ARGV[1] == "-o" 
	if ARGV[2] == "csv"
		writer = CSVWriter.new
	elsif ARGV[2] == "xml"
		writer = XMLWriter.new
	elsif ARGV[2] == "html"
		writer = HTMLWriter.new
	elsif ARGV[2] == "json"
		writer = JSONWriter.new
	elsif ARGV[2] == "svg"
	
	end	
	writer.write (hash, "results_Valentin_Varbanov_B_4")
	
end