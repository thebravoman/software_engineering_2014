require 'json'

class JSONWriter
	def write(results)
		File.open("results_Simeon_Shopkin_A_23.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
