class HTMLWriter
	def write (hash, filename, time)

	order = ["vhodno_nivo", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "018", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "g18", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2", "y18"]
		File.open(filename + ".html" ,'w') do |file|
			file << "<html>\n<body>\n<table border = \"1\">"
			file << "<tr>\n<td>#{time}</td>\n<td></td>"
			order.each do |a|
				file << "<td>#{a}</td>"
			end
			file << "</tr>"
			hash.each do |name, result|
				file << "<tr>\n"
				name.split(' ').first(2).each do |name|
					file << "<td>#{name}</td>\n"
				end
				
				order.each do |key|
					file << "<td>#{result[key]}</td>\n"
				end
				
				file << "</tr>\n"
			end
			file << "</table>\n</body>\n</html>"
		end
	end
end
