require 'json'

class JSONWriter
	def write result,classes
		fJson = File.open("results_Iosyf_Saleh_B_18.json","w")
		fJson.write("{\"results\":[\n").to_json
		result.keys.each do |key|
			#my_json = { :"#{key}" => result[key]}
			#fJson.write(JSON.pretty_generate(my_json))
			#fJson.write("\n")
   			key_split = key.split(",")
    			fJson.write("\n")
   			fJson.write("\t{\n")
   			fJson.write("\t\t\"First Name\":#{key.split(",")[0].to_json}\n")
   			fJson.write("\t\t\"Last Name\":#{key.split(",")[1].to_json}")
    			fJson.write("\n\t\t\"result\":#{result[key].to_json}")
   			fJson.write("\n\t},")
    			#fJson.write("\n")
   		end
  		fJson.write("\n]}").to_json
	end
end
