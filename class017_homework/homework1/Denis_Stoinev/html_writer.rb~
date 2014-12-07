class HTMLWriter
	def write(results)
		html = File.open("results_Iliyan_Germanov_B_17.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<table border=\"1\" style=\"width:100%\">")
		html.puts("\t<tr>")
		html.puts("\t\t<th>FirstName</th>")
		html.puts("\t\t<th>LastName</th>")
		html.puts("\t\t<th>Result</th>")
		html.puts("\t</tr>")
		results.keys.sort_by{|key, val| key}.each do |key|
			html.puts("\t<tr>")
			html.puts("\t\t<td> #{key.split("_").first} </td>")
			html.puts("\t\t<td> #{key.split("_").last} </td>")
			html.puts("\t\t<td> #{results[key]} </td>")
			html.puts("\t</tr>")
		end
		html.puts("</table>")
		html.puts("</html>")
		html.close
	end
end
