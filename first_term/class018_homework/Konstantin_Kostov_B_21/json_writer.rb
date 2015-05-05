
require 'json'
class JSONWriter
	def write(results, classes, folder)
		File.open("results_Konstantin_Kostov_B_21.json","w") do |f|
			f.write(JSON.pretty_generate(results.sort))
		end
	end
end
