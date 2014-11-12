

class HTMLWriter 

	def write (hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		Dir.chdir File.dirname(__FILE__)
		fileHtml = File.new("results_David_Georgiev_B_12.html", "w+")
		fileHtml.puts "<HTML><body><table>"
		fileHtml.puts "<tr><td>student</td><td>VH</td><td>002</td><td>003</td><td>004</td><td>009</td><td>012</td></tr>"		
 		hashstudents.sort.each do |key, value|
					fileHtml.puts "<tr><td>#{key}</td><td>#{value}</td><td>#{hashstudents3[key]}</td><td>#{hashstudents4[key]}</td><td>#{hashstudents2[key]}</td><td>#{hashstudents6[key]}</td><td>#{hashstudents5[key]}</td></tr>"
		end
		fileHtml.puts "</table></body></HTML>"
	end

end
