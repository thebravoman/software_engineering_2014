def write_to_SVG(results,time,name)
	text_x = 0; k = 0; rect_x = 0;
	classes = "VH","002","003","004","009","012","014","015","017-1","017-2"
	class_array = Array.new(classes.length,0)
	results.each do |key|
		i = 0
		key[1].each do |r_key|
			if r_key.to_i == 1
				class_array[0] += 1 if i == 0
				class_array[1] += 1 if i == 1
				class_array[2] += 1 if i == 2
				class_array[3] += 1 if i == 3
				class_array[4] += 1 if i == 4
				class_array[5] += 1 if i == 5
				class_array[6] += 1 if i == 6
				class_array[7] += 1 if i == 7
				class_array[8] += 1 if i == 8
				class_array[9] += 1 if i == 9
			end
			i += 1
		end
	end
	File.open("#{name}.svg","w") do |file|
		file.puts "<svg id=\"graph\" xmlns=\"http://www.w3.org/2000/svg\">"
		classes.each do |hw|
			file.puts "\t<text x=\"#{text_x-k}\" font-size=\"10\" y=\"14\">#{hw} - #{class_array[k]}</text>"
			text_x += 60
			k += 1
		end	
		for i in 0..class_array.length
			file.puts "\t<rect width=\"50\" height=\"#{class_array[i]}\" x=\"#{rect_x}\" y=\"18\"></rect>"
			rect_x += 55
		end
		file.puts "</svg>"
	end
end
