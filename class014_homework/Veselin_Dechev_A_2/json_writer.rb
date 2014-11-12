require 'json'

class JSONWriter
	def write(results)
		File.open("results_Veselin_Dechev_А_2.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
