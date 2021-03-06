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
	html.puts("			<th> 014 </th>")
	html.puts("			<th> 015 </th>")
	html.puts("			<th> g2 </th>")
	html.puts("			<th> g3 </th>")
	html.puts("			<th> g4 </th>")
	html.puts("			<th> g12 </th>")
	html.puts("			<th> g14 </th>")
	html.puts("			<th> g15 </th>")
	html.puts("			<th> y2 </th>")
	html.puts("			<th> y3 </th>")
	html.puts("			<th> y4 </th>")
	html.puts("			<th> y12 </th>")
	html.puts("			<th> y14 </th>")
	html.puts("			<th> y15 </th>")
	html.puts("		</tr>")
	return html
end

class HTMLWriter
	def write(results, flog, flay)
		html = File.open("results_Iliyan_Germanov_B_17.html", "w")
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
			html.puts("			<td> #{results[key]["014"]} </td>")
			html.puts("			<td> #{results[key]["015"]} </td>")
			html.puts("			<td> #{flog[key]["002"]} </td>")
			html.puts("			<td> #{flog[key]["003"]} </td>")
			html.puts("			<td> #{flog[key]["004"]} </td>")
			html.puts("			<td> #{flog[key]["012"]} </td>")
			html.puts("			<td> #{flog[key]["014"]} </td>")
			html.puts("			<td> #{flog[key]["015"]} </td>")
			html.puts("			<td> #{flay[key]["002"]} </td>")
			html.puts("			<td> #{flay[key]["003"]} </td>")
			html.puts("			<td> #{flay[key]["004"]} </td>")
			html.puts("			<td> #{flay[key]["012"]} </td>")
			html.puts("			<td> #{flay[key]["014"]} </td>")
			html.puts("			<td> #{flay[key]["015"]} </td>")
			html.puts("		</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end

