require 'json'

class JSONWriter
	def write results
		File.open("results_Veselina_Kolova_B_8.json", "w") do |row|
			row << JSON.generate(results)
		end
	end
end
