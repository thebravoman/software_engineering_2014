require 'json'

def write_to_JSON(results)
	File.open("results_Kaloyan_Nikov_B_19.json","w") do |file|
		file.write(results.to_json)
	end
end
