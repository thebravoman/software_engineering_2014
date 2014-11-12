require 'json'

class JSONWriter
	def write(results)
		File.open("results_Hristiyan_Velyakov_A_28.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
