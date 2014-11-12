require 'json'

class JSONWriter
	def write(results)
		File.open("results_Denis_Stoinev_B_13.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
