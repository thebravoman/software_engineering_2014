class HTMLWriter
	def write(results, classes)
		html = File.open("results_Hristiyan_Velyakov_A_28.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<table border=\"1\" style=\"width:100%\">")
		html.puts("\t<tr>")
		html.puts("\t\t<th> FirstName </th>")
		html.puts("\t\t<th> LastName </th>")
		classes.each do |el|
			html.puts("\t\t<th> #{el} </th>")
		end	
		html.puts("\t</tr>")
		results.keys.sort.each do |key|
			html.puts("\t<tr>")
			html.puts("\t\t<td> #{key.split("_").first} </td>")
			html.puts("\t\t<td> #{key.split("_").last} </td>")
			results[key].values.each do |val|
				html.puts("\t\t<td> #{val} </td>")
			end
			html.puts("\t</tr>")
		end
		html.puts("</table>")
		html.puts("</html>")
		html.close
	end
end
