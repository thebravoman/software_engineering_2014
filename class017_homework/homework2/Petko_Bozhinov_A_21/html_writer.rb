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
		    	<td></td><td>VH</td><td>02</td><td>03</td><td>04</td><td>09</td><td>12</td><td>14</td><td>17.1</td><td>17.2</td>
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
				</tr>"
			end
			myfile.puts "</table>"
			myfile.puts "</body>"
			myfile.puts "</html>"
		end
	end
end