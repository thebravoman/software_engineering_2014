

class HTMLWriter 

	def write (hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
		Dir.chdir File.dirname(__FILE__)
		fileHtml = File.new("results_David_Georgiev_B_12.html", "w+")
		fileHtml.puts "<HTML><body><table>"
		fileHtml.puts "<tr><td>student</td><td>VH</td><td>002</td><td>003</td><td>004</td><td>009</td><td>012</td><td>014</td></tr>"		
 		hashstudents_vhodno.sort.each do |key, value|
					fileHtml.puts "<tr><td>#{key}</td><td>#{value}</td><td>#{hashstudents_002[key]}</td><td>#{hashstudents_003[key]}</td><td>#{hashstudents_004[key]}</td><td>#{hashstudents_009[key]}</td><td>#{hashstudents_012[key]}</td><td>#{hashstudents_014[key]}</td></tr>"
		end
		fileHtml.puts "</table></body></HTML>"
	end

end


#wr = HTMLWriter.new
#wr.write (hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)

