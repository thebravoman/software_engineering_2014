class SVGWriter
	def write (results,num_of_hashes,argv_number)
		argv_number_counter = 0
		titles = Hash.new(0)
		count = Array.new
		homeworks = Array.new
		info_for_bars = Array.new
		for i in 0..num_of_hashes-1 do
			count[i] = 0.0
			info_for_bars[i] = 0.0
		end
		Dir.chdir File.dirname(__FILE__)
		svg = File.new("results_David_Georgiev_B_12.svg", "w+")

		results.sort.each do |key,value|
			results[key].sort.each do |k,v|
				if (k == "VH") or (k.split("").first == "0")
					titles[k] = 0
				end
			end
		end
		titles.sort.each do |k,v|
			results.sort.each do |key,value|
				if results[key][k] == nil then
					results[key][k] = 0
				end
			end
		end
		results.sort.each do |key,value|
			argv_number_counter += 1
			if (argv_number_counter <= argv_number) then
				results[key].sort.each do |k,v|
					titles.sort.each do |k2,v2|
						if k == k2 then
							if (v == 1) then
								titles[k] += v
							end
						end
					end
				end
			end
		end
		index_of_couter = 0
		titles.sort.each do |k, v|
			count[index_of_couter] += v
			homeworks[index_of_couter] = k
			index_of_couter += 1
		end
		p titles
		p count
		max_value_index = count.index(count.max)
		per_cent = count[max_value_index]/100
		p titles
		p count[max_value_index]
		
		print "#{per_cent}"
		for i in 0..num_of_hashes-1 do
			info_for_bars[i] = [((count[i]/per_cent/100)*300).round/1,count[i].round/1,homeworks[i]]
			p info_for_bars[i]
		end

		svg.puts "<svg height=\"400\" width=\"#{num_of_hashes*100}\">\n<svg x=\"0\" y=\"0\">\n<rect x=\"0\" y=\"0\" height=\"400\" width=\"#{num_of_hashes*100}\"\nstyle=\"fill:\#e8c59c;\"/>\n</svg>\n<text x=\"#{((num_of_hashes*100)/2)-80}\" y=\"45\" style=\"fill: #f6b483; stroke: #594e52;  font-size: 40px;\">Results</text>\n"
		
		x_points = 45
		x_rect = 10
		x_text = 37
		index = 0
		while (index <= num_of_hashes-1) do
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
