class HTMLWriter
	def write(result,classes,folder)
		html = File.open("results_Konstantin_Kostov_B_21.html", "w")
		
		html.puts("	<table border=\"1\" style=\"width:20%\">")
		for class_index in 0..folder+4
			html.puts("	<th> #{classes[class_index]} </th>")
		end
		
		result.keys.sort.each do |key|
			key_split = key.split(",")
			html.puts("	<tr>")
			html.puts("	<td> #{key_split[0]} </td>")
html.puts("	<td> #{key_split[1]} </td>")
			for counter in 0..folder+2
				html.puts("	<td> #{result[key][counter]} </td>")
			end
			html.puts("	</tr>")
		end
		html.puts("	</table>")
		
		html.close
	end
end
