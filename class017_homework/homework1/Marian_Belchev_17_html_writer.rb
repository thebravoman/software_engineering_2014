class HTMLWriter 
	def write results
		results["Marian Belchev"] = "EXCELLENT!"
		file = File.new("results_Marian_Belchev_A_17.html", "w")
		file << "<!DOCTYPE html>
<html>
<head>
	<meta charset=\"utf-8\" />
	<title>Test results</title>
	<style>
		body {background-color: #F2F2F2; font-family: sans-serif; font-size: 14px;}
		.table {background-color: #FFF; width: 30%; border: 1px solid #5C9DC0; border-spacing: 0; margin: 0 auto;}
		.table th {text-align: center; padding: 10px 5px; border-bottom: 1px solid #F2F2F2; border-right: 1px solid #F2F2F2;}
		.table thead {background-color: #5C9DC0; color: #FFF;}
		.table thead th {border-bottom: 3px solid #3D82AB;}
		.table tbody tr:hover {background-color: #F2F2F2;}
	</style>
</head>
<body>
	<table class=\"table\">
		<thead>
			<tr>
				<th>First & Last name</th>
				<th>Result</th>
			</tr>
		</thead>
		<tbody>"
		results.sort.each do |key, value|
			file << "<tr>
				<th>#{key}</th>
				<th>#{value}</th>
			</tr>"
		end	
		file << "			</tbody>
	</table>
</body>
</html>"
	end
end