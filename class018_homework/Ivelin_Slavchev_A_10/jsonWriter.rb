require 'json'

class JSONWriter

	def write(results)	
		File.open("results_Ivelin_Slavchev_A_10.json", "w") do |f|		
			f.write(JSON.pretty_generate(results))	
		end	
	end

end
