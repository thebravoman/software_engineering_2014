require 'json'

class JSONWriter
	def write results
		File.open("results_Borislav_Rusinov_A_1.json", "w") do |f|
			f.write(JSON.pretty_generate(results))
		end
	end
end
