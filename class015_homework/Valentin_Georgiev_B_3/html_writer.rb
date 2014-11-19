class HTMLWriter
	def write (results)
		File.open("results_Valentin_Georgiev_B_3.html", "w") do |row|
			row << "<!DOCTYPE html>\n" << "<html>\n" << "\t<body>\n"
				row << "\t\t<table style='width:100%;'>\n"
				row << "\t\t<tr>\n" << "\t\t\t<td>" << "</td>\n" << "\t\t\t<td>" << "</td>\n" << "\t\t\t<td>" << "VH" << "</td>\n" << "\t\t\t<td>" << "002" << "</td>\n" << "\t\t\t<td>" << "003" << "</td>\n" << "\t\t\t<td>" << "004" << "</td>\n" << "\t\t\t<td>" << "009" << "</td>\n" << "\t\t\t<td>" << "012" << "</td>\n" << "\t\t\t<td>" << "014" << "</td>\n" << "\t\t\t<td>" << "g2" << "</td>\n" << "\t\t\t<td>" << "g3" << "</td>\n" << "\t\t\t<td>" << "g4" << "</td>\n" << "\t\t\t<td>" << "g12" << "</td>\n" << "\t\t\t<td>" << "g14" << "</td>\n"  << "\t\t</tr>\n" 
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
