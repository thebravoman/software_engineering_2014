class HTMLWriter
	def write(results)
		html = File.open("results_Denis_Stoinev_B_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")
		html.puts("		<tr>")
		html.puts("			<th> FirstName </th>")
		html.puts("			<th> LastName </th>")
		html.puts("			<th> Result </th>")
		html.puts("		</tr>")
		results.keys.sort_by{|key, val| key}.each do |student|
			html.puts("		<tr>")
			html.puts("		<td> #{student.split("_").first} </td>")
			html.puts("		<td> #{student.split("_").last} </td>")
			html.puts("		<td> #{results[student]} </td>")
			html.puts("		</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end
