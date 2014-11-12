
require 'json'
class JSONWriter
	def write whatever		
		File.open("results_Georgi_Velev_B_10.json","w") do |json|
			json.write(whatever.to_json)
		end
	end
end