class HTMLWriter
	def write(results)
		html = File.open("result.html", "w")
		html.puts("<html>")
		html.puts("<ul>")
		results.keys.sort_by{|key, val| key}.each do |key|
			html.puts("	<li>#{key}</li>")
		end
		html.puts("</ul>")
		html.puts("</html")
		html.close
	end
end
