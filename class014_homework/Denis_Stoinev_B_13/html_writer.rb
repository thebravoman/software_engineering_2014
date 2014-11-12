def init_headers(html)
	html.puts("		<tr>")
	html.puts("			<th> FirstName </th>")
	html.puts("			<th> LastName </th>")
	html.puts("			<th> VH </th>")
	html.puts("			<th> 002 </th>")
	html.puts("			<th> 003 </th>")
	html.puts("			<th> 004 </th>")
	html.puts("			<th> 009 </th>")
	html.puts("			<th> 012 </th>")
	html.puts("		</tr>")
	return html
end

class HTMLWriter
	def write(results)
		html = File.open("results_Denis_Stoinev_B_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")
		html = init_headers(html)
		results.keys.sort.each do |key|
			html.puts("		<tr>")
			html.puts("			<td> #{key.split("_").first} </td>")
			html.puts("			<td> #{key.split("_")[1]} </td>")
			html.puts("			<td> #{results[key]["VH"]} </td>")
			html.puts("			<td> #{results[key]["002"]} </td>")
			html.puts("			<td> #{results[key]["003"]} </td>")
			html.puts("			<td> #{results[key]["004"]} </td>")
			html.puts("			<td> #{results[key]["009"]} </td>")
			html.puts("			<td> #{results[key]["012"]} </td>")
			html.puts("		</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end

