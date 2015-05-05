class HTMLWriter
	def write(results)
		html = File.open("results_Kamena_Dacheva_A_13.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<head>")
		html.puts("<pre><title> Students homeworks </title></pre>")
		html.puts("</head>")
		html.puts("Students homeworks")
		results.keys.sort.each do |key|
			html.puts("<pre>")
			html.puts("<h3> Name: #{key}</h3>")
			html.puts("<ul>")			
			html.puts("<li> VH:  #{results[key][0]} </li>")
			html.puts("<li> 002: #{results[key][1]} </li>")
			html.puts("<li> 003: #{results[key][2]} </li>")
			html.puts("<li> 004: #{results[key][3]} </li>")
			html.puts("<li> 009: #{results[key][4]} </li>")
			html.puts("<li> 012: #{results[key][5]} </li>")
			html.puts("</pre>")
			html.puts("</ul>")
		end
		html.puts("/body")
		html.puts("</html>")
	html.close
	end
end
