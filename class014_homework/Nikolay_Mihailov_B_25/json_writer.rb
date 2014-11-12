require 'json'

class JSONWriter
	def write(result,classes)
		File.open("results_Nikolay_Mihailov_B_25.json","w") do |json|
			json.write(classes.to_json)
			result.keys.sort.each do |key|
				if key.include? ','
					key_split = key.split(",")
					key_split_ = key_split[0] + "_" + key_split[1]
				end
				json.write([key_split_,result[key]].flatten.to_json)
			end
		end
	end
end
