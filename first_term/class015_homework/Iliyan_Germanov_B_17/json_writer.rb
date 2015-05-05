require 'json'

class JSONWriter
	def write(results, flog, flay)
		results.keys.each do |key|
			results[key]["g2"] = flog[key]["002"]
			results[key]["g3"] = flog[key]["003"]
			results[key]["g4"] = flog[key]["004"]
			results[key]["g12"] = flog[key]["012"]
			results[key]["g14"] = flog[key]["014"]
			results[key]["g15"] = flog[key]["015"]	
			results[key]["y2"] = flay[key]["002"]
			results[key]["y3"] = flay[key]["003"]
			results[key]["y4"] = flay[key]["004"]
			results[key]["y12"] = flay[key]["012"]
			results[key]["y14"] = flay[key]["014"]
			results[key]["y15"] = flay[key]["015"]
		end
		File.open("results_Iliyan_Germanov_B_17.json","w") do |f|
  			f.write(JSON.pretty_generate(results))
		end
	end
end
