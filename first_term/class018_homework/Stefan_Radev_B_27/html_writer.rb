class HTMLwriter
	def write(time_program, results)
		file = File.new("results_Stefan_Radev_B_27.html", "w")
		file << "<div class=\"student\">
				  	<table width=\"200%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
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
							<td>015</td>
							<td>017h1</td>
							<td>017h2</td>
							<td>018</td>
							<td>g2</td>
							<td>g3</td>
							<td>g4</td>
							<td>g12</td>
							<td>g14</td>
							<td>g15</td>
							<td>g017h1</td>
							<td>g017h2</td>
							<td>g018</td>
							<td>y2</td>
							<td>y3</td>
							<td>y4</td>
							<td>y12</td>
							<td>y14</td>
							<td>y15</td>
							<td>y017h1</td>
							<td>y017h2</td>
							<td>y018</td>
						</tr>
					</table>
				</div>"
		results.keys.sort.each do |k, v|
		file << "<div class=\"student\">
				  	<table width=\"200%\" align=\'center\' cellpadding=\'1\' cellspacing=\'1\' border=\'1\' style=\'table-layout:fixed\'>
						<tr>
							<td>#{k.split("_")[0]}</td>
							<td>#{k.split("_")[1]}</td>
							<td>#{results[k].values[0]}</td>
							<td>#{results[k].values[1]}</td>
							<td>#{results[k].values[2]}</td>
							<td>#{results[k].values[3]}</td>
							<td>#{results[k].values[4]}</td>
							<td>#{results[k].values[5]}</td>
							<td>#{results[k].values[6]}</td>
							<td>#{results[k].values[7]}</td>
							<td>#{results[k].values[8]}</td>
							<td>#{results[k].values[9]}</td>
							<td>#{results[k].values[10]}</td>
							<td>#{results[k].values[11]}</td>
							<td>#{results[k].values[12]}</td>
							<td>#{results[k].values[13]}</td>
							<td>#{results[k].values[14]}</td>
							<td>#{results[k].values[15]}</td>
							<td>#{results[k].values[16]}</td>
							<td>#{results[k].values[17]}</td>
							<td>#{results[k].values[18]}</td>
							<td>#{results[k].values[19]}</td>
							<td>#{results[k].values[20]}</td>
							<td>#{results[k].values[21]}</td>
							<td>#{results[k].values[22]}</td>
							<td>#{results[k].values[23]}</td>
							<td>#{results[k].values[24]}</td>
							<td>#{results[k].values[25]}</td>
							<td>#{results[k].values[26]}</td>
							<td>#{results[k].values[27]}</td>
							<td>#{results[k].values[28]}</td>
						</tr>
				 	 </table>
				</div>"
		end
	end
end
