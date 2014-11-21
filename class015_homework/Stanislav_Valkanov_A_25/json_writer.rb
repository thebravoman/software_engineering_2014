require 'json'

class JSONWriter
	def write(results)
		File.open("results_Stanislav_Valkanov_A_25.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
