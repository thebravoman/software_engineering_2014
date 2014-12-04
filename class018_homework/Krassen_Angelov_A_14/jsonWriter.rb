require 'json'

class JSONWriter

	def write(results)
	
		File.open("results_Krassen_Angelov_A_14.json", "w") do |f|
		
			f.write(JSON.pretty_generate(results))
		
		end
	
	end

end
