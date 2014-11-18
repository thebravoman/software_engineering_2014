class HTMLWriter
	def write(result,classes)
		html = File.open("results_Nikolay_Mihailov_B_25.html", "w")
		
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:80%\">")

		html.puts("	<tr>")
		html.puts("	<th> FirstName </th>")
		html.puts("	<th> LastName </th>")
		html.puts("	<th> VH </th>")
		html.puts("	<th> 002 </th>")
		html.puts("	<th> 003 </th>")
		html.puts("	<th> 004 </th>")
		html.puts("	<th> 009 </th>")
		html.puts("	<th> 012 </th>")
		html.puts("	<th> 014 </th>")
		html.puts("	</tr>")
		
		result.keys.sort.each do |key|
			key_split = key.split(",")

			html.puts("	<tr>")
			html.puts("	<td> #{key_split[0]} </td>")
			html.puts("	<td> #{key_split[1]} </td>")
			html.puts("	<td> #{result[key][0]} </td>")
			html.puts("	<td> #{result[key][1]} </td>")
			html.puts("	<td> #{result[key][2]} </td>")
			html.puts("	<td> #{result[key][3]} </td>")
			html.puts("	<td> #{result[key][4]} </td>")
			html.puts("	<td> #{result[key][5]} </td>")
			html.puts("	<td> #{result[key][6]} </td>")
			html.puts("	</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end
