require 'json'

class JSONWriter
	def write(results, classes, time)
		File.open("results_Iliyan_Germanov_B_17.json","w") do |f|
  			f.write(JSON.pretty_generate(results.sort))
		end
	end
end
