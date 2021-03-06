
class HTMLWriter
	def write result
		File.open("results_Martin_Grigorov_B_23.html","w") do |file|
			file.puts "<html>"
			file.puts "<head></head>"
			file.puts "<body>"
			file.puts "<table border=\"1\">"
			file.puts "\t<tr>"
			file.puts "\t\t<th></th>"
			file.puts "\t\t<th></th>"
			file.puts "\t\t<th></th>"
			file.puts "\t\t<th></th>"
			file.puts "\t\t<th>VH</th>"
			file.puts "\t\t<th>002</th>"
			file.puts "\t\t<th>003</th>"
			file.puts "\t\t<th>004</th>"
			file.puts "\t\t<th>009</th>"
			file.puts "\t\t<th>012</th>"
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
end
