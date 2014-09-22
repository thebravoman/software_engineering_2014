arry = Array.new(19,0)
i = 0
c = 0

Dir.glob("/home/ds/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|

	s = my_text_file.split(/_/)
	i = s.last.split(/\./).first.to_i

	
	if i > 0 and i < 19
		arry[i-1] += 1
end
	end
	for c in 1..17
		puts "#{c+1},#{arry[c]}"
	end
