array = Array.new(20,0)

Dir.glob("/home/vortelf/vhodno_nivo/**/*.*") do |my_text_file|

	##puts "#{my_text_file}"
	
	s = my_text_file.split('_').last.split('.').first.to_i
	##puts s
	
	for i in 1..19
		if s == i
			array[i] += 1
		end
	end
end

for i in 1..19
	puts "#{i}, #{array[i]}"
end
