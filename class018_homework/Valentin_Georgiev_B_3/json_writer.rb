require 'json'

class JSONWriter
	def write results
		File.open("results_Valentin_Georgiev_B_3.json", "w") do |row|
			row << JSON.generate(results)
		end
	end
end
