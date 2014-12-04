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
				"015" => val[7],
				"017-1" => val[8],
				"017-2" => val[9],
				"g2" => val[10],
				"g3" => val[11],
				"g4" => val[12],
				"g12" => val[13],
				"g14" => val[14],
				"g15" => val[],
				"g17-1" => val[15],
				"y2" => val[16],
				"y3" => val[17],
				"y4" => val[18],
				"y12" => val[19],
				"y14" => val[20],
				"y15" => val[],
				"y17-1" => val[21]
			}
		}
		file.write(hash.sort.to_json)
	end
end
