class HTMLWriter
	def write(results)
		file = File.open("results_Vladimir_Yordanov_B_9.html", "w")
		
		file.puts "\
<!DOCTYPE html>
<html>
	<head>
		<title>ToP Results</title>
		<style>
			td { color : #444;}
		</style>
	</head>
	<body><center>
		<table border='1' style='width:40%'>
			<tr>
				<td></td><td></td><td>VH</td><td>002</td><td>003</td><td>004</td><td>009</td><td>012</td><td>014</td><td>g2</td><td>g3</td><td>g4</td><td>g12</td><td>g14</td><td>y2</td><td>y3</td><td>y4</td><td>y12</td><td>y14</td>
			</tr>"
		
		$students.sort.to_a.each do |k,v| 
			file.print "\
			<tr>
				<td>"; file.print k.split('_')[0]; file.print "</td><td>"
					   file.print k.split('_')[1]; file.print "</td>"
	
				file.print("<td>"); file.print($students[k]['01']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['02']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['03']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['04']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['09']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['12']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['14']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['g2']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['g3']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['g4']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['g12']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['g14']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['y2']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['y3']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['y4']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['y12']); file.print("</td>");
				file.print("<td>"); file.print($students[k]['y14']); file.print("</td>");
			
			file.puts "
			</tr>"
		end
		
		file.puts "\
		</table>
		</center>
	<body>
<html>"

	end
end
