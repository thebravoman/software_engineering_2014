

class HTMLWriter 

	def write(seconds,results,argv_number)
		argv_number_counter = 0
		titles = Hash.new(0)
		first_line = "<tr><th>#{seconds}</th><th></th>"
		Dir.chdir File.dirname(__FILE__)
		fileHtml = File.new("results_David_Georgiev_B_12.html", "w+")
		fileHtml.puts "<HTML><body><table border=\"2\" style=\"border-collapse: collapse\">"
		results.sort.each do |key,value|
			results[key].sort.each do |k,v|
				titles[k] = 1
			end
		end
		titles.sort.each do |k,v|
			first_line = "#{first_line}<th>#{k}</th>"
			results.sort.each do |key,value|
				if results[key][k] == nil then
					results[key][k] = 0
				end
			end
		end
		
		fileHtml.puts first_line
		results.sort.each do |key,value|
			argv_number_counter += 1
			if (argv_number_counter <= argv_number) then
				key1 = key.split(" ")
				fileHtml.write "<tr><td>#{key1[0]}</td><td>#{key1[1]}</td>"
				results[key].sort.each do |k,v|
					fileHtml.write "<td>#{v}</td>"
				end
				fileHtml.puts "</tr>"
			end
		end
		fileHtml.puts "</table></body></HTML>"
		fileHtml.close
	end

end

