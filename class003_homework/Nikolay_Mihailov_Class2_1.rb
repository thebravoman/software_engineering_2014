array=Array.new(19,0) 
	Dir.glob(ARGV[0] + "**/*.*") do |my_text_file| 
	s = my_text_file.split(/_/).last num = s.split(/\./).first.to_i 
	array[num] += 1 if num > 0 and num < 19 
	end 
	for i in 2..18
	print "#{i}"
	print "," if i != 18 
	end
	print "\n" 
	for i in 2..18 
	print "#{array[i]}" 
	print "," if i != 18 
	end 
	print"\n"
