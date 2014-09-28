# Class 4 - 11. grade, ELSYS 2014/2015
# Petko '3phase' Bozhinov
# Task 4

tasks = ["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
information = Hash.new{|hsh,key| hsh[key] = []}
sortedHash = Hash.new{|hsh1 ,key1| hsh1[key1] = []}
sum = Hash.new{}
points = 0
path_to_folder = ''
ARGV.each do|v| 
  path_to_folder = v
end
Dir.glob(path_to_folder + "/**/*") do |my_text_file| 
  extension = false
  short_name = my_text_file.split('/').last.split(path_to_folder)
  if "#{short_name}".include? "."
    extension = true
  end 
  short_name = short_name.last.split('.')
  short_name = short_name.first.split("_")
  task = short_name[2].to_i
  if task == '' || short_name[0] == '' || short_name[1] == ''
    next
  else
    if tasks.include? "#{task}"
      if extension == true
        short_name[0] = short_name[0].capitalize
        short_name[1] = short_name[1].capitalize
        task = task.to_i
    	  if !sum["#{short_name[0]} #{short_name[1]}"]
    	  	points = 0
    	  end
    	  information["#{short_name[0]} #{short_name[1]}"] << task
    	  points += task.to_i
    	  sum["#{short_name[0]} #{short_name[1]}"] = points
      end
    end
  end
end
  sortedHash = information.sort
  sortedHash.sort.each{ |k,v| 
  	print "#{k}," 
  	v.sort.each{ |key| 
      print "#{key},"
  	}
  	print sum["#{k}"]
  	puts "\n"
  }
