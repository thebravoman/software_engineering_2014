require 'json'

class JSONWriter
	def write results, time
		File.open("results_Hristo_Dachev_A_29.json", "w") do |f|
			time = {:"Measure time" => time}
			f.write JSON.generate(time)
			f.write JSON.pretty_generate(results)
		end
	end
end