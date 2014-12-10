
class HTMLWriter
	def write result, end_time, thing
		File.open("results_Emiliqn_Sokolov_B_15.html","w") do |file|
			file.puts "<html>"
			file.puts "<head></head>"
			file.puts "<body>"
			file.puts "<table border=\"1\">"
			file.puts "\t<tr>"
			file.puts "\t\t<th>time</th>"
			file.puts "\t\t<th></th>"
			file.puts "\t\t<th>#{end_time}</th>"
			file.puts "\t\t<th></th>"
			thing["print_stuff"]["ini_config"].keys.each do |asd|
				file.puts "\t\t<th>#{asd}</th>"
			end
			file.puts "\t</tr>"
			result.keys.each do |key|
				file.puts "\t<tr>"
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
end
