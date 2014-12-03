require 'json'

def write_to_JSON(results,time,name)
	file = File.open("#{name}.json","w")
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
				"017" => val[7],
				"g2" => val[8],
				"g3" => val[9],
				"g4" => val[10],
				"g12" => val[11],
				"g14" => val[12],
				"g17" => val[13],
				"y2" => val[14],
				"y3" => val[15],
				"y4" => val[16],
				"y12" => val[17],
				"y14" => val[18],
				"y17" => val[19]

			}
		}
		file.write(hash.sort.to_json)
	end
end
