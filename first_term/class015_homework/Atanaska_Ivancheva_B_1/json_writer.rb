require 'json'

class JSONWriter
	def write results
		File.open("results_Atanaska_Ivancheva_B_1.json", "w") do |row|
			row << JSON.generate(results)
		end
	end
end
