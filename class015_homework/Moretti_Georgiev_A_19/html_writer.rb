# require 'cgi' # FOR html

class HTMLWriter 
	def write(student)

		file = File.new("results_Moretti_Georgiev_A_19.html", "w")
		student.keys.sort.each do |key|
		file << "
		<!DOCTYPE html>
			<html>
			<head>
				<title>results_Moretti_Georgiev_A_19</title>
				<meta charset = \"utf - 8\">
				<style>
					table{width: 70%; border: 1px solid #e5e5e5; font-family: Verdana, Sans-serif; color: #444; margin: 0px auto; text-align:center;}
					th{font-size: 14px;}
					td{font-size: 12px;}
				</style>
			</head>
			<body>
				<table>
					<thead>
						<tr>
							<th>First & Last name</th>
							<th>VN</th>
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
					<tbody>
					<tr>
						<td>#{key}</td>
						<td>#{student[key]["VN"]}</td>
						<td>#{student[key]["002"]}</td>
						<td>#{student[key]["003"]}</td>
						<td>#{student[key]["004"]}</td>
						<td>#{student[key]["009"]}</td>
						<td>#{student[key]["012"]}</td>
						<td>#{student[key]["g2"]}</td>
						<td>#{student[key]["g3"]}</td>
						<td>#{student[key]["g4"]}</td>
						<td>#{student[key]["g9"]}</td>
						<td>#{student[key]["g12"]}</td>
						<td>#{student[key]["g14"]}</td>
						<td>#{student[key]["y2"]}</td>
						<td>#{student[key]["y3"]}</td>
						<td>#{student[key]["y4"]}</td>
						<td>#{student[key]["y9"]}</td>
						<td>#{student[key]["y12"]}</td>
						<td>#{student[key]["y14"]}</td>
					</tr>
					</tbody>
				</table>
			</body>
			</html>"
		end
	end
end