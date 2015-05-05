class HTMLWriter
	def write(result,classes)
		html = File.open("results_Nikolay_Mihailov_B_25.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("	<table border=\"1\" style=\"width:80%\">")

		html.puts("	<tr>")
		html.puts("	<th> FirstName </th>")
		html.puts("	<th> LastName </th>")
		for class_index in 2..24
			html.puts("	<th> #{classes[class_index]} </th>")
		end
		html.puts("	</tr>")
		
		result.keys.sort.each do |key|
			key_split = key.split(",")
			html.puts("	<tr>")
			html.puts("	<td> #{key_split[0]} </td>")
			html.puts("	<td> #{key_split[1]} </td>")
			for counter in 0..22
				html.puts("	<td> #{result[key][counter]} </td>")
			end
			html.puts("	</tr>")
		end
		html.puts("	</table>")
		html.puts("</html>")
		html.close
	end
end
