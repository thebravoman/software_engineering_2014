def write_to_HTML(result)
	classes = " "," "," "," ","vhodno_nivo","class002","class003","class004","class009","class012"
	File.open("results_Veselin_Dechev_A_2.html","w") do |file|
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
		result.keys.each do |key|
			key_split = key.split(",")
			file.puts "\t\t<td>#{key_split[0]}<td>"
			file.puts "\t\t<td>#{key_split[1]}<td>"
			result[key].each do |r_key|
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
