require 'csv'
require_relative "csv_writer_OP.rb"
require_relative "html_writer_OP.rb"
require_relative "xml_writer_OP.rb"
require_relative "json_writer_OP.rb"
#require_relative "svg_writer_OP.rb" batka
students_list = Hash.new
flog = Hash.new
flay = Hash.new

i = 0
CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |team,name|
	if i!=0
		students_list[name] = nil
	end
	i+=1
end
students_list = Hash[students_list.sort_by { |k,v| k }]


def flog(file)
	flog_temp = `flog #{file}`.to_i
	if flog_temp != nil
		return flog_temp
	else
		return -1
	end
end

def flay(file)
	flay_temp = `flay #{file}`
	if flay_temp != nil
		flay_temp = flay_temp.split("\n").first.split('=').last.to_i
		return flay_temp
	else
		return -1
	end
end


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


Dir.glob(ARGV[0]+"/vhodno_nivo/**") do |file| 
	if name_check(file) != 0
		name = name_check(file)
	end

	if students_list.has_key?(name)
		if date_check(file, "Sep", 17, 20) == true	
			students_list[name] = 2
		else
			students_list[name] = 1
		end
	end
end

students_list.each do |key,value|
	if students_list[key].length != 1
		students_list += "#{students_list}"+','+"#{0}"
	end
end


puts students_list
Dir.glob(ARGV[0]+"/class002_homework/*.rb") do |file|
	if name_check(file) != 0
		name = name_check(file)
		#puts name
	end
	if students_list[name] == nil then students_list[name] = "#{0}" end

	if date_check(file, "Sep", 22, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Sep", 22, 20) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

	helper = flog(file)
	if helper != -1 && helper != nil
		flog[name] = "#{helper}"
	end
	helper = flay(file)
	if helper != -1 && helper != nil
		flay[name] = "#{helper}"
	end

end	

#puts flay
#puts flog

Dir.glob(ARGV[0]+"/class003_homework/*.rb").each do |file|
	if name_check(file) != 0
		name = name_check(file)
		#puts name
	end

	if students_list[name] == nil then students_list[name] = "#{0}"+','+"#{0}" end

	if date_check(file, "Sep", 24, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Sep", 24, 20) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

	helper = flog(file)
	if helper != -1 && helper != nil
		flog[name] = "#{flog[name]}"+','+"#{helper}"
	end
	helper = flay(file)
	if helper != -1 && helper != nil
		flay[name] = "#{flay[name]}"+','+"#{helper}"
	end
end

Dir.glob(ARGV[0]+"/class004_homework/**").each do |file|
	if name_check(file) != 0
		name = name_check(file)
		#puts name
		 
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



Dir.glob(ARGV[0]+"/class009_homework/**") do |file|
	name = "#{file.split('/').last.split('.').first}"
	#puts name
	CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |team,student|
		if name == team && name != "require\'teamName\'" && name != "Lazy Slobs"
			if date_check(file,"Oct",27,20) == true
				students_list[student] = "#{students_list[student]}" + ',' + "#{2}"
			elsif date_check(file,"Oct",27,20) == false
				students_list[student] = "#{students_list[student]}" + ',' + "#{1}"
			else
				students_list[student] = "#{students_list[student]}" + ',' + "#{0}"
			end
		end

	end

end

Dir.glob(ARGV[0]+"/class012_homework/*.rb").each do |file|
	if name_check(file) != 0
		name = name_check(file)
		#puts name
	end

	if date_check(file, "Nov", 10, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
		#puts students_list[name]
	elsif date_check(file, "Nov", 10, 20) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

	helper = flog(file)
	if helper != -1 && helper != nil
		flog[name] = "#{flog[name]}"+','+"#{helper}"
	end
	helper = flay(file)
	if helper != -1 && helper != nil
		flay[name] = "#{flay[name]}"+','+"#{helper}"
	end
end		
						
Dir.glob(ARGV[0]+"/class014_homework/**/*_*_*_*.rb") do |file|
	if name_check(file) != 0
		name = name_check(file)
		#puts name
	end

	if date_check(file, "Nov", 13, 6) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Nov", 13, 6) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end

	helper = flog(file)
	if helper != -1 && helper != nil
		flog[name] = "#{flog[name]}"+','+"#{helper}"
	end
	helper = flay(file)
	if helper != -1 && helper != nil
		flay[name] = "#{flay[name]}"+','+"#{helper}"
	end

end				

hash.each do |name,val|
	puts name + ' - ' + val
end

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
	writer.write hash
end