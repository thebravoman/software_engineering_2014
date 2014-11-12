require 'json'

class JSONWriter
	def write results
		File.open("results_Kristina_Pironkova_A_22.json", "w") do |f|
			f.write(JSON.pretty_generate(results))
		end
	end
end
