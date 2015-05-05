class HTMLWriter
	def write results,time
		html = File.open("results_Elena_Karakoleva_A_8.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<head>")
		html.puts("<pre><title> Students homeworks </title></pre>")
		html.puts("</head>")
		html.puts("<table style=width:100%>")
			html.puts("<tr>")		
				html.puts("<th><h3>Time: #{time}</h3></th>")
				html.puts("<th><h3>VH</h3></th>")
				html.puts("<th><h3>002</h3></th>")
				html.puts("<th><h3>003</h3></th>")
				html.puts("<th><h3>004</h3></th>")
				html.puts("<th><h3>009</h3></th>")
				html.puts("<th><h3>012</h3></th>")
				html.puts("<th><h3>014</h3></th>")
				html.puts("<th><h3>017/1</h3></th>")
				html.puts("<th><h3>017/2</h3></th>")
				#flog
				html.puts("<th><h3>g2</h3></th>")
				html.puts("<th><h3>g3</h3></th>")
				html.puts("<th><h3>g4</h3></th>")
				html.puts("<th><h3>g9</h3></th>")
				html.puts("<th><h3>g12</h3></th>")
				html.puts("<th><h3>g14</h3></th>")
				html.puts("<th><h3>g17/1</h3></th>")
				html.puts("<th><h3>g17/2</h3></th>")
				#flay
				html.puts("<th><h3>y2</h3></th>")
				html.puts("<th><h3>y3</h3></th>")
				html.puts("<th><h3>y4</h3></th>")
				html.puts("<th><h3>y9</h3></th>")
				html.puts("<th><h3>y12</h3></th>")
				html.puts("<th><h3>y14</h3></th>")
				html.puts("<th><h3>y17/1</h3></th>")
				html.puts("<th><h3>y17/2</h3></th>")
			html.puts("</tr>")
			results.keys.sort.each do |key|	
				html.puts("<tr>")
				html.puts("<th>#{key}</th>")
				(0..24).each do |i|
					if i != 12 && i!=20 then html.puts("<th>#{results[key][i]}</th>")
					else html.puts("<th>*</th>") end
				end
				html.puts("</tr>")					
			end
		html.puts("</table>")
		html.puts("</body>")
		html.puts("</html>")
	html.close
	end
end
