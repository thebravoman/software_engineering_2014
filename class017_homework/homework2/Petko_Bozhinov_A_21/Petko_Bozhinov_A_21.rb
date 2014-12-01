# Petko '3phase' Bozhinov
# JustCrew

start_time = Time.now

require 'csv'
require "./csv_writer.rb"
require "./xml_writer.rb"
require "./json_writer.rb"
require "./html_writer.rb"
require "./svg_writer.rb"

results 	= Hash.new
entry_level = Array.new										# Array with results from entry level
task009H	= Hash.new{|hash, key| hash[key] = []}			# Array with the real results from task 9
task012 	= Array.new										# Array with results from task12
grades  	= Hash.new{|hash, key| hash[key] = []}			# Final grades
repo_loc 	= ARGV[0] 										# Default location of the repository 
current_element = 0 										# Var used while looping in entry level folder
results 	= Hash.new										#
i 	= 0 													# Checks the amount of the submitted programs entry level
count = 0
error = 0
c = 0

def check_homeworks grades, location, time, array_index, additional_index
	Dir.glob("#{ARGV[0]}#{location}**/*_*_*_*.rb") do |task| 
		name_format = task.split('/').last
		name = task.split('/').last.split('_')
		name = "#{name[0].capitalize} #{name[1].capitalize}"
		log = `git log --until=#{time} #{task}`

		flog = `flog #{task}`
		if flog != ""
			flog = flog.split(':').first
			if flog
				grades["#{name}"][additional_index] = flog
			end
		end

		if array_index == 6 or array_index == 8
			splitted_task = task.split('/')
			check = task.split('/').last.split('_').last.split('.').first
			if check.to_i.to_s == check
				flay = `flay #{ARGV[0]}#{location}/*.rb | grep #{name_format.split('_').first} | wc -l`
			else
			end
		else
			flay = `flay #{ARGV[0]}#{location}*.rb | grep #{name_format.split('_').first} | wc -l`
		end

		if flay.to_i != ""
			grades["#{name}"][additional_index+7] = flay
		end

		
		if log != ""
	 		grades["#{name}"][array_index] = 2
	 	elsif log == ""
	 		grades["#{name}"][array_index] = 1
	 	else
	 		grades["#{name}"][array_index] = 0
	 	end
	end
end	

def check_if_not_null grades, key 
	for counter in 0..8
		if grades[key][counter] == nil
			grades[key][counter] = 0
		end
	end
end

Dir.glob("#{repo_loc}vhodno_nivo/*/") do |entr_level| 
	 i = 0
	 Dir.glob("#{entr_level}/*.*") do |file|
		  i += 1
	 end
	 first_name = entr_level.split('/').last.split('_')[0]
	 last_name = entr_level.split('/').last.split('_')[1]
	 if first_name and last_name
	 	first_name = first_name.capitalize
	 	last_name = last_name.capitalize
	 end
	 name = "#{first_name} #{last_name}"
	 entry_level[current_element] = Array.new
	 entry_level[current_element][0] = "#{name}"
	 if i >= 3
	 	log = `git log --until=17.Sep.2014--20:00:00 #{entr_level}`
	 	if log != ""
	 		grades["#{name}"][0] = 2
	 	elsif log == ""
	 		grades["#{name}"][0] = 1
	 	else
	 		grades["#{name}"][0] = 0
	 	end
	 else
	 end
end

check_homeworks grades, "class002_homework/", "22.Sep.2014--20:00:00", 1, 9
check_homeworks grades, "class003_homework/", "24.Sep.2014--20:00:00", 2, 10
check_homeworks grades, "class004/", "29.Sep.2014--20:00:00", 3, 11
check_homeworks grades, "class012_homework/", "10.Nov.2014--20:00:00", 5, 12
check_homeworks grades, "class014_homework/*/", "13.Nov.2014--06:00:00", 6, 13
check_homeworks grades, "class017_homework/homework1/", "02.Dec.2014--06:00:00", 7, 14
check_homeworks grades, "class017_homework/homework2/*/", "02.Dec.2014--06:00:00", 8, 15


expected_file = "#{repo_loc}class009_homework/project_to_names.csv"
if File.exists?(expected_file) 
	file_content = File.read(expected_file)
	file_content = file_content.gsub(/\n/,";")
	file_content = file_content.split(";")
	file_content.each do |element|
		task009H["#{element.split(',').first}"].insert(-1, element.split(',').last)
	end
end

current_element = 0
Dir.glob("#{repo_loc}class009_homework/*.pdf") do |task9|
	team = task9.split('/').last.split('.').first
	task9 = task9.gsub("'", "")
	log = `git log --after=27.Oct.2014--20:00:00 #{task9}`	
	if task009H.has_key?("#{team}")
		task009H["#{team}"] = task009H["#{team}"].uniq
		task009H["#{team}"].each do |name|
			name = name.split(' ')
			name = "#{name[0].capitalize} #{name[1].capitalize}"
			if log != ""
				grades["#{name}"][4] = 1
			else
				grades["#{name}"][4] =  2
			end
		 	current_element += 1
		end
	end
end

grades.keys.sort.each do |key|
	check_if_not_null grades, key
end

running_time = Time.now - start_time

if ARGV[1] == "-o"
	switcher = ARGV[2]
	bitchAssLoop = case switcher
		when "csv" 
			writer = CSVWriter.new
			writer.write grades, running_time
		when "xml"
			writer = XMLWriter.new
			writer.write grades, running_time
		when "json"
			writer = JSONWriter.new
			writer.write grades, running_time
		when "html"
			writer = HTMLWriter.new
			writer.write grades, running_time
		when "svg"
			writer = SVGDrawer.new
			writer.write grades, running_time
		else puts "Please, pass one of the following values as third argument: \n  - csv\n  - xml\n  - json\n  - html\n  - svg"
	end
end