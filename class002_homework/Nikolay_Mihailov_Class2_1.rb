array=Array.new(19,0) 
	Dir.glob("/home/nikolas/Documents/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file| 
	s = my_text_file.split(/_/).last num = s.split(/\./).first.to_i 
	puts num array[num] += 1 if num > 0 and num < 19 
	end
	puts array
