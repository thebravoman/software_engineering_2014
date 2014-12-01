class HTMLWriter
	def write (hash, filename, time)
=begin
		array_count = 0
		
		#Create the mighty HTML
		File.open("results_Valentin_Varbanov_B_4.html", 'w') { 
			|file| 
			file.write ("<html>\n") 
			file.write ("<head>\n")
			file.write ("<title>HTML Results</title>\n")
			file.write ("</head>\n")
			file.write ("<body>\n")
			file.write ("<table border = \"1\">")
			file.write ("<tr>\n")
			file.write ("<th></th>\n")
			file.write ("<th></th>\n")
			file.write ("<th>VH</th>\n")
			file.write ("<th>002</th>\n")
			file.write ("<th>003</th>\n")
			file.write ("<th>004</th>\n")
			file.write ("<th>009</th>\n")
			file.write ("<th>012</th>\n")
			file.write ("</tr>\n")
		}
		
		hash.each do |name,result|
			if name != nil
						first_name = name.split(' ').first
						last_name = name.split(' ').last
						result =  result.split(',')
						result4 = result[4]
						if result4 == nil then result4 = 0 end
						result5 = result[5]
						if result5 == nil then result5 = 0 end
			end
			File.open("results_Valentin_Varbanov_B_4.html", 'a') {
				|file|
				file.write ("<tr>\n")
				file << "<td>#{first_name}</td>\n"
				file << "<td>#{last_name}</td>\n"
				file << "<td>#{result[0]}</td>\n"
				file << "<td>#{result[1]}</td>\n"
				file << "<td>#{result[2]}</td>\n"
				file << "<td>#{result[3]}</td>\n"
				file << "<td>#{result4}</td>\n"
				file << "<td>#{result5}</td>\n"
				file.write ("</tr>\n")
			}
			
			array_count += 1
		end
		
		File.open("results_Valentin_Varbanov_B_4.html", 'a') {
			|file|
			file << "</table>\n"
			file << "</body>\n"
			file << "</html>\n"
		}
=end
	order = ["vhodno_nivo", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2"]
		File.open(filename + ".html" ,'w') do |file|
			file << "<html>\n<body>\n<table border = \"1\">"
			file << "<tr>\n<td>#{time}</td>\n<td></td>"
			order.each do |a|
				file << "<td>#{a}</td>"
			end
			file << "</tr>"
			hash.each do |name, result|
				file << "<tr>\n"
				file << "<td>#{name.split(' ')[0]}</td>\n"
				file << "<td>#{name.split(' ')[1]}</td>\n"
				
				order.each do |key|
					if key.to_i != 0
						file << "<td>#{result[key]}</td>\n"
					else
						file << "<td>#{result[key]}</td>\n"
					end
				end
				
				file << "</tr>\n"
			end
			file << "</table>\n</body>\n</html>"
		end
	end
end
