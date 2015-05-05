class HTMLWriter
	def write(results)
		file = File.open("results_Hristiyan_Dodov_B_29.html", "w")
		
		file.puts "\
<!DOCTYPE html>
<html>
	<head>
		<title>Results</title>
	</head>
	<body>
		<table border='1' style='width:40%'>
			<tr>
				<td></td><td></td><td>VH</td><td>002</td><td>003</td><td>004</td><td>009</td><td>012</td>
			</tr>"
		
		results.each do |k,v| 
			file.print "\
			<tr>
				<td>"; file.print k.split('_')[0]; file.print "</td><td>"
					   file.print k.split('_')[1]; file.print "</td>"
	
			for i in 0..5 do
				file.print("<td>"); file.print(v[i]); file.print("</td>");
			end
			
			file.puts "
			</tr>"
		end
		
		file.puts "\
		</table>
	<body>
<html>"

	end
end
