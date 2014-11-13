require 'json'

class JSONWriter
	def write results
		File.open("results_Marian_Belchev_A_17.json", "w") do |f|
			f.write(JSON.pretty_generate(results))
		end
	end
end