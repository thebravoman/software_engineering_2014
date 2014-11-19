# require 'cgi' # FOR html

class HTMLWriter 
	def write(student)

		file = File.new("results_Ivailo_Ivanov_A_9.html", "w")
		student.keys.sort.each do |key|
		file << "
		<!DOCTYPE html>
			<html>
			<head>
				<title>results_Ivailo_Ivanov_9</title>
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
					</tr>
					</tbody>
				</table>
			</body>
			</html>"
		end
	end
end
