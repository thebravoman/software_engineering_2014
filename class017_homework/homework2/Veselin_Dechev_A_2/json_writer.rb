require 'json'

class JSONWriter
	def write(results, classes)
		File.open("results_Veselin_Dechev_A_2.json","w") do |f|
  			f.write(JSON.pretty_generate(results.sort))
		end
	end
end
