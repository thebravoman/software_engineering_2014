require 'json'

class JSONWriter
	def write(result,classes,folder)
		File.open("results_Konstantin_Kostov_B_21.json","w") do |json|
			json.write(classes.to_json)   #JSON.pretty_generate
			result.keys.sort.each do |key|
				key_split = key.split(",")
				key_split_ = key_split[0] + "_" + key_split[1]
				json.write([key_split_,result[key]].flatten.to_json)
			end
		end
	end
end
