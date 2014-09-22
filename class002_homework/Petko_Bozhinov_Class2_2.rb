# Class 2 Homework - 11. grade, ELSYS 2014/2015
# Petko '3phase' Bozhinov
# Task 2

information = Hash.new{|hsh,key| hsh[key] = []}
sum = Hash.new{}
points = 0

Dir.glob("D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/*/*") do |my_text_file| 
  short_name = my_text_file.split('/').last.split('D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/')
  short_name = short_name.last.split('.').first.split("_")
  task = short_name[2]
  if task
  	task = task.split('Task').last.to_i
  else
  	next
  end
  if !sum["#{short_name[0]} #{short_name[1]}"]
  	points = 0
  end
  information["#{short_name[0]} #{short_name[1]}"].push("#{task}")
  points += task.to_i
  sum["#{short_name[0]} #{short_name[1]}"] = points
end
  
  information.each{ |k,v| 
  	puts "#{k}" 
  	v.each{ |key,value| 
  		puts "#{key}"
  	}
  	puts "The sum of the points of the submited homeworks is: " 
  	puts sum["#{k}"]
  }
