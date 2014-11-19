class HTMLWriter 
	def write(seconds,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashflay002,hashflay003,hashflay012,hashflay014,hashflay015,hashflog002,hashflog003,hashflog012,hashflog014,hashflog015)
		Dir.chdir File.dirname(__FILE__)
		fileHtml = File.new("results_Konstantin_Vekilski_B_20.html", "w+")
		fileHtml.puts "<HTML><body><table border=\"2\" style=\"border-collapse: collapse\">"
		fileHtml.puts "<tr><td>#{seconds}</td><td></td><td>VH</td><td>002</td><td>003</td><td>004</td><td>009</td><td>012</td><td>014</td><td>015</td><td>g2</td><td>g3</td><td>g12</td><td>g14</td><td>g15</td><td>y2</td><td>y3</td><td>y12</td><td>y14</td><td>y15</td></tr>"		
 		hashstudents_vhodno.sort.each do |key, value|
			key1 = key.split(/\ /)
			fileHtml.puts "<tr><td>#{key1[0]}</td><td>#{key1[1]}</td><td>#{value}</td><td>#{hashstudents_002[key]}</td><td>#{hashstudents_003[key]}</td><td>#{hashstudents_004[key]}</td><td>#{hashstudents_009[key]}</td><td>#{hashstudents_012[key]}</td><td>#{hashstudents_014[key]}</td><td>#{hashstudents_015[key]}</td><td>#{hashflog002[key]}</td><td>#{hashflog003[key]}</td><td>#{hashflog012[key]}</td><td>#{hashflog014[key]}</td><td>#{hashflog015[key]}</td><td>#{hashflay002[key]}</td><td>#{hashflay003[key]}</td><td>#{hashflay012[key]}</td><td>#{hashflay014[key]}</td><td>#{hashflay015[key]}</td></tr>"
		end
		fileHtml.puts "</table></body></HTML>"
	end
end
