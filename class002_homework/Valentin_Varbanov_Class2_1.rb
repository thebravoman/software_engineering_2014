homeworks = Array.new(19,0)

Dir.glob("/home/valentin/GitHub/software_engineering_2014/vhodno_nivo/*/*.*") do |my_text_file|
	#puts "working on: #{my_text_file}..."

	s = my_text_file.split(/_/)
	number = s.last.split(/\./).first


	if number.to_i >= 1 and number.to_i <= 19
		homeworks[number.to_i - 1] += 1				
	end
	

end

for i in 0..18
	puts "#{i+1},#{homeworks[i]}"
end
