# Petko '3phase' Bozhinov
# JustCrew

require 'csv'
entry_level = Array.new									# Array with results from entry level
task002 = Array.new										# Array with results from task2
task003 = Array.new										# Array with results from task3
task004 = Array.new										# Array with results from task4
task009 = Array.new										# Array with results from task9
task009H= Hash.new{|hash, key| hash[key] = []}			# Array with the real results from task 9
task012 = Array.new										# Array with results from task12
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
	 name = "#{first_name} #{last_name}"
	 entry_level[current_element] = Array.new
	 entry_level[current_element][0] = "#{name}"
	 if i >= 3
	 	log = `git log --until=17.Sep.2014--20:00:00 #{entr_level}`
	 	if log != ""
	 		entry_level[current_element][1] = 2
	 	elsif log == ""
	 		entry_level[current_element][1] = 1
	 	else
	 		entry_level[current_element][1] = 0
	 	end
	 else
	 	entry_level[current_element][1] = 0
	 end
	 current_element += 1
end
# puts "\n \n \n Line change \n \n \n"
# entry_level.sort.each{ |k,v| 
#   	print "#{k},"
#   	print "#{v}"
#   	puts "\n"
# }

current_element = 0

Dir.glob("#{repo_loc}class002_homework/*.rb") do |task2| 
	name = task2.split('/').last.split('_')
	name = "#{name[0]} #{name[1]}"
	log = `git log --until=22.Sep.2014--20:00:00 #{task2}`
	task002[current_element] = Array.new
	task002[current_element][0] = "#{name}"
	if log != ""
 		task002[current_element][1] = 2
 	elsif log == ""
 		task002[current_element][1] = 1
 	else
 		task002[current_element][1] = 0
 	end
 	current_element += 1
end

current_element = 0

Dir.glob("#{repo_loc}class003_homework/*.rb") do |task3| 
	name = task3.split('/').last.split('_')
	name = "#{name[0]} #{name[1]}"
	log = `git log --until=24.Sep.2014--20:00:00 #{task3}`
	task003[current_element] = Array.new
	task003[current_element][0] = "#{name}"
	if log != ""
 		task003[current_element][1] = 2
 	elsif log == ""
 		task003[current_element][1] = 1
 	else
 		task003[current_element][1] = 0
 	end
 	current_element += 1
end

current_element = 0

Dir.glob("#{repo_loc}class004/*.rb") do |task4| 
	name = task4.split('/').last.split('_')
	name = "#{name[0]} #{name[1]}"
	log = `git log --until=29.Sep.2014--20:00:00 #{task4}`
	task004[current_element] = Array.new
	task004[current_element][0] = "#{name}"
	if log != ""
 		task004[current_element][1] = 1
 	elsif log == ""
 		task004[current_element][1] = 2
 	else
 		task004[current_element][1] = 0
 	end
 	current_element += 1
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
puts "#{repo_loc}class009_homework"
Dir.glob("#{repo_loc}class009_homework/*.pdf") do |task9|
	team = task9.split('/').last.split('.').first
	log = `git log --after=27.Oct.2014--20:00:00 #{task9}`	
	if task009H.has_key?("#{team}")
		task009H["#{team}"] = task009H["#{team}"].uniq
		task009H["#{team}"].each do |name|
			task009[current_element] = Array.new
			task009[current_element][0] = "#{name}"
			if log != ""
				task009[current_element][1] = 1
			else
				task009[current_element][1] = 2
			end
		 	current_element += 1
		end
	end
end

current_element = 0

Dir.glob("#{repo_loc}class012_homework/*.rb") do |task12| 
	name = task12.split('/').last.split('.').first.split('_')
	if name[0] =~ /[a-zA-Z]/ and name[1] =~ /[a-zA-Z]/ and name[2] =~ /[A-B]/ and name[3].to_i.to_s == name[3]
		name = "#{name[0]} #{name[1]}"
		log = `git log --until=10.Nov.2014--20:00:00 #{task12}`
		task012[current_element] = Array.new
		task012[current_element][0] = "#{name}"
		if log != ""
	 		task012[current_element][1] = 2
	 	elsif log == ""
	 		task012[current_element][1] = 1
	 	else
	 		task012[current_element][1] = 0
	 	end
	 	current_element += 1
	end
end