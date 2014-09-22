information = Hash.new{|hash, key| arr[key] = Array.new}
i = 1

Dir.glob("D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/*") do |item|
  
	  #puts "working on: #{item}... \n"
	  short_name = item.split('/').last.split('D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/')
	  short_name = short_name.last.split('.').first.split('_')
	  name = short_name[0] + " "
	  if short_name[1]==nil || short_name[2] == nil
		  	next
	  end
	  name = name + short_name[1] + " "
	  number = short_name[2]
	  Dir.glob("D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/#{short_name[0]}_#{short_name[1]}_#{number}/*.*") do |my_text_file|
	  	task = my_text_file.split('/').last.split('D:/Git/RubyHw1/hwc.rb/checks/vhodno_nivo/').last.split('.').first.split('_')
		task = task[2]
		if task != nil
			if information["#{short_name[0]} #{short_name[1]}"] != nil		
				task = task.split('Task').last
				information = {"#{short_name[0]} #{short_name[1]}" => arr[]}
				arr.push("#{task}")
				i += 1
			else
				i = 1;
				task = task.split('Task').last
				information = {"#{short_name[0]} #{short_name[1]}" => arr[]}
				arr.push("#{task}")	
				i += 1
			end
		end 
	  end 

	  #information.each do |key, value|
	  #	puts "Name: " + key
	  #	puts "Task: " + value + ";\n\n"
	  #end

	  #information.each{ |key,value| puts "Name: #{key} #{value}\n" }

	  information.each do |key, value|
		  puts key
		  value.each do |k,v|
		    puts v
		  end
	  end

	  # output fail

end