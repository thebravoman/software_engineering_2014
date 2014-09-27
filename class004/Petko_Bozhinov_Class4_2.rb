# Class 4 - 11. grade, ELSYS 2014/2015
# Petko '3phase' Bozhinov
# Task 3

information = Hash.new{|hsh,key| hsh[key] = []}
sum = Hash.new{}
points = 0
path_to_folder = ''
ARGV.each do|v| 
  path_to_folder = v
end
Dir.glob(path_to_folder + "/**/*") do |my_text_file| 
  #puts path_to_folder
  short_name = my_text_file.split('/').last.split(path_to_folder)
  short_name = short_name.last.split('.').first.split("_")
  task = short_name[2].to_i
  if !task || !short_name[1] || task < 2 || task > 18
  	next
  else
	  if !sum["#{short_name[0]} #{short_name[1]}"]
	  	points = 0
	  end
	  information["#{short_name[0]} #{short_name[1]}"].push("#{task}")
	  points += task.to_i
	  sum["#{short_name[0]} #{short_name[1]}"] = points
  end
end
  
  information.each{ |k,v| 
  	print "#{k}," 
  	v.each{ |key,value| 
  		print "#{key},"
  	}
  	print sum["#{k}"]
  	puts "\n"
  }
