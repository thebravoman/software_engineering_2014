require 'json'

class JSONWriter
	def write(results, classes, time)
		File.open("results_Denis_Stoinev_B_13.json","w") do |f|
  			f.write(JSON.pretty_generate(results.sort))
		end
	end
end
