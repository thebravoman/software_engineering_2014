require 'json'

def write_to_JSON(results,time)
	file = File.open("results_Kaloyan_Nikov_B_19.json","w")
	results.each do |name, val|
		hash = {
			"FirstName" => name.split(' ')[0],
			"LastName" => name.split(' ')[1],
			"results" => {
				"Seconds" => time,
				"VH" => val[0],
				"002" => val[1],
				"003" => val[2],
				"004" => val[3],
				"009" => val[4],
				"012" => val[5],
				"014" => val[6],
				"g2" => val[7],
				"g3" => val[8],
				"g4" => val[9],
				"g12" => val[10],
				"g14" => val[11],
				"y2" => val[12],
				"y3" => val[13],
				"y4" => val[14],
				"y12" => val[15],
				"y14" => val[16]

			}
		}
		file.write(hash.sort.to_json)
	end
end
