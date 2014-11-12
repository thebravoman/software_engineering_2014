require 'json'

def write_to_JSON(results)
<<<<<<< HEAD
	File.open("results_Stanislav_Iliev_B_26.json","w") do |file|
=======
	file = File.open("results_Stanislav_Iliev_B_26.json","w")
>>>>>>> 9caabfd60464ccd49063e997e2084628facfa5b7
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
