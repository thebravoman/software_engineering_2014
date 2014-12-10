class HTMLWriter
	def write (results)
		File.open("results_Atanaska_Ivancheva_B_1.html", "w") do |row|
			row << "<!DOCTYPE html>\n" << "<html>\n" << "\t<body>\n"
			row << "\t\t<table style='width:100%;'>\n"
			row << "\t\t<tr>\n"
			results.first[1].keys.each do |line|
				row << "\t\t\t<td>" << line << "</td>\n"
			end
			
			row << "\t\t</tr>\n"

			results.sort.each do |k, v|
				row << "\t\t<tr>\n" << "\t\t\t<td>" << "#{k.split('_')[0]}" << "</td>\n" << "\t\t\t<td>" << "#{k.split('_')[1]}" << "</td>\n"
				v.each do |m, l|
					row << "\t\t\t<td>" << "#{l}" << "</td>\n"
				end
				 row << "\t\t</tr>\n"
			end
			row << "\t\t</table>\n" << "\t</body>\n" << "</html>"
		end
	end
end
