require 'json'

def write_to_JSON(results)
	File.open("results_Stanislav_Iliev_B_26.json","w") do |file|
		file.write(results.to_json)
	end
end
