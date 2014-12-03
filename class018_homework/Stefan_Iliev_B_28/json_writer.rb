require 'json'

class JSONWriter
	def write(results)
		File.open("results_Stefan_Iliev_B_28.json","w") do |f|
  			f.write(results.to_json)
		end
	end
end
