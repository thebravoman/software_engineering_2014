class HTMLWriter
	def write(whatever,classes)
		File.open("results_Georgi_Velev_B_10.html","w") do |line|
			line.puts "<link rel=\"stylesheet\" type=\"text/css\" href=\"results_Georgi_Velev_B_10.css\">" #ednata prostotiq varvi vinagi s drugata
			line.puts "<table>"
			line.puts "<caption>Results</caption>"
			classes.each do |clas| #s class dava error, zashto li pak ne... ami ako iskam da imam promenliva koqto da se kazva class? Trqbva da se misli kato se sazdava ezik
				line.puts "<th>#{clas}</th>"
			end
			whatever.keys.sort.each do |key|
				line.puts "<tr>"
					#"<td>#{key.split(",").first}</td>" zashto pak i tova da trqbva da raboti...
				    stupid_split =key.split(",")
				    #line.puts  "<span>"
				  	line.puts  "<td class=\"name\">#{stupid_split.first}</td>"
				 	line.puts  "<td class=\"name\">#{stupid_split.last}</td>"
				 	line.puts  "<td>#{whatever[key][0]}</td>"
					line.puts  "<td>#{whatever[key][1]}</td>"
					line.puts  "<td>#{whatever[key][2]}</td>"
					line.puts  "<td>#{whatever[key][3]}</td>"
					line.puts  "<td>#{whatever[key][4]}</td>"
					line.puts  "<td>#{whatever[key][5]}</td>"
					#line.puts  "</span>"
				line.puts"</tr>"
			end
			line.puts "</table>"
		end

		File.open("results_Georgi_Velev_B_10.css","w") do |css|
			css.puts "body {text-align: center; background-color: #555555;}"
			css.puts "caption {color:#ff9223; font-size:24; font-style:bold;}"
			css.puts "th {color: #ff128d;}"
			css.puts "table {
			color: #ff128d; 
			border-width: 2px; 
			border-spacing: 3px;
			border-style: dashed; 
			border-color: #13a3ed; 
			border-collapse: separate; 
			background-color: #474747;}"
			css.puts "td { text-align:center;
			font-family:Helvetica; 
			border-width: 1px; 
			font-size:18px; 
			color:#acee12;
			font-style:bold; 
			text-decoration:none; 
			padding: 16px; 
			border-color: #ff128d;
			border-style: dashed;}"
			css.puts ".name {color: #76ade4;}"
		end

	end
end