class HTMLWriter
	def write results,no_need_of_this_arg
		File.open("results_Ivo_Stratev_B_16.html", "w") do |row|
			row << "<!DOCTYPE html>\n" << "<html>\n" << "\t<body>\n"
				row << "\t\t<table style='width:100%;'>\n" 
			results.sort.each do |k, v|
				row << "\t\t<tr>\n" << "\t\t\t<td>" << "#{k.split(' ')[0]}" << "</td>\n" << "\t\t\t<td>" << "#{k.split(' ')[1]}" << "</td>\n"
				i = 0
				v.each do |l|
					row << "\t\t\t<td>" << "#{l}" << "</td>\n"
					i = i + 1
					if i == 7
						break
					end
				end
				 row << "\t\t</tr>\n"
			end
			row << "\t\t</table>\n" << "\t</body>\n" << "</html>"
		end
	end
end
