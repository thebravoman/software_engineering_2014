class HTMLwriter
	def write(time_program, all_students, resultsVH, results002, results003, results004, results009, results012, results014, results0171, results0172, flog002, flog003, flog004, flog012, flog014, flog0171, flog0172)
		file = File.new("results_Stefan_Radev_B_27.html", "w")
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
							<td>017h1</td>
							<td>017h2</td>
							<td>g2</td>
							<td>g3</td>
							<td>g4</td>
							<td>g12</td>
							<td>g14</td>
							<td>g17h1</td>
							<td>g17h2</td>
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
							<td>#{results0171[n]}</td>
							<td>#{results0172[n]}</td>
							<td>#{flog002[n]}</td>
							<td>#{flog003[n]}</td>
							<td>#{flog004[n]}</td>
							<td>#{flog012[n]}</td>
							<td>#{flog014[n]}</td>
							<td>#{flog0171[n]}</td>
							<td>#{flog0172[n]}</td>
						</tr>
				 	 </table>
				</div>"
			n = n + 1
		end
		
	end
end
