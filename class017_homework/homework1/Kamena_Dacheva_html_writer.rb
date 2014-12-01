class HTMLWriter
	def write results
		html = File.open("results_Kamena_Dacheva_A_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<head>")
		html.puts("<pre><title>Test2 - results</title></pre>")
		html.puts("</head>")
		html.puts("<table border=1 style=width:50% align=center>")
			html.puts("<tr>")		
				html.puts("<th><h3>First Name</h3></th>")
				html.puts("<th><h3>Last Name</h3></th>")
				html.puts("<th><h3>Result</h3></th>")
			html.puts("</tr>")
			results.sort.each do |key, value|
				first_name = key.split(" ").first
				last_name = key.split(" ").last
				html.puts("<tr>")
					html.puts("<th>#{first_name}</th>")
					html.puts("<th>#{last_name}</th>")
					html.puts("<th>#{value}</th>")
				html.puts("</tr>")
			end
					
		html.puts("</table>")
		html.puts("</body>")
		html.puts("</html>")
	html.close
	end
end
