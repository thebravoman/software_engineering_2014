require 'csv'

#require_relative "svg_writer_OP.rb" batka
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
	name = file.split('/').last.split('_')
	if name.count != 3
		return 0 
	end
	if name[0].capitalize == name[0] && name[1].capitalize == name[1]
		name = name[0] + " " + name[1]
		return name
	else
		return 0
	end
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


Dir.glob(ARGV[0]+"/class009_homework/**") do |file|
	name = file.split('/').last.split('.').first
	
	CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |team,student|
		if name == team 
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
	end

	if date_check(file, "Nov", 10, 20) == true	
		students_list[name] = "#{students_list[name]}"+','+'2'
	elsif date_check(file, "Nov", 10, 20) == false
		students_list[name] = "#{students_list[name]}"+','+'1'
	else
		students_list[name] = "#{students_list[name]}"+','+'0'
	end
end

puts students_list.count 

#students_list = Hash[students_list.sort_by{|k,v| k}]
#hash = Hash[hash.sort_by{|k,v|k}]

