def write_to_HTML(result,time,name)
	classes = "#{time}"," "," "," ","VH", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1"
	File.open("#{name}.html","w") do |file|
		file.puts "<html>\n<head></head>\n<body>"
		file.puts "<table border=\"1\">"
		file.puts "\t<tr>"
		classes.each do |hw|
			file.puts "\t\t<th>#{hw}</th>"
		end
		file.puts "\t</tr>"
		file.puts "\t<tr>"
		result.each do |key|
			key_split = key[0].split(" ")
			file.puts "\t\t<td>#{key_split[0]}<td>"
			file.puts "\t\t<td>#{key_split[1]}<td>"
			key[1].each do |r_key|
				file.print "\t\t<td>"
				file.print r_key
				file.puts "</td>"
			end
			file.puts "\t</tr>"
		end
		file.puts "</table>\n</body>\n</html>"
	end
end
