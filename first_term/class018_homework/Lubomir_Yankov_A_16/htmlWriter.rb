class HTMLWriter

	def write(results)
	
		File.open("results_Lubomir_Yankov_A_16.html", "w") do |f|
			
			f.puts("<!DOCTYPE html>")
			
			f.puts("<html>\n")
			
			f.puts("<head>\n")
			f.puts("<title>Student homeworks</title>\n")
			f.puts("</head>\n")
			
			f.puts("<body>\n")
			
				f.puts("<table border = \"1\" style=\"width:100%\">\n")
				
				f.puts("<tr>\n")
				f.puts("<td>Name</td>\n")
				results.sort.each do |key, value|
				
					value.each do |k, v|
				
					f.puts("<td>#{k}</td>\n")
				
					end
					break
				end
				
				results.sort.each do |key, value|
				
					f.puts("<tr>\n")
					f.puts("<td>#{key}</td>\n")
					value.each do |k, v|
					
						f.puts("<td>#{v}</td>\n")
					
					end
					
					f.puts("</tr>\n")
				
				end
			
			f.puts("</body>\n")
			
			f.puts("</html>\n")
		
		end
	
	end

end
