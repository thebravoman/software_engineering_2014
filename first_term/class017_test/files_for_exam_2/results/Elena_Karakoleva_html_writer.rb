class HTMLWriter
	def write student3
		html = File.open("result.html", "w")
		html.puts("<!DOCTYPE html>")
		html.puts("<html>")
		html.puts("<ul>")
		student3.keys.sort.each do |name,sum|	
			html.puts("<li>#{name}</li>")				
		end
		html.puts("</ul>")
		html.puts("</html>")
	html.close
	end
end
