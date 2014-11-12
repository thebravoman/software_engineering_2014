class HTMLWriter 
	def write results
		file = File.new("results_Borislav_Rusinov_A_1.html", "w")
		results.keys.sort.each do |key|
			file << "<div class=\"student\">
						<h3>#{key}</h3>
						<ul>
							<li>#{results[key]["VH"]}</li>
							<li>#{results[key]["002"]}</li>
							<li>#{results[key]["003"]}</li>
							<li>#{results[key]["004"]}</li>
							<li>#{results[key]["009"]}</li>
							<li>#{results[key]["012"]}</li>
						</ul>
					</div>"
		end
	end
end
