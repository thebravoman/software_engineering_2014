# Petko '3phase' Bozhinov
# JustCrew

require 'csv'
entry_level = Array.new									# Array with results from entry level
task002 = Array.new									# Array with results from task2
task003 = Array.new									# Array with results from task3
task004 = Array.new									# Array with results from task4
task009 = Array.new									# Array with results from task9
task012 = Array.new									# Array with results from task12
repo_loc = ARGV[0] 									# Default location of the repository 
current_element = 0 									# Var used while looping in entry level folder
i = 0 											# Checks the amount of the submitted programs entry level
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
entry_level.sort.each{ |k,v| 
  	print "#{k},"
  	print "#{v}"
  	puts "\n"
}

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
task002.sort.each{ |k,v| 
  	print "#{k},"
  	print "#{v}"
  	puts "\n"
}

current_element = 0

Dir.glob("#{repo_loc}class002_homework/*.rb") do |task3| 
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
task003.sort.each{ |k,v| 
  	print "#{k},"
  	print "#{v}"
  	puts "\n"
}

current_element = 0

Dir.glob("#{repo_loc}class002_homework/*.rb") do |task4| 
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
task004.sort.each{ |k,v| 
  	print "#{k},"
  	print "#{v}"
  	puts "\n"
}
