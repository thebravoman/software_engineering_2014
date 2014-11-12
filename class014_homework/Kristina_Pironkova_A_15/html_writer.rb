class HTMLWriter 
	def write results
		file = File.new("results_Kristina_Pironkova_A_15.html", "w")
		results.keys.sort.each do |key|
			file << "<div class=\"student\">
						<h3>#{key}</h3>
						<ul>
							<li>#{results[key][0]}</li>
							<li>#{results[key][1]}</li>
							<li>#{results[key][2]}</li>
							<li>#{results[key][3]}</li>
							<li>#{results[key][4]}</li>
						</ul>
					</div>"
		end
	end
end
