array=Array.new(19,0)

Dir.glob("/home/kireto/tues/tp/software_engineering_2014/vhodno_nivo/*/*.*") do |my_text_file|
	s=my_text_file.split(/_/).last.split(/\./).first.to_i
	
	if s >= 1 && s <= 19
		array[s-1] = array[s-1] + 1
	end
	
end

for i in 1..19
	puts "#{i},#{array[i-1]}"
end
