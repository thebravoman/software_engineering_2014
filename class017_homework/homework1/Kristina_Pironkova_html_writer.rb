class HTMLWriter
	def write results
		html = File.open("results_Kristina_Pironkova_15.html", "w")
		html.puts("<html>")
		html.puts("<body>")
		html.puts("<table style='border: 1px solid black;'>")
			html.puts("<tr >")		
				html.puts("<th><h2>First Name</h2></th>")
				html.puts("<th><h2>Last Name</h2></th>")
				html.puts("<th><h2>Result</h2></th>")
			html.puts("</tr>")

			results.sort.each do |key, value|
				first_name = key.split(" ").first
				last_name = key.split(" ").last

				html.puts("<tr style='border: 1px solid black;'>")
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