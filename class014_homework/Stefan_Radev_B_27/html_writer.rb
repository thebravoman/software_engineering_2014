class HTMLwriter
	def write(all_students, resultsVH,  results002, results003, results004 , results009, results012)
		file = File.new("results_Stefan_Radev_B_27.html", "w")
		n = 0
		all_students.each do |first, last|
		file << "<div class=\"student\">
					<h4> #{first} #{last}</h4>
				  	<table>
						<tr>
							<td>VH</td>
							<td>002</td>
							<td>003</td>
							<td>004</td>
							<td>009</td>
							<td>012</td>
						</tr>
						<tr>
							<td>#{resultsVH[n]}</td>
							<td>#{results002[n]}</td>
							<td>#{results003[n]}</td>
							<td>#{results004[n]}</td>
							<td>#{results009[n]}</td>
							<td>#{results012[n]}</td>
						</tr>
				 	 </table>
				</div>"
			n = n + 1
		end
		
	end
end
