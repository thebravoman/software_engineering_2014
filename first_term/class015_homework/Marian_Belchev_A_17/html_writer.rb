# require 'cgi' # FOR html

class HTMLWriter 
	def write results, time
		file = File.new("results_Marian_Belchev_A_17.html", "w")
		file << "<!DOCTYPE html>
<html>
<head>
	<meta charset=\"utf-8\" />
	<title>Results</title>
	<style>
		body {background-color: #F2F2F2; font-family: sans-serif; font-size: 14px;}
		.table {background-color: #FFF; width: 90%; border: 1px solid #5C9DC0; border-spacing: 0; margin: 0 auto;}
		.table th {text-align: center; padding: 10px 5px; border-bottom: 1px solid #F2F2F2;}
		.table thead {background-color: #5C9DC0; color: #FFF;}
		.table thead th {border-bottom: 3px solid #3D82AB;}
		.table tbody tr:hover {background-color: #F2F2F2;}

		.time {padding: 10px 0; font-weight: bold; text-align: center;}
	</style>
</head>
<body>
	<div class=\"time\">Measure time: #{time}</div>
	<table class=\"table\">
		<thead>
			<tr>
				<th>First & Last name</th>
				<th>VH</th>
				<th>002</th>
				<th>003</th>
				<th>004</th>
				<th>009</th>
				<th>012</th>
				<th>014</th>
				<th>g2</th>
				<th>g3</th>
				<th>g4</th>
				<th>g9</th>
				<th>g12</th>
				<th>g14</th>
				<th>y2</th>
				<th>y3</th>
				<th>y4</th>
				<th>y9</th>
				<th>y12</th>
				<th>y14</th>
			</tr>
		</thead>
		<tbody>"
		results.keys.sort.each do |key|
			file << "<tr>
				<th>#{key}</th>
				<th>#{results[key]["VH"]}</th>
				<th>#{results[key]["002"]}</th>
				<th>#{results[key]["003"]}</th>
				<th>#{results[key]["004"]}</th>
				<th>#{results[key]["009"]}</th>
				<th>#{results[key]["012"]}</th>
				<th>#{results[key]["014"]}</th>
				<th>#{results[key]["g2"]}</th>
				<th>#{results[key]["g3"]}</th>
				<th>#{results[key]["g4"]}</th>
				<th>#{results[key]["g9"]}</th>
				<th>#{results[key]["g12"]}</th>
				<th>#{results[key]["g14"]}</th>
				<th>#{results[key]["y2"]}</th>
				<th>#{results[key]["y3"]}</th>
				<th>#{results[key]["y4"]}</th>
				<th>#{results[key]["y9"]}</th>
				<th>#{results[key]["y12"]}</th>
				<th>#{results[key]["y14"]}</th>
			</tr>"
		end	
		file << "			</tbody>
	</table>
</body>
</html>"
	end
end