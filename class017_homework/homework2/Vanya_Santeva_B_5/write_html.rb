def write_to_HTML(result,time)
	classes = "#{time}"," "," "," ","VH", "002", "003", "004", "009", "012", "014", "017", "g2", "g3", "g4", "g12", "g14", "g17", "y2", "y3", "y4", "y12", "y14", "y17"
	File.open("results_Vanya_Santeva_B_5.html","w") do |file|
		file.puts "<html>"
		file.puts "<head></head>"
		file.puts "<body>"
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
		file.puts "</table>"
		file.puts "</body>"
		file.puts "</html>"
	end
end
