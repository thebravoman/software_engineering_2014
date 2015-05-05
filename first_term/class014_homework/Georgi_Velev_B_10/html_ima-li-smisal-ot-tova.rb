class HTMLWriter
	def write(whatever,classes)
		File.open("results_Georgi_Velev_B_10.html","w") do |line|
			line.puts "<html>\n<head>\n<title>Results</title>\n
			<link rel=\"stylesheet\" type=\"text/css\" href=\"results_Georgi_Velev_B_10.css\">
			\n</head>\n<body>" 							#ednata prostotiq varvi vinagi s drugata
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
			line.puts "</table>\n<h1>Inspired by Google Material Design</h1></body>\n</html>"
		end

		File.open("results_Georgi_Velev_B_10.css","w") do |css|
			css.puts "body {
					text-align: center;
					background-color: #bdbdbd;
					font-family:\"RobotoDraft\",\"Roboto\",sans-serif;}"
			css.puts "caption {
					color:#ffffff;
					font-size:24;
					font-style:bold;
					background-color: #43a047;
					padding:10px;}"
			css.puts "th {
					background-color:4caf50;
					color:#ffffff;
					border-width: 0px;
					margin:0px;
					padding: 1px 8px;}"
			css.puts "table {
					margin-left: auto;
					margin-right: auto;
					color: #dedede; 
					border-width: 0px; 
					border-spacing: 0px;
					background-color: #ffffff;}"
			css.puts "td {
					text-align:center;
					font-family:Helvetica; 
					font-size:18px; 
					color:#212121;
					font-style:bold; 
					text-decoration:none; 
					padding: 16px;}"
			css.puts ".name {
					color: #212121;
					background-color: e0e0e0;}"
			css.puts "h1 {
					color:#ffffff;
					font-size:11;
					font-style:bold;
					margin:0px -8px;
					margin-bottom: -8px;
					padding: 2px;
					background-color: #43a047;}"
		end

	end
end