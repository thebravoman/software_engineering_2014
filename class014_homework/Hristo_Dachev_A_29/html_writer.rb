# require 'cgi' # FOR html

class HTMLWriter 
	def write results
		file = File.new("results_Hristo_Dachev_A_29.html", "w")
		results.keys.sort.each do |key|
			file << "<div class=\"student\">
						<h3>#{key}</h3>
						<ul>
							<li>VH: #{results[key]["VH"]}</li>
							<li>002: #{results[key]["002"]}</li>
							<li>003: #{results[key]["003"]}</li>
							<li>004: #{results[key]["004"]}</li>
							<li>004: #{results[key]["009"]}</li>
							<li>012: #{results[key]["012"]}</li>
						</ul>
					</div>"
		end	
	end
end