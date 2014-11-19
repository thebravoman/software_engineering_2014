class HTMLWriter
	def write(results, header)
		file = File.open("results_Velislav_Kostov_B_7.html", "w")
		
		file.puts "\
<!DOCTYPE html>
<html>
	<head>
		<title>Results</title>
		<style>
			body { background:rgb(233, 76, 14); }
			
			h1 {
				text-align:center;
				color:#fff;
			}
			
			table {
				background-color:#efefef;
				border:8px solid #fff;
				border-radius:10px;
				margin:0 auto 50px auto;
			}
			
				table td {
					border:1px solid #fff;
					padding:2px 6px;
					font-size:15px;
					font-family:Arial, sans-serif;
					color:#555;
				}
				
				table tr:nth-child(odd) td {
					background:#e0e0e0;
				}
				
				.tStyled {
					font-weight:bold;
				}
		</style>
	</head>
	<body>
		<h1>Homeworks overview</h1>
		<table cellspacing='0'>
			<tr>"
			
		for i in 0..header.length-1 do
			file.puts "\t\t\t\t<td class='tStyled'>#{header[i]}</td>"
		end
		
		file.puts "\
			</tr>"
		
		results.each do |k,v| 
			file.print "\
			<tr>
				<td class='tStyled'>"; file.print k.split('_')[0]; file.print "</td>
				<td class='tStyled'>"; file.print k.split('_')[1]; file.print "</td>"
	
			# -2 because the first two elements (the names) are written above
			for i in 0..header.length-3 do
				file.puts
				file.print("\t\t\t\t<td>"); file.print(v[i]); file.print("</td>");
			end
			
			file.puts "
			</tr>"
		end
		
		file.puts "\
		</table>
	<body>
<html>"

	end
end
