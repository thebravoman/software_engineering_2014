class SVGWriter
	def write (num_of_hashes,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashstudents_017_1,hashstudents_017_2)
		count = Array.new
		info_for_bars = Array.new
		for i in 0..num_of_hashes do
			count[i] = 0.0
			info_for_bars[i] = 0.0
		end
		Dir.chdir File.dirname(__FILE__)
		svg = File.new("results_David_Georgiev_B_12.svg", "w+")
		hashstudents_vhodno.each	do |key, value| if value == 1 then count[1] = count[1]+1 end end
		hashstudents_002.each		do |key, value| if value == 1 then count[2]	= count[2]+1 end end
		hashstudents_003.each		do |key, value| if value == 1 then count[3]	= count[3]+1 end end
		hashstudents_004.each		do |key, value| if value == 1 then count[4]	= count[4]+1 end end
		hashstudents_009.each		do |key, value| if value == 1 then count[5]	= count[5]+1 end end
		hashstudents_012.each		do |key, value| if value == 1 then count[6]	= count[6]+1 end end
		hashstudents_014.each		do |key, value| if value == 1 then count[7]	= count[7]+1 end end
		hashstudents_015.each		do |key, value| if value == 1 then count[8]	= count[8]+1 end end
		hashstudents_017_1.each		do |key, value| if value == 1 then count[9]	= count[9]+1 end end
		hashstudents_017_2.each		do |key, value| if value == 1 then count[10]	= count[10]+1 end end
#The following is for all of the points
=begin
		hashstudents_vhodno.each	do |key, value| if value == 1 or value == 2 then count[1] = count[1]+value end end
		hashstudents_002.each		do |key, value| if value == 1 or value == 2 then count[2] = count[2]+value end end
		hashstudents_003.each		do |key, value| if value == 1 or value == 2 then count[3] = count[3]+value end end
		hashstudents_004.each		do |key, value| if value == 1 or value == 2 then count[4] = count[4]+value end end
		hashstudents_009.each		do |key, value| if value == 1 or value == 2 then count[5] = count[5]+value end end
		hashstudents_012.each		do |key, value| if value == 1 or value == 2 then count[6] = count[6]+value end end
		hashstudents_014.each		do |key, value| if value == 1 or value == 2 then count[7] = count[7]+value end end
		hashstudents_015.each		do |key, value| if value == 1 or value == 2 then count[8] = count[8]+value end end
		hashstudents_017_1.each		do |key, value| if value == 1 or value == 2 then count[9] = count[9]+value end end
		hashstudents_017_2.each		do |key, value| if value == 1 or value == 2 then count[10] = count[10]+value end end
=end
		max_value_index = count.index(count.max)
		per_cent = count[max_value_index]/100
		
		for i in 1..num_of_hashes do
			if i == 1 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"VH"]
			end
			if i == 2 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"002"]
			end
			if i == 3 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"003"]
			end
			if i == 4 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"004"]
			end
			if i == 5 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"009"]
			end
			if i == 6 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"012"]
			end
			if i == 7 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"014"]
			end
			if i == 8 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"015"]
			end
			if i == 9 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"017_1"]
			end
			if i == 10 then
				info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,"017_2"]
			end
			p info_for_bars[i]
		end

		svg.puts "<svg height=\"400\" width=\"#{num_of_hashes*100}\">\n<svg x=\"0\" y=\"0\">\n<rect x=\"0\" y=\"0\" height=\"400\" width=\"#{num_of_hashes*100}\"\nstyle=\"fill:\#e8c59c;\"/>\n</svg>\n<text x=\"#{((num_of_hashes*100)/2)-80}\" y=\"45\" style=\"fill: #f6b483; stroke: #594e52;  font-size: 40px;\">Results</text>\n"
		
		x_points = 45
		x_rect = 10
		x_text = 37
		index = 1
		while (index <= num_of_hashes) do
			svg.puts "<text x=\"#{x_points}\" y=\"#{380-info_for_bars[index][0]}\" style=\"fill: #594e52; font-size: 16px;\">#{info_for_bars[index][1]}</text>\n"
			svg.puts "<svg x=\"0\" y=\"#{380-info_for_bars[index][0]}\">\n<rect x=\"#{x_rect}\" y=\"10\" height=\"#{info_for_bars[index][0]}\" width=\"90\"\nrx=\"20\" ry=\"10\"\nstyle=\"stroke:#594e52;\nstroke-width: 3;\nfill:#e29676;\nbackground: red;\"/>\n</svg>"
		svg.puts "<text x=\"#{x_text}\" y=\"385\" style=\"fill: #999999; stroke: #000000;  font-size: 16px;\">#{info_for_bars[index][2]}</text>"
			x_points += 100
			x_rect += 100
			x_text += 100
			index += 1
		end

		svg.puts "</svg>"
	end

end


