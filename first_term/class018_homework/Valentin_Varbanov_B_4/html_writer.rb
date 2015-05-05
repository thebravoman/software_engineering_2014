class HTMLWriter
	def write (hash, filename, order, time)
		File.open(filename + ".html" ,'w') do |file|
			file << "<html>\n<head>\n<link href=\"table.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n</head>\n<body>\n<table border = \"1\">"
			file << "<tr>\n<th>#{time}</th>\n<th></th>"
			order.each do |a|
				file << "<th>#{a}</th>"
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
