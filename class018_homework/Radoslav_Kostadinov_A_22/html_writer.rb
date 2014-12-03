class HTMLWriter 
	def write results,time
		file = File.new("results_Radoslav_Kostadinov_A_22.html", "w")
		file << "<div><h4>#{time}</h4></div>"		
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
							<li>#{results[key]["014"]}</li>
							<li>#{results[key]["0171"]}</li>
							<li>#{results[key]["0172"]}</li>
							<li>#{results[key]["g2"]}</li>
							<li>#{results[key]["g3"]}</li>
							<li>#{results[key]["g4"]}</li>
							<li>#{results[key]["g12"]}</li>
							<li>#{results[key]["g14"]}</li>
							<li>#{results[key]["g171"]}</li>
							<li>#{results[key]["y2"]}</li>
							<li>#{results[key]["y3"]}</li>
							<li>#{results[key]["y4"]}</li>
							<li>#{results[key]["y12"]}</li>
							<li>#{results[key]["y14"]}</li>
							<li>#{results[key]["g171"]}</li>
						</ul>
					</div>"
		end
	end
end
