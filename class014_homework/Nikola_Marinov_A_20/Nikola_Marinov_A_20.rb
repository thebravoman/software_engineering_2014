require 'csv'
require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'

count = 0
error = 0
results = Hash.new

entry_level = Array.new									# Array with results from entry level
task002 = Array.new										# Array with results from task2
task003 = Array.new										# Array with results from task3
task004 = Array.new										# Array with results from task4
task009 = Array.new										# Array with results from task9
task009H= Hash.new{|hash, key| hash[key] = []}			# Array with the real results from task 9
task012 = Array.new										# Array with results from task12
grades  = Hash.new{|hash, key| hash[key] = []}			# Final grades
repo_loc = ARGV[0] 										# Default location of the repository 
current_element = 0 									# Var used while looping in entry level folder
i = 0 													# Checks the amount of the submitted programs entry level
c = 0
results = Hash.new			

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
Dir.glob("#{repo_loc}class002_homework/*.rb") do |task2| 
	name = task2.split('/').last.split('_')
	name = "#{name[0].capitalize} #{name[1].capitalize}"
	log = `git log --until=22.Sep.2014--20:00:00 #{task2}`
	if log != ""
 		grades["#{name}"][1] = 2
 	elsif log == ""
 		grades["#{name}"][1] = 1
 	else
 		grades["#{name}"][1] = 0
 	end
end
Dir.glob("#{repo_loc}class003_homework/*.rb") do |task3| 
	name = task3.split('/').last.split('_')
	name = "#{name[0].capitalize} #{name[1].capitalize}"
	log = `git log --until=24.Sep.2014--20:00:00 #{task3}`
	if log != ""
 		grades["#{name}"][2] = 2
 	elsif log == ""
 		grades["#{name}"][2] = 1
 	else
 		grades["#{name}"][2] = 0
 	end
end
Dir.glob("#{repo_loc}class004/*.rb") do |task4| 
	name = task4.split('/').last.split('_')
	name = "#{name[0].capitalize} #{name[1].capitalize}"
	log = `git log --until=29.Sep.2014--20:00:00 #{task4}`
	if log != ""
 		grades["#{name}"][3] = 1
 	elsif log == ""
 		grades["#{name}"][3] = 2
 	else
 		grades["#{name}"][3] = 0
 	end
end

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
current_element = 0
Dir.glob("#{repo_loc}class012_homework/*.rb") do |task12| 
	name = task12.split('/').last.split('.').first.split('_')
	if name[0] =~ /[a-zA-Z]/ and name[1] =~ /[a-zA-Z]/ and name[2] =~ /[A-B]/ and name[3].to_i.to_s == name[3]
		name = "#{name[0].capitalize} #{name[1].capitalize}"
		log = `git log --until=10.Nov.2014--20:00:00 #{task12}`
		if log != ""
	 		grades["#{name}"][5] = 2
	 	elsif log == ""
	 		grades["#{name}"][5] = 1
	 	else
	 		grades["#{name}"][5] = 0
	 	end
	end
end
grades.keys.sort.each do |key|
	if grades[key][0] == nil
		grades[key][0] = 0
	end
	if grades[key][1] == nil
		grades[key][1] = 0
	end
	if grades[key][2] == nil
		grades[key][2] = 0
	end
	if grades[key][3] == nil
		grades[key][3] = 0
	end
	if grades[key][4] == nil
		grades[key][4] = 0
	end
	if grades[key][5] == nil
		grades[key][5] = 0
	end
end

# puts results
switcher = ARGV[2]
if ARGV[1] == "-o"
	bitchAssLoop = case switcher
		when "csv" 
			writer = CSVWriter.new
			writer.write grades
		when "xml"
			writer = XMLWriter.new
			writer.write grades
		when "json"
			writer = JSONWriter.new
			writer.write grades
		when "html"
			writer = HTMLWriter.new
			writer.write grades
		when "svg"
			writer = SVGWriter.new
			writer.write grades
		else puts "Please, pass csv or xml or json or html or svg as a third argument."
	end
end