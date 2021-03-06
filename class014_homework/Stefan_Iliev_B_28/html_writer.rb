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
		html = File.open("results_Stefan_Iliev_B_28.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:100%\">")
		html = init_headers(html)
		results.each do |key,hw_hash|
			html.puts("		<tr>")
			html.puts("			<td> #{key.split("_").first} </td>")
			html.puts("			<td> #{key.split("_")[1]} </td>")
			html.puts("			<td> #{hw_hash.values_at("entry_homework").first} </td>")
			html.puts("			<td> #{hw_hash.values_at("homework_1").first} </td>")
			html.puts("			<td> #{hw_hash.values_at("homework_2").first} </td>")
			html.puts("			<td> #{hw_hash.values_at("homework_3").first} </td>")
			html.puts("			<td> #{hw_hash.values_at("homework_4").first} </td>")
			html.puts("			<td> #{hw_hash.values_at("homework_5").first} </td>")
			html.puts("		</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end

