class HTMLWriter
	def write (hash, filename, time)
	order = ["vhodno_nivo", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2"]
		File.open(filename + ".html" ,'w') do 
			|file|
			file.write ("<html>\n") 
			file.write ("<head>\n")
			file.write ("<title>HTML Results</title>\n")
			file.write ("</head>\n")
			file.write ("<body>\n")
			file.write ("<table border = \"1\">")
			file.write ("<tr>\n")
			file.write ("<th>#{time}</th>\n")
			file.write ("<th></th>\n")
			order.each do |a|
				file << "<th>#{a}</th>"
			end
			file.write ("</tr>\n")
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
			file << "</table>\n"
			file.write ("</body>\n")
			file.write ("<html>")
		end
	end
end
