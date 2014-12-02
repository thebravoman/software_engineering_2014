def write_to_SVG(results,time)
	text_x = 0; k = 0; rect_x = 0;
	class_array = Array.new(7,0)
	classes = "VH","002","003","004","009","012","014","017"
	results.each do |key|
		i = 0
		key[1].each do |r_key|
			class_array[0] += 1 if i == 0 && r_key.to_i == 1
			class_array[1] += 1 if i == 1 && r_key.to_i == 1
			class_array[2] += 1 if i == 2 && r_key.to_i == 1
			class_array[3] += 1 if i == 3 && r_key.to_i == 1
			class_array[4] += 1 if i == 4 && r_key.to_i == 1
			class_array[5] += 1 if i == 5 && r_key.to_i == 1
			class_array[6] += 1 if i == 6 && r_key.to_i == 1
			class_array[7] += 1 if i == 7 && r_key.to_i == 1
			i += 1
		end
	end
	File.open("results_Kaloyan_Nikov_B_19.svg","w") do |file|
		file.puts "<svg id=\"graph\" xmlns=\"http://www.w3.org/2000/svg\">"
		classes.each do |hw|
			file.puts "\t<text x=\"#{text_x-k}\" font-size=\"10\" y=\"14\">#{hw} - #{class_array[k]}</text>"
			text_x += 60
			k += 1
		end	
		for i in 0..7
			file.puts "\t<rect width=\"50\" height=\"#{class_array[i]}\" x=\"#{rect_x}\" y=\"18\"></rect>"
			rect_x += 55
		end
		file.puts "</svg>"
	end
end
