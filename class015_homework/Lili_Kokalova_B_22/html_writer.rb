class HTMLwriter
	def write(time_program, all_students, resultsVH,  results002, results003, results004 , results009, results012, results014, flog002, flog003, flog004, flog012, flog014)
		file = File.new("results_Lili_Kokalova_B_22.html", "w")
		n = 0		
		file << "<div class=\"student\">
				  	<table width=\"100%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
						<tr>Time: #{time_program}</tr>
						<tr>
							<td>First Name</td> 
							<td>Last Name</td>
							<td>VH</td>
							<td>002</td>
							<td>003</td>
							<td>004</td>
							<td>009</td>
							<td>012</td>
							<td>014</td>
							<td>g2</td>
							<td>g3</td>
							<td>g4</td>
							<td>g12</td>
							<td>g14</td>
						</tr>
					</table>
				</div>"
		all_students.each do |first, last|
		file << "<div class=\"student\">
				  	<table width=\"100%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
						<tr>
							<td>#{first}</td>
							<td>#{last}</td>
							<td>#{resultsVH[n]}</td>
							<td>#{results002[n]}</td>
							<td>#{results003[n]}</td>
							<td>#{results004[n]}</td>
							<td>#{results009[n]}</td>
							<td>#{results012[n]}</td>
							<td>#{results014[n]}</td>
							<td>#{flog002[n]}</td>
							<td>#{flog003[n]}</td>
							<td>#{flog004[n]}</td>
							<td>#{flog012[n]}</td>
							<td>#{flog014[n]}</td>
						</tr>
				 	 </table>
				</div>"
			n = n + 1
		end
		
	end
end
