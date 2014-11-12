require 'json'

def write_to_JSON(results)
	file = File.open("results_Kaloyan_Nikov_B_19.json","w")
	results.each do |name, val|
		hash = {
			"FirstName" => name.split(' ')[0],
			"LastName" => name.split(' ')[1],
			"results" => {
				"VH" => val[0],
				"002" => val[1],
				"003" => val[2],
				"004" => val[3],
				"009" => val[4],
				"012" => val[5] 
			}
		}
		file.write(hash.sort.to_json)
	end
end
