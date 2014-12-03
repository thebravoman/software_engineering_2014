require 'json'

class JSONWriter
	def write(results, classes)
		File.open("results_Hristiyan_Velyakov_A_28.json","w") do |f|
  			f.write(JSON.pretty_generate(results.sort))
		end
	end
end
