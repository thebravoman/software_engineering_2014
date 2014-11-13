require 'json'

class JSONWriter
	def write results
		File.open("results_Hristo_Dachev_A_29.json", "w") do |f|
			f.write(JSON.pretty_generate(results))
		end
	end
end