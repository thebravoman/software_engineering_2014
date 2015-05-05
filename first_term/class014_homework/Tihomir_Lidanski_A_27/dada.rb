class HTMLwriter

	def write results
		html = File.open("results_Tihomir_Lidanski_A_27.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<table style=\"width:100%\">")
		grades.keys.sort.each do |key|
		
			html.puts("<tr>")
				html.puts("<td>#{key.split(' ').first}</td>")
				html.puts("<td>#{key.split(' ').last}</td>")
				html.puts("<td>#{grades[key][0]}</td>")
				html.puts("<td>#{grades[key][1]}</td>")
				html.puts("<td>#{grades[key][2]}</td>")
				html.puts("<td>#{grades[key][3]}</td>")
				html.puts("<td>#{grades[key][4]}</td>")
				html.puts("<td>#{grades[key][5]}</td>")
			html.puts("</tr>")
		end
		html.puts("</table>")
		html.puts("</html>")
		html.close
	end
end	
