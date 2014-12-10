require 'json'

class JSONWriter

	def write(results)
	
		File.open("results_Lubomir_Yankov_16_A.json", "w") do |f|
		
			f.write(JSON.pretty_generate(results.sort))
		
		end
	
	end

end
