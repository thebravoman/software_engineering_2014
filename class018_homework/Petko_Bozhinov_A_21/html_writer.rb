# html writer
class HTMLWriter
	def write grades, time
		File.open("results_Petko_Bozhinov_A_21.html", "w") do |myfile| 
			myfile.puts "<!DOCTYPE html>"
			myfile.puts "<html>"
			myfile.puts "<title>HTML Page</title>"
			myfile.puts "<body>"
			myfile.puts "<table border=\"1\" style=\"border-collapse:collapse;\">"
		    myfile.puts "
		    <tr>
		    	<td></td>
		    	<td>VH</td>
		    	<td>02</td>
		    	<td>03</td>
		    	<td>04</td>
		    	<td>09</td>
		    	<td>12</td>
		    	<td>14</td>
		    	<td>17.1</td>
		    	<td>17.2</td>
		    	<td>G02</td>
		    	<td>G03</td>
		    	<td>G04</td>
		    	<td>G12</td>
		    	<td>G14</td>
		    	<td>G17.1</td>
		    	<td>G17.2</td>
		    	<td>Y02</td>
		    	<td>Y03</td>
		    	<td>Y04</td>
		    	<td>Y12</td>
		    	<td>Y14</td>
		    	<td>Y17.1</td>
		    	<td>Y17.2</td>
		    </tr>"
			grades.keys.sort.each do |key|
				myfile.puts "
				<tr>
					<td>
						#{key.split(' ').first} #{key.split(' ').last}
					</td>
					<td>#{grades["#{key}"][0]}</td>
					<td>#{grades["#{key}"][1]}</td>
					<td>#{grades["#{key}"][2]}</td>
					<td>#{grades["#{key}"][3]}</td>
					<td>#{grades["#{key}"][4]}</td>
					<td>#{grades["#{key}"][5]}</td>
					<td>#{grades["#{key}"][6]}</td>
					<td>#{grades["#{key}"][7]}</td>
					<td>#{grades["#{key}"][8]}</td>
					<td>#{grades["#{key}"][9]}</td>
					<td>#{grades["#{key}"][10]}</td>
					<td>#{grades["#{key}"][11]}</td>
					<td>#{grades["#{key}"][12]}</td>
					<td>#{grades["#{key}"][13]}</td>
					<td>#{grades["#{key}"][14]}</td>
					<td>#{grades["#{key}"][15]}</td>
					<td>#{grades["#{key}"][16]}</td>
					<td>#{grades["#{key}"][17]}</td>
					<td>#{grades["#{key}"][18]}</td>
					<td>#{grades["#{key}"][19]}</td>
					<td>#{grades["#{key}"][20]}</td>
					<td>#{grades["#{key}"][21]}</td>
					<td>#{grades["#{key}"][22]}</td>
					<td>#{grades["#{key}"][23]}</td>
				</tr>"
			end
			myfile.puts "</table>"
			myfile.puts "</body>"
			myfile.puts "</html>"
		end
	end
end